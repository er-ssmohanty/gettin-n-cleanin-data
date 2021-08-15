Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
NB: This R script can be run in any directory, as it downloads the zipfile and unzips it and chooses the appropriate working directory. However if you have already downloaded and unzipped the dataset then just run the script in the 'UCI Har Dataset' or the custom named folder.
* The run_analysis.R script performs the following steps to clean the data:   
 1. Read X_train.txt, y_train.txt and subject_train.txt from the "train" folder and store them in *xtrain*, *ytrain* and *trainsubject* variables respectively.
 2. *xtrain*, *ytrain* and *trainsubject* are concatenated by cbind function to create *traindata*.     
 3. Read X_test.txt, y_test.txt and subject_test.txt from the "test" folder and store them in *xtest*, *ytest* and *testsubject* variables respectively.  
 4. *xtest*, *ytest* and *testsubject* are concatenated by cbind function to create *testdata*.
 5.  Concatenate *testdata* to *traindata* to generate a 10299x561 data frame, *alldata*; concatenate *testLabel* to *trainLabel* to generate a 10299x1 data frame, *joinLabel*; concatenate *testSubject* to *trainSubject* to generate a 10299x1 data frame, *joinSubject*.  
 6. Read the features.txt file and store the data in a variable called *features*. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of *joinData* with the 66 corresponding columns.  
 7. Clean the column names of the subset. We remove spaces, brackets, hyphens,and other symbols in the names and change the case to lower.
 8. The shortenings are removed and replaced with their full terms like "time","frequency", "accelerometer", "gyroscope", etc.   
 9. Read the activity_labels.txt file and store the data in a variable called *activity*.  
 10. Clean the activity names in the second column of *activity*. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.  
 11. Transform the values of *joinLabel* according to the *activity* data frame.  
 12. Combine the *joinSubject*, *joinLabel* and *joinData* by column to get a new cleaned 10299x68 data frame, *cleanedData*. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.  
 13. Write the *cleanedData* out to "tidy_ds1.txt" file in current working directory.  
 14. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the *result* data frame and performing the two for-loops, we get a 180x68 data frame.
 15. Write the *result* out to a text file named "tidy_ds2.txt" in current working directory. 
