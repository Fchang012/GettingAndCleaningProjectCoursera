# Getting and Cleaning Data Project
------------------------------------
This code book describes the variables, the data, and any transformations or work that was performed to clean up the data in the UCI HAR Dataset.
The dataset used can be found [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Original Source of the dataset: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Data Set Info
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##Description of the 5 Steps
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