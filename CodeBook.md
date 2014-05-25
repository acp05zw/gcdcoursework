Getting and Cleaning Data Coursework CodeBook
========================================================

# Variables
Following major variables are used in the script:
### activityLabels
The data set extracted from activity_labels.txt
### features
The data set extracted from features.txt
### xTrain
The data set extracted from X_train.txt
### yTrain
The data set extracted from y_train.txt
### subjectTrain
The data set extracted from subject_train.txt
### xTest
The data set extracted from X_test.txt
### yTest
The data set extracted from y_test.txt
### subjectTest
The data set extracted from subject_test.txt
### testdf
The data frame for "test" data
### traindf
The data frame for "train" data
### meanstd
Extracted measurements of mean and standard deviation
### dataset
Merged and clean data set, the final outcome
### average
The final outcome of the average of each variable for each activity and each subject
### subjectdf
Measurements related to the specific subject
### activitydf
Measurements related to the specific activity of the specific subject
### measuremeans
The average of each measurement

# Transformations
The data sets are mainly operated as data.frame. 
xTrain, yTrain, subjectTrain are merged into single data.frame, "traindf".
xTest, yTest, subjectTest are merged into single data.frame, "testdf".
Then testdf and traindf are merged into dataset, labels based on features are assigned to the new data.frame.
The "dataset" is reduced to only contain mean and std measurements.

To calculate "average", a loop is adopted. It first iterates all subjects(1:30) to extract measurements only related to the subject. Then iterate the activity list to extract the related measurements and calculate the averge of each measurement. After this, the average data is added to "average" date frame.
