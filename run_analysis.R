## Create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Read activity labels
activity_labels <- read.table ("./UCI HAR Dataset/activity_labels.txt")

## Read features
features <- read.table ("./UCI HAR Dataset/features.txt", colClasses = c("integer", "character"))

## Read test
X_test <- read.table ("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table ("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table ("./UCI HAR Dataset/test/subject_test.txt")
test <- data.frame (subject_test, y_test, X_test)
names (test) <- c("Subject", "Activity", features [,2])

## Read train
X_train <- read.table ("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table ("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table ("./UCI HAR Dataset/train/subject_train.txt")
train <- data.frame (subject_train, y_train, X_train)
names (train) <- c("Subject", "Activity", features [,2])

## Merge test and train
data <- rbind (test, train)
data$Subject <- as.factor (data$Subject)
data$Activity <- as.factor (data$Activity)

## Extract mean and standard deviation from test and train
extract_features <- c (1, 2, grep ("mean()", names (data), fixed=TRUE), grep ("std()", names (data), fixed=TRUE))
extract_features <- sort.int (extract_features)
data <- data [,extract_features]

## Replace activity labels names
levels (data$Activity) <- activity_labels [,2]

## Replace labels of data set with descriptive labels
names (data) <- gsub ("^t", "Time ", names (data))
names (data) <- gsub ("^f", "Frequency ", names (data))
names (data) <- gsub ("BodyBody", "Body", names (data))
names (data) <- gsub ("Body", "Body ", names (data))
names (data) <- gsub ("Gravity", "Gravity ", names (data))
names (data) <- gsub ("Acc", "Accelerometer ", names (data))
names (data) <- gsub ("Jerk", "Jerk ", names (data))
names (data) <- gsub ("Gyro", "Gyroscope ", names (data))
names (data) <- gsub ("Mag", "Magnitude ", names (data))
names (data) <- gsub (".mean..", "(mean)", names (data))
names (data) <- gsub (".std..", "(std)", names (data))
names (data) <- gsub (".X", "-X", names (data))
names (data) <- gsub (".Y", "-Y", names (data))
names (data) <- gsub (".Z", "-Z", names (data))

## Average of each subjects and activities
data <- data [with (data, order (data$Subject, data$Activity)),]
average_data <- aggregate (data[c(-1:-2)], by = list (data$Activity, data$Subject), FUN=mean)
average_data <- data.frame (average_data[,2], average_data[,1], average_data[c(-1,-2)])
names (average_data) <- names (data)

## Create file with tidy data
write.table (average_data, file="tidy_data.txt", row.names=FALSE)