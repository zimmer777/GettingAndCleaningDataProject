Getting and Cleaning Data Project
-----------------------------------------------------------------------------


title: "Cleaning Data Project"
author: "Dr.Zed"
date: "Thursday, September 18, 2014"
output: html_document


This document is the ReadMe for the class project for the Coursera Data Science -- Getting and Cleaning Data Class.  It describes the execution of this project and documents the content and all the steps required to create it.  

The input data set comes from a UCI archive of physical activity data here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and the data set itself was obtained from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A script called run_analysis.R in this repo performs all the required tasks for the project:

1) Checks for the plyr package which is needed for the summarizing of the dataset

2) Ask user where the data set directory ('/UCI HAR DATASET') is.  If blank, is uses the current directory

3) reads the training and test data sets into separate data frames using read.table

4) merges the two data sets into one and merge the descriptor columns

5) Extracts only the measurements on the mean() and std() for each measurement

6) Updates activity names as a factor using the activity list

7) Renames variables to a more descriptive form, as is needed for a tidy data set

8) Creates a separate tidy data set with the average of each activity and subject using write.table() with row.name=FALSE.

The resulting tidy data set is stored in this repo as "DataScienceClass_GettingAndCleaning_ProjectData.txt" and the codebook describing the tidy set is CodeBook.md .



