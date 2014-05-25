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

# Data fields
The data fields in cleaned.txt and average.txt are list below:
* subjuct is the subject id
* activity.id is the id of the activity
* activity is the descriptive name of the activity
* The meaning of other fields can be found in the features_info.txt in the data set package.

## Data fields in cleaned.txt
 [1] "subject"                   "activity.id"               "activity"                 
 [4] "tBodyAcc.mean.X"           "tBodyAcc.mean.Y"           "tBodyAcc.mean.Z"          
 [7] "tBodyAcc.std.X"            "tBodyAcc.std.Y"            "tBodyAcc.std.Z"           
[10] "tGravityAcc.mean.X"        "tGravityAcc.mean.Y"        "tGravityAcc.mean.Z"       
[13] "tGravityAcc.std.X"         "tGravityAcc.std.Y"         "tGravityAcc.std.Z"        
[16] "tBodyAccJerk.mean.X"       "tBodyAccJerk.mean.Y"       "tBodyAccJerk.mean.Z"      
[19] "tBodyAccJerk.std.X"        "tBodyAccJerk.std.Y"        "tBodyAccJerk.std.Z"       
[22] "tBodyGyro.mean.X"          "tBodyGyro.mean.Y"          "tBodyGyro.mean.Z"         
[25] "tBodyGyro.std.X"           "tBodyGyro.std.Y"           "tBodyGyro.std.Z"          
[28] "tBodyGyroJerk.mean.X"      "tBodyGyroJerk.mean.Y"      "tBodyGyroJerk.mean.Z"     
[31] "tBodyGyroJerk.std.X"       "tBodyGyroJerk.std.Y"       "tBodyGyroJerk.std.Z"      
[34] "tBodyAccMag.mean"          "tBodyAccMag.std"           "tGravityAccMag.mean"      
[37] "tGravityAccMag.std"        "tBodyAccJerkMag.mean"      "tBodyAccJerkMag.std"      
[40] "tBodyGyroMag.mean"         "tBodyGyroMag.std"          "tBodyGyroJerkMag.mean"    
[43] "tBodyGyroJerkMag.std"      "fBodyAcc.mean.X"           "fBodyAcc.mean.Y"          
[46] "fBodyAcc.mean.Z"           "fBodyAcc.std.X"            "fBodyAcc.std.Y"           
[49] "fBodyAcc.std.Z"            "fBodyAccJerk.mean.X"       "fBodyAccJerk.mean.Y"      
[52] "fBodyAccJerk.mean.Z"       "fBodyAccJerk.std.X"        "fBodyAccJerk.std.Y"       
[55] "fBodyAccJerk.std.Z"        "fBodyGyro.mean.X"          "fBodyGyro.mean.Y"         
[58] "fBodyGyro.mean.Z"          "fBodyGyro.std.X"           "fBodyGyro.std.Y"          
[61] "fBodyGyro.std.Z"           "fBodyAccMag.mean"          "fBodyAccMag.std"          
[64] "fBodyBodyAccJerkMag.mean"  "fBodyBodyAccJerkMag.std"   "fBodyBodyGyroMag.mean"    
[67] "fBodyBodyGyroMag.std"      "fBodyBodyGyroJerkMag.mean" "fBodyBodyGyroJerkMag.std" 

## Data fields in average.txt
[1] "subject"                           "activity.id"                       "activity"                          "average.tBodyAcc.mean.X"          
 [5] "average.tBodyAcc.mean.Y"           "average.tBodyAcc.mean.Z"           "average.tBodyAcc.std.X"            "average.tBodyAcc.std.Y"           
 [9] "average.tBodyAcc.std.Z"            "average.tGravityAcc.mean.X"        "average.tGravityAcc.mean.Y"        "average.tGravityAcc.mean.Z"       
[13] "average.tGravityAcc.std.X"         "average.tGravityAcc.std.Y"         "average.tGravityAcc.std.Z"         "average.tBodyAccJerk.mean.X"      
[17] "average.tBodyAccJerk.mean.Y"       "average.tBodyAccJerk.mean.Z"       "average.tBodyAccJerk.std.X"        "average.tBodyAccJerk.std.Y"       
[21] "average.tBodyAccJerk.std.Z"        "average.tBodyGyro.mean.X"          "average.tBodyGyro.mean.Y"          "average.tBodyGyro.mean.Z"         
[25] "average.tBodyGyro.std.X"           "average.tBodyGyro.std.Y"           "average.tBodyGyro.std.Z"           "average.tBodyGyroJerk.mean.X"     
[29] "average.tBodyGyroJerk.mean.Y"      "average.tBodyGyroJerk.mean.Z"      "average.tBodyGyroJerk.std.X"       "average.tBodyGyroJerk.std.Y"      
[33] "average.tBodyGyroJerk.std.Z"       "average.tBodyAccMag.mean"          "average.tBodyAccMag.std"           "average.tGravityAccMag.mean"      
[37] "average.tGravityAccMag.std"        "average.tBodyAccJerkMag.mean"      "average.tBodyAccJerkMag.std"       "average.tBodyGyroMag.mean"        
[41] "average.tBodyGyroMag.std"          "average.tBodyGyroJerkMag.mean"     "average.tBodyGyroJerkMag.std"      "average.fBodyAcc.mean.X"          
[45] "average.fBodyAcc.mean.Y"           "average.fBodyAcc.mean.Z"           "average.fBodyAcc.std.X"            "average.fBodyAcc.std.Y"           
[49] "average.fBodyAcc.std.Z"            "average.fBodyAccJerk.mean.X"       "average.fBodyAccJerk.mean.Y"       "average.fBodyAccJerk.mean.Z"      
[53] "average.fBodyAccJerk.std.X"        "average.fBodyAccJerk.std.Y"        "average.fBodyAccJerk.std.Z"        "average.fBodyGyro.mean.X"         
[57] "average.fBodyGyro.mean.Y"          "average.fBodyGyro.mean.Z"          "average.fBodyGyro.std.X"           "average.fBodyGyro.std.Y"          
[61] "average.fBodyGyro.std.Z"           "average.fBodyAccMag.mean"          "average.fBodyAccMag.std"           "average.fBodyBodyAccJerkMag.mean" 
[65] "average.fBodyBodyAccJerkMag.std"   "average.fBodyBodyGyroMag.mean"     "average.fBodyBodyGyroMag.std"      "average.fBodyBodyGyroJerkMag.mean"
[69] "average.fBodyBodyGyroJerkMag.std" 
