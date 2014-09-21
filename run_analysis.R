run_analysis<-function()
{
  
  # this script is the code used to merge and tidy the Getting and Cleaning data Prjoect
  # Because this script prompts the user for the location of the data set, 
  #   which is contained in a directory "/UCI HAR DATASET", no input velues are needed
  #   the ... argument was included for future use to allow some flexibility
  
  # See the README.md for details about the data set and what this script is intended
  #   to do.
  
  # Step 1: load plyr package, which is used for the
  
  package_test<-suppressPackageStartupMessages(require(plyr))
  if (package_test==FALSE)
  {
    print(c("This function requires the plyr package, please install it before running."))
    return(NULL)
    
  }
  
  
  # step two, where is the data set


  if (file.exists('UCI HAR Dataset')) 
  {
    # data file directory is there, carry on
    dir1<-c('UCI HAR Dataset')
  }
  
  else
  {
    
    cat("Enter the path to the UCI HAR Dataset directory:")
    input1<-readLines(n=1)
    if (file.exists(c(input1,'/UCI HAR Dataset')))
    {
      
      dir1<-c(input1,'/UCI HAR Dataset')
    }
    else
    {
      print(c("Data not found at location ",c(dir1,'/UCI HAR Dataset')))
            
      return(NULL)
            
    }
    
    
  }
  
  # OK, now we either have a the data set location or we've dumped back to prompt
  # so now we read in the files
  
  # read in the list of features
  featurelist<-read.table('UCI HAR Dataset//features.txt',col.name=c("index","features"))

  
  #read in the activity name list
  activity_labels<-read.table('UCI HAR Dataset//activity_labels.txt',col.name=c("index","Activity"))
  
  # read in the subject number lists
  subject_test<-read.table('UCI HAR Dataset//test/subject_test.txt',col.name=c("Subject"))
  subject_train<-read.table('UCI HAR Dataset//train/subject_train.txt',col.name=c("Subject"))
  
  # read in activity data 
  
  ydata_test<-read.table('UCI HAR Dataset//test/y_test.txt',col.name="Activity")
  ydata_train<-read.table('UCI HAR Dataset//train/y_train.txt',col.name="Activity")
  
  #read in the main data tables
  xdata_test<-read.table('UCI HAR Dataset//test/X_test.txt',col.name=featurelist$features)
  xdata_train<-read.table('UCI HAR Dataset//train/X_train.txt',col.name=featurelist$features)
  
  
  #merge subject list
  subject<-rbind(subject_train,subject_test)
  
  #merge activity list
  
  activity<-rbind(ydata_train,ydata_test)
  
  # replace numeric activity with string values
  
  # merge training and test sets
  xdata<-rbind(xdata_train,xdata_test)
  
  #merge subject column with main data
  
  dataset<-cbind(subject,activity,xdata)
  
  # find the column that are the have the mean and std. dev. of the measurements
  # these are the features the names of which contain the literal strings "mean()"
  # and "std()"
                         
  meancol<-suppressWarnings(grepl("mean\\(\\)",featurelist$feature))
  
  stdcol<-suppressWarnings(grepl("std\\(\\)",featurelist$feature))
  
  #merge these and put them back in order using a binary OR
  
  col<-meancol | stdcol
  
  #subset the main data set
  
  dataset_col<-dataset[,c(TRUE,TRUE,col)]      
  
  # tidy up the set by making the activities a factor using the activity labels above
  
  dataset_col$Activity<-factor(dataset_col$Activity,levels=c(1,2,3,4,5,6),labels=activity_labels$Activity)
  
  # now we need to return a tidy set of the means for each activity and subject
  
  # many thanks to the post by Guillermo Castellanos https://class.coursera.org/getdata-007/forum/thread?thread_id=215
  mean_dataset<-ddply(dataset_col,.variables=c("Subject","Activity"),.fun=numcolwise(mean))
  
  
  
  #write the dataset to the text file using write.table with row.name=FALSE in tab separated format
  #outputs file "DataScienceClass_GettingAndCleaning_ProjectData.txt" to working dir
  
  write.table(mean_dataset,file="DataScienceClass_GettingAndCleaning_ProjectData.txt",row.name=FALSE,sep="\t")
  
  
  
  #return dataset
  
  mean_dataset
  
  
}