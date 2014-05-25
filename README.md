Getting and Cleaning Data Coursework README
========================================================

The package is for the course word of "Getting and Cleaning Data". It is checked in at
https://github.com/acp05zw/gcdcoursework.git

The data set is downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Based on the data set, the goals are
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Create the second, independent tidy data set with the average of each variable for each activity and each subject

# Ideas
The structure of the data set directory looks like below (copied from the README.txt in the package)

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

The data really interests us are:
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The data files in Inertial Signals are the raw data which are not suitable for our the goals.

The overview of steps to clean the data set is listed below, more details can be found in the
script. The comments should be clean enough to reproduce the results.
* Step 0: Prepare the data package
* Step 1: Load data into the memory
* Step 2: Prepare train and test datasets for merging
* Step 3: Merge train and test datasets
* Step 4: Split mean and standard deviation from merged dataset
* Step 5: Store the dataset to a text file
* Step 6: Create the second, independent tidy data set with the average of each variable for each activity and each subject
** More detailed steps are described in the script file.

# What are inside
* README.md - This file. 
* CodeBook.md - Code book for the example data sets
* cleaned.txt - Generated merged and clean data
* average.txt - The average of each variable for each activity and each subject
* run_analysis.R - The script to generate cleaned.txt and average.txt

# How to run the script
Place the run_analysis.R into your working directory of R, then source('run_analysis.R')
The script automatically 
* downloads the zip file if not presents
* unpacks the zip file
* reads in the related data files
* merges and extracts the wanted data sets
* writes the results to cleaned.txt and average.txt
