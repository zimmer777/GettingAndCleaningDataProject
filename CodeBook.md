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

Each row of the data set contains:

Subject Number, Activity, [table of average values for each of 66 physical quantity]

Subject Number: 1-30, integer values

The activities are (self-explanitory - see google if you don't understand what these are):

WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

The physical quantites reported are the mean values from each of the test and training data sets merged together.  THe original 10299 measurements were summarized across the combinations of subject and activity.

The quantity names are preserved from the original data set as the are sufficiently descriptive without being rediculously long.  The general format has the following noteworthy patterns:

First letter, 't' or 'f' for whether the quantity is measured from time series data or the fourier transform of the time series.

Next comes a designator of "Body"" or "Gravity" -- because accelerometers are sensitive to acceleration, the original time series data was separated with a low pass filer of 0.3Hz.  Signals faster than this are attributable to the subject undergoing the activity and are designated "Body".  Signals slower than this are environmental or instrumental in origin and are labeled "Gravity".

Thirdly there is a designator of the insturment from which the feature being reported originated.  



"tBodyAcc.mean...X","tBodyAcc.mean...Y","tBodyAcc.mean...Z"

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

Missing Data: None
