---
title: "CodeBook.md"
author: "Dr.Zed"
date: "Sunday, September 21, 2014"
output: html_document
---

This document is the code book for the class project for the Coursera Data Science -- Getting and Cleaning Data Class.  It describes the data set created in the execution of this project and documents the content and all the steps required to create it.  

The input data set comes from a UCI archive of physical activity data here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and the data set itself was obtained from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

These oringinal data were produced by Jorge L. Reyes-Ortiz et al. and entitled "Human Activity Recognition Using Smartphones Data Set".  The description of the data set is "Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors."   

The raw data set is broken up into several files which the run_analysis.R script in this repo was deisnged to merge, subset and make tidy.  

The resulting output data set is "DataScienceClass_GettingAndCleaning_ProjectData.txt" which contains the average values of each of the measured physical quantities of the 30 test subjects in each of 6 activities.  The subjects are referred to only by number.  

#Each row of the data set contains:

Subject Number, Activity, [table of average values for each of 66 physical quantity]

#Subject Number:
1-30, integer values

#Activities: 
The activities are (self-explanitory - see google if you don't understand what these are):

WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

#Quantities

The physical quantites reported are the mean values from each of the test and  training data sets merged together.  THe original 10299 measurements were summarized across the combinations of subject and activity.  These values are normalized to fall in the range [-1 1] and so have no units.  From a physicist's viewpoint, "WAI??!!".

The quantity names are preserved from the original data set as the are sufficiently descriptive without being rediculously long.  The general format has the following noteworthy patterns:

First letter, 't' or 'f' for whether the quantity is measured from time series data or the fourier transform of the time series.

Next comes a designator of "Body"" or "Gravity" -- because accelerometers are sensitive to acceleration, the original time series data was separated with a low pass filer of 0.3Hz.  Signals faster than this are attributable to the subject undergoing the activity and are designated "Body".  Signals slower than this are environmental or instrumental in origin and are labeled "Gravity". "BodyBody" is used for some mearuements at the end in some of the frequency domain analysis values, but the orignal data set does not document what they mean -- what's a boy to do??!.  

Thirdly there is a designator of the insturment from which the feature being reported originated.  "Acc" for the accelerometer, "AccJerk" for the first derivative of the accelerometer, "Gyro" for gyroscope angular rates, "GyroJerk" for first derivative of angular rates.  "Mag" is appended when the value is for the vector magnitude of the quantites.

Fourth, after a '.' is either "mean" or "std" desingating wether the values reported are derived from a mean or standard deviation of the original time series.  To be clear, the values in this data set are the mean of reported mean and std's in the original data set.  <u> Caveat emptor here for anyone wanting to acutally use data such as these, because means of means, depending on how they originall were derived, can do bad things to ones statistal distribution.  </u>

Lastly, for the values where vector components are reported, the "X", "Y" or "Z" is reported at the end.  The values that report magnitudes are the vector sum of these, and again, this could do bad things with respect to the underlying parent statistical distribution.  



##"tBodyAcc.mean...X","tBodyAcc.mean...Y","tBodyAcc.mean...Z"
Mean values that I computed of the mean values reported from the original time series data from the accelerometer high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"tBodyAcc.std...X","tBodyAcc.std...Y","tBodyAcc.std...Z"
Mean values that I computed of the standard deviation values reported from the original time series data from the accelerometer high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"tGravityAcc.mean...X","tGravityAcc.mean...Y","tGravityAcc.mean...Z"
Mean values that I computed of the mean values reported from the original time series data from the accelerometer low-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"tGravityAcc.std...X","tGravityAcc.std...Y","tGravityAcc.std...Z"
Mean values that I computed of the standard deviation values reported from the original time series data from the accelerometer low-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"tBodyAccJerk.mean...X","tBodyAccJerk.mean...Y","tBodyAccJerk.mean...Z"
Mean values that I computed of first differences of the mean values of first differences reported from the original time series data from the accelerometer high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"tBodyAccJerk.std...X","tBodyAccJerk.std...Y","tBodyAccJerk.std...Z"
Mean values that I computed of the standard deviation values of first differences reported from the original time series data from the accelerometer high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"tBodyGyro.mean...X","tBodyGyro.mean...Y","tBodyGyro.mean...Z"
Mean values that I computed of the mean values reported from the original time series data from the gyroscope high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"tBodyGyro.std...X","tBodyGyro.std...Y","tBodyGyro.std...Z"
Mean values that I computed of the standard deviation values reported from the original time series data from the gyroscope high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"tBodyGyroJerk.mean...X","tBodyGyroJerk.mean...Y","tBodyGyroJerk.mean...Z"
Mean values that I computed of the mean values of the first differences reported from the original time series data from the gyroscope high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"tBodyGyroJerk.std...X","tBodyGyroJerk.std...Y","tBodyGyroJerk.std...Z"
Mean values that I computed of the standard deviation values reported from the original time series data from the gyroscope high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"tBodyAccMag.mean..","tBodyAccMag.std.."
Mean values that I computed of the mean and standard deviation of the vector magnitude values reported from the original time series data from the accelerometer high-pass filtered at 0.3Hz normalized to be in the range [-1,+1].

##"tGravityAccMag.mean..", "tGravityAccMag.std.."
Mean values that I computed of the mean and standard deviation of the vector magnitude values reported from the original time series data from the accelerometer low-pass filtered at 0.3Hz normalized to be in the range [-1,+1].

##"tBodyAccJerkMag.mean..","tBodyAccJerkMag.std.."
Mean values that I computed of the mean and standard deviation of the vector magnitude of the first differences of values reported from the original time series data from the accelerometer high-pass filtered at 0.3Hz normalized to be in the range [-1,+1].

##"tBodyGyroMag.mean..","tBodyGyroMag.std.."
Mean values that I computed of the mean and standard deviation of the vector magnitude of the first differences of values reported from the original time series data from the gyroscope high-pass filtered at 0.3Hz normalized to be in the range [-1,+1].

##"tBodyGyroJerkMag.mean..","tBodyGyroJerkMag.std.."
Mean values that I computed of the mean and standard deviation of the vector magnitude of the first differences of values reported from the original time series data from the gyroscope high-pass filtered at 0.3Hz normalized to be in the range [-1,+1].  (If anybody reviewing this for class read this far, thanks.)

##"fBodyAcc.mean...X","fBodyAcc.mean...Y","fBodyAcc.mean...Z"
Mean values that I computed of the mean frequency domain values reported from the original time series data from the accelerometer high-pass filtered at 0.3Hz normalized to be in the range [-1,+1]. (Seriously, you are awesome.)

##"fBodyAcc.std...X","fBodyAcc.std...Y","fBodyAcc.std...Z"
Mean values that I computed of the std frequency domain values reported from the original time series data from the accelerometer high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"fBodyAccJerk.mean...X","fBodyAccJerk.mean...Y","fBodyAccJerk.mean...Z"
Mean values that I computed of the mean first difference frequency domain values reported from the original time series data from the accelerometer high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"fBodyAccJerk.std...X","fBodyAccJerk.std...Y","fBodyAccJerk.std...Z"
Mean values that I computed of the std of first difference frequency domain values reported from the original time series data from the accelerometer high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"fBodyGyro.mean...X","fBodyGyro.mean...Y","fBodyGyro.mean...Z"
Mean values that I computed of the mean frequency domain values reported from the original time series data from the gyroscope high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively. (Seriously, you are awesome.)

##"fBodyGyro.std...X","fBodyGyro.std...Y","fBodyGyro.std...Z"
Mean values that I computed of the std frequency domain values reported from the original time series data from the gyroscope high-pass filtered at 0.3Hz normalized to be in the range [-1,+1] in each of the X,Y,Z directions respectively.

##"fBodyAccMag.mean..","fBodyAccMag.std.."
Mean values that I computed of the mean and standard deviation of the vector magnitude frequency domain values reported from the original time series data from the accelerometer high-pass filtered at 0.3Hz normalized to be in the range [-1,+1].

##"fBodyBodyAccJerkMag.mean..","fBodyBodyAccJerkMag.std.."
Mean values that I computed of the mean and standard deviation of the first differences of the vector magnitude frequency domain values reported from the original time series data from the accelerometer high-pass filtered at 0.3Hz normalized to be in the range [-1,+1]. The "BodyBody" designation is undefined in the documentation of the original data set.  May well be a typo.  If it is important to your work, take it up with the contacts listed in the original work.

##"fBodyBodyGyroMag.mean..","fBodyBodyGyroMag.std.."
Mean values that I computed of the mean and standard deviation of the vector magnitude frequency domain values reported from the original time series data from the gyroscope high-pass filtered at 0.3Hz normalized to be in the range [-1,+1]. The "BodyBody" designation is undefined in the documentation of the original data set.  May well be a typo.  If it is important to your work, take it up with the contacts listed in the original work.

##"fBodyBodyGyroJerkMag.mean..","fBodyBodyGyroJerkMag.std.."
Mean values that I computed of the mean and standard deviation of the first differences of the vector magnitude frequency domain values reported from the original time series data from the gyroscope high-pass filtered at 0.3Hz normalized to be in the range [-1,+1]. The "BodyBody" designation is undefined in the documentation of the original data set.  May well be a typo.  If it is important to your work, take it up with the contacts listed in the original work.

#Missing Data: None - all of the datasets used were complete
