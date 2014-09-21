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

The physical quantites reported are the mean values from each of the test and  training data sets merged together.  THe original 10299 measurements were summarized across the combinations of subject and activity.  These values are normalized

The quantity names are preserved from the original data set as the are sufficiently descriptive without being rediculously long.  The general format has the following noteworthy patterns:

First letter, 't' or 'f' for whether the quantity is measured from time series data or the fourier transform of the time series.

Next comes a designator of "Body"" or "Gravity" -- because accelerometers are sensitive to acceleration, the original time series data was separated with a low pass filer of 0.3Hz.  Signals faster than this are attributable to the subject undergoing the activity and are designated "Body".  Signals slower than this are environmental or instrumental in origin and are labeled "Gravity". "BodyBody" is used for some mearuements at the end in some of the frequency domain analysis values, but the orignal data set does not document what they mean -- what's a boy to do??!.  

Thirdly there is a designator of the insturment from which the feature being reported originated.  "Acc" for the accelerometer, "AccJerk" for the first derivative of the accelerometer, "Gyro" for gyroscope angular rates, "GyroJerk" for first derivative of angular rates.  "Mag" is appended when the value is for the vector magnitude of the quantites.

Fourth, after a '.' is either "mean" or "std" desingating wether the values reported are derived from a mean or standard deviation of the original time series.  To be clear, the values in this data set are the mean of reported mean and std's in the original data set.  <u> Caveat emptor here for anyone wanting to acutally use data such as these, because means of means, depending on how they originall were derived, can do bad things to ones statistal distribution.  </u>

Lastly, for the values where vector components are reported, the "X", "Y" or "Z" is reported at the end.  The values that report magnitudes are the vector sum of these, and again, this could do bad things with respect to the underlying parent statistical distribution.  



##"tBodyAcc.mean...X","tBodyAcc.mean...Y","tBodyAcc.mean...Z"
Mean values that I compouted of the mean values reported from the original time series data

"tBodyAcc.std...X","tBodyAcc.std...Y","tBodyAcc.std...Z"

"tGravityAcc.mean...X","tGravityAcc.mean...Y","tGravityAcc.mean...Z"

"tGravityAcc.std...X","tGravityAcc.std...Y","tGravityAcc.std...Z"

"tBodyAccJerk.mean...X","tBodyAccJerk.mean...Y","tBodyAccJerk.mean...Z"

"tBodyAccJerk.std...X","tBodyAccJerk.std...Y","tBodyAccJerk.std...Z"

"tBodyGyro.mean...X","tBodyGyro.mean...Y","tBodyGyro.mean...Z"

"tBodyGyro.std...X","tBodyGyro.std...Y","tBodyGyro.std...Z"

"tBodyGyroJerk.mean...X","tBodyGyroJerk.mean...Y","tBodyGyroJerk.mean...Z"

"tBodyGyroJerk.std...X","tBodyGyroJerk.std...Y","tBodyGyroJerk.std...Z"

"tBodyAccMag.mean..","tBodyAccMag.std.."

"tGravityAccMag.mean..", "tGravityAccMag.std.."

"tBodyAccJerkMag.mean..","tBodyAccJerkMag.std.."

"tBodyGyroMag.mean..","tBodyGyroMag.std.."

"tBodyGyroJerkMag.mean..","tBodyGyroJerkMag.std.."

"fBodyAcc.mean...X","fBodyAcc.mean...Y","fBodyAcc.mean...Z"

"fBodyAcc.std...X","fBodyAcc.std...Y","fBodyAcc.std...Z"

"fBodyAccJerk.mean...X","fBodyAccJerk.mean...Y","fBodyAccJerk.mean...Z"

"fBodyAccJerk.std...X","fBodyAccJerk.std...Y","fBodyAccJerk.std...Z"

"fBodyGyro.mean...X","fBodyGyro.mean...Y","fBodyGyro.mean...Z"

"fBodyGyro.std...X","fBodyGyro.std...Y","fBodyGyro.std...Z"

"fBodyAccMag.mean..","fBodyAccMag.std.."

"fBodyBodyAccJerkMag.mean..","fBodyBodyAccJerkMag.std.."

"fBodyBodyGyroMag.mean..","fBodyBodyGyroMag.std.."

"fBodyBodyGyroJerkMag.mean..","fBodyBodyGyroJerkMag.std.."

#Missing Data: None
