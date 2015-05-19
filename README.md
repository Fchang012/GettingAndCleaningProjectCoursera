Getting and Cleaning Data Course Project
==========================================
This repository hosts the R script and documentation files for the "Getting and Cleaning Data" course project.
The dataset used in this project can be found at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Files
The R script assumes that all the data has been uncompressed in to a folder called "UCI HAR Dataset" which should be located in the working directory with none of the file names changed.
`CodeBook.md` describes the variables, the data, and any work that was done to transform the raw data into a tidy data set.
`run_analysis.R` contains the code to transform the data into a tidy data set and to perform the analysis required in this project.

###**NOTE** Working Directory Must Be Set
The script assumes that the working directory contains a folder called "UCI HAR Dataset" with the data uncompressed and none of the file names changed. This can be found on line 6 of the script. Please set the working directory accordingly. 

## Project Instruction
The following objectives are called for in this project:
You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
