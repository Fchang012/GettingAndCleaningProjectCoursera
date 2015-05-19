library(dplyr)

# Coursera Course Project

# Setting the working directory to where the raw data is. This can be changed depending on where the data is.
setwd("C:/Users/Frank/Desktop/Coursera/Getting and Cleaning Data")

##Step 1 Merges the training and the test sets to create one data set.
# Reading in the observational data
xTest <- read.table("test/X_test.txt", header=FALSE)
xTrain <- read.table("train/X_train.txt", header=FALSE)

# Reading in the Labels
yTest <- read.table("test/y_test.txt", header=FALSE)
yTrain <- read.table("train/y_train.txt", header=FALSE)

# Reading in the subjects
subTest <- read.table("test/subject_test.txt", header=FALSE)
subTrain <- read.table("train/subject_train.txt", header=FALSE)

# Reading in features
features <- read.table("features.txt", head=FALSE)

# Reads in the activity labels
ActivityLabels <- read.table("activity_labels.txt", header=FALSE)

# Creating the raw data frames
mainDF <- rbind(xTest, xTrain)
labelDF <- rbind(yTest, yTrain)
subDF <- rbind(subTest, subTrain)

# Relabeling columns
names(labelDF) <- c("Activity")
names(subDF) <- c("Subject")
names(mainDF) <- features$V2

# Merge all the parts to create the complete raw data frame
finalDF <- cbind(mainDF, subDF, labelDF)

##Step 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# Finds the column indexes of the variables with "mean" or "std".
# Then also adds the "Activity" and "Subject" indexes to the find.
meanSTD <- grep("mean\\(\\)|std\\(\\).*", names(finalDF), ignore.case=TRUE)
meanSTD <- c(meanSTD, 562,563)

# Extracts the wanted variables into a new data frame.
extractDF <- finalDF[,meanSTD]

##Step 3 Uses descriptive activity names to name the activities in the data set
# Re-labels the Activity column from the number representation to their actual labels referenced in ActivityLabels list
extractDF$Activity <- factor(extractDF$Activity, labels = ActivityLabels$V2)

##Step 4 Appropriately labels the data set with descriptive variable names.
names(extractDF) <- gsub("^t", "Time", names(extractDF))
names(extractDF) <- gsub("Acc", "Accelerometer", names(extractDF))
names(extractDF) <- gsub("Gyro", "Gyroscope", names(extractDF))
names(extractDF) <- gsub("Mag", "Magnitude", names(extractDF))
names(extractDF) <- gsub("^f", "Frequency", names(extractDF))
names(extractDF) <- gsub("BodyBody", "Body", names(extractDF))

##Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Subsets the data by Subject and Activity and then applies the mean function to those subsets
TidyDF <- aggregate(.~Subject + Activity, extractDF, FUN = mean)
TidyDF <- TidyDF[order(TidyDF$Subject, TidyDF$Activity),]

# Writing the Tidy Data set to a file called "TidyData.txt"
write.table(TidyDF, file = "TidyData.txt", row.name=FALSE)
