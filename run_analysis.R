## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Data table and reshape2 package installation is required.

require("data.table")
require("reshape2")

# Load activity labels and data column names
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract only the measurements on the mean and standard deviation for each measurement.
# test and train data set
extractfeatures <- grepl("mean|std", features)

# Load and process all test and train data.
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(Xtest) = features
Xtest = Xtest[,extractfeatures]

ytest[,2] = activitylabels[y_test[,1]]
names(ytest) = c("ActivityID", "ActivityLabel")
names(subjecttest) = "subject"

Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(Xtrain) = features
Xtrain = Xtrain[,extractfeatures]

ytrain[,2] = activitylabels[ytrain[,1]]
names(ytrain) = c("ActivityID", "ActivityLabel")
names(subjecttrain) = "subject"

# Merge test and train data
testdata <- cbind(as.data.table(subjecttest), ytest, Xtest)
traindata <- cbind(as.data.table(subjecttrain), ytrain, Xtrain)
data = rbind(testdata, traindata)

idlabels   = c("subject", "ActivityID", "ActivityLabel")
datalabels = setdiff(colnames(data), idlabels)
meltdata      = melt(data, id = idlabels, measure.vars = datalabels)

# Apply mean function to the dataset
tidydata   = dcast(meltdata, subject + ActivityLabel ~ variable, mean)

# output using write.table
write.table(tidy_data, file = "./tidy_data.txt", row.names=FALSE)

## The tidy data output in CSV format
outputFile <- "./tidydata.txt" 
print(paste("Writing file '", outputFile, "'...", sep = ""))
write.csv(tidydata, file=outputFile, quote=FALSE, row.names=FALSE)
