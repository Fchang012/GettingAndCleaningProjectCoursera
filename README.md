Getting and Cleaning Data Course Project
==========================================
This repository hosts the R script and documentation files for the "Getting and Cleaning Data" course project.
The dataset used in this project can be found at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Files
The R script assumes that all the data has been uncompressed into the working directory with none of the file names changed.

`CodeBook.md` describes the variables, the data, and any work that was done to transform the raw data into a tidy data set.

`run_analysis.R` contains the code to transform the data into a tidy data set and to perform the analysis required in this project.

###NOTE: Working Directory Must Be Set
The script assumes that the working directory contains the data uncompressed with none of the file names changed. This can be found on line 6 of the script. Please set the working directory accordingly when running the script. 

##Description of how the script works and how it meets the course project objectives.
###Step 1: Merges the training and the test data sets to create one large data set.
The working directory is set to C:/Users/Frank/Desktop/Coursera/Getting and Cleaning Data which is where the uncompressed data files are and the following files are read into R:
- x_test.txt
- x_train.txt
- y_test.txt
- y_train.txt
- subject_test.txt
- subject_train.txt
- features.txt
- activity_labels.txt

After reading in the raw data, the column names were relabeled using the labels from features.txt and then merged into one large data frame named "finalDF".

###Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
Using the grep function, the script finds all the column labels with "mean()" or "std()" and returns the column index of them from "finalDF". The script then also adds the column index for the subject and activity columns. Using those indexes, the script then extracts those columns from "finalDF" and stores it into a new data frame called "extractDF"


###Step 3: Uses descriptive activity names to name the activities in the data set
The script re-assigns the values in the "Activity" column from their numeric representation to their actual activity name using factor() and referencing the "activity_labels.txt" file that was read in earlier.


###Step 4: Appropriately labels the data set with descriptive activity names. 
Using gsub(), "t", "Acc", "Gyro", "Mag", "f", and "BodyBody" were pattern matched from the column names and re-labeled to make them more human readable.


###Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Using the aggregate() function, the script subsets the data by Subject and Activity and applies the mean function to those subsets. It then takes the result and stores it into a data frame called "TidyData" and then exports/writes a new txt file called "TidyData.txt".
