# Getting and Cleaning Data Course Project
This file cotains the description of the data, variables and any Transormation on the raw data required to complete this Project.
### Data
The link to the dataset used for this project has been mentioned in the Readme.md file, kindly refer it for the same.

### Dataset Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

### Values of Variables

* Values of variable Activity consist of data from:
Y_train.txt & Y_test.txt
* Values of variable Subject consist of data from:
subject_train.txt & subject_test.txt
* Values of variable features consist of data from:
X_train.txt & X_test.txt
* Names of variable features come from:
features.txt
* Levels of variable Activity come from:
activity_labels.txt

It is hence convinient to use Activity, Subject and Features as part of descriptive variable names for data in data frame.

##### Attribute Information:

For each record in the dataset it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment. 

See Readme file into 'UCI HAR Dataset' for more information.

### Raw Data Transformation

* Step 1
Read the data from files into variables. Six variables for different files mentioned above.
* Step 2
Merge the training and test sets to create one data set.
* Step 3
Set names to variables.
* Step 4
Merge columns to get the data.
* Step 5
Extract all measurements on the mean and standard deviation for each measurement.
* Step 6
Read in the Activity labels and factorize the variables according to Subject and Activity label.
* Step 7
Appropiately label the data set with descriptive variable names like:

prefix t is replaced with time, 
prefix f is replaced with frequency, 
prefix Acc is replaced with Accelerometer, 
prefix Gyro is replaced with Gyroscope, 
prefix Mag is replaced with Magnitude, 

## Create a Tidy data set with average of each variable for each activity and each subject.
The tidy data set contains :

* an identifier of the subject who carried out the experiment (__Subject__). Its range is from 1 to 30. 
* an activity label (__Activity__): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* mean of all other variables are measurement collected from the accelerometer and gyroscope 3-axial raw signal (numeric value)

The variable name convention is like the following: 

* __measurement__: the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk).  Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable: gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean,tBodyGyroJerkMean.

* __.mean/std__: mean or standard deviation of the measurement
* __.X/Y/Z__: one direction of a 3-axial signal
* __.mean__: global mean value  
