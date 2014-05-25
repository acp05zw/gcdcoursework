## Part 1: Prepare a merged clean dataset
## Target:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names. 

# Step 0: Prepare the data package
if(!file.exists("UCI HAR Dataset.zip"))
{
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, dest="UCI HAR Dataset.zip", method="curl")    
}

prepareDataPackage <- function(file, destdir = ".")
{
    if(file.exists(file))
        unzip(file, exdir = destdir)
}

if(!file.exists("UCI HAR Dataset"))
    prepareDataPackage("UCI HAR Dataset.zip")

# Step 1: Load data into the memory
activityLabels <- read.table("UCI HAR DataSet/activity_labels.txt")
features <- read.table("UCI HAR DataSet/features.txt")

xTrain <- read.table("UCI HAR DataSet/train/X_train.txt")
yTrain <- read.table("UCI HAR DataSet/train/y_train.txt")
subjectTrain <- read.table("UCI HAR DataSet/train/subject_train.txt")

xTest <- read.table("UCI HAR DataSet/test/X_test.txt")
yTest <- read.table("UCI HAR DataSet/test/y_test.txt")
subjectTest <- read.table("UCI HAR DataSet/test/subject_test.txt")

# Step 2: Prepare train and test datasets for merging
testdf <- cbind(subjectTest$V1, merge(yTest, activityLabels, by.x="V1", by.y="V1", all = TRUE), xTest)
traindf <- cbind(subjectTrain$V1, merge(yTrain, activityLabels, by.x="V1", by.y="V1", all = TRUE), xTrain)

# Assigning labels to datasets
labels <- gsub("-", ".", features$V2)
labels <- gsub("\\(\\)", "", labels)
labels <- c("subject", "activity.id", "activity", labels)

names(testdf) <- labels
names(traindf) <- labels

# Step 3: Merge train and test datasets
dataset <- rbind(testdf, traindf)

# Step 4: Split mean and standard deviation from merged dataset
meanstd <- grep(".mean|.std", labels, value = TRUE)
meanstd <- meanstd[!meanstd %in% grep("meanFreq", meanstd, value = TRUE)]

dataset <- dataset[, c("subject", "activity.id", "activity", meanstd)]

# Step 5: Store the dataset to a text file
write.table(dataset, "cleaned.txt")

## Part 2: Create the second, independent tidy data set with the average 
## of each variable for each activity and each subject

# A empty data frame for storing the new data set
average <- data.frame()
# A loop to iterate each subject in the merged, clean dataset
for (subject in 1:30)
{
    # Extract the dataset only for the subject
    subjectdf <- dataset[dataset$subject == subject,]
    # Iterate activity list to find out measurements related to a specific activity
    for(activity in activityLabels$V2)
    {
        # Extract data set for the activity
        activitydf <- subjectdf[subjectdf$activity == activity,]
        # If no data recorded for the activity, then skip to next loop
        if(dim(activitydf)[1] == 0)
            next
        # Calcualte the average of each measurement
        measuremeans <- sapply(activitydf[, 4:length(names(activitydf))], mean)
        # Modify the names
        names(measuremeans) <- gsub(" ", "", paste("average.",names(measuremeans)))
        # Attach the average data to the data frame.
        average <- rbind(average, cbind(activitydf[1,1:3], as.data.frame(as.list(measuremeans))))
    }
}
# Store the data set to a text file.
write.table(average, "average.txt")
