# Getting and Cleaning Data: Assignment 4

## Requirements

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Instructions

1. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Add run_analysis.R file in the parent folder of UCI HAR Dataset, then set it as your working directory
3. Run the command  ```source("run_analysis.R") ```, this will generate a new file tiny_data.txt in your working directory.
4. tidydata.txt output file is created. Note: After you run this program rename the tidydata.txt file extension to .csv like tidydata.csv. The data is more readable in Excel.

## Execution steps for run_analysis.R
1. Data table and reshape2 package installation is required
2. Load activity labels and data column names
3. Extract only the measurements on the mean and standard deviation for each measurement, for test and train data set.
4. Load and process all test and train data.
5. Merge test and train data and pply mean function to the dataset.
6. The tidy data output in CSV format, tidydata.txt (comma seperated).


## Dependencies

The required packages are data.table and reshape2. the run_analysis.R file will install the packages if not installed already.

