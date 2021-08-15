Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

__NB: This R script can be run in any directory, as it downloads the zipfile and unzips it and chooses the appropriate working directory. However if you have already downloaded and unzipped the dataset then just run the script in the 'UCI Har Dataset' or the custom named folder.__
The run_analysis.R script performs the following steps to clean the data:   
 1. Read X_train.txt, y_train.txt and subject_train.txt from the "train" folder and store them in *xtrain*, *ytrain* and *trainsubject* variables respectively.
 2. *xtrain*, *ytrain* and *trainsubject* are concatenated by cbind function to create *traindata*. The new two columns are named as "subject" and "activity".    
 3. Read X_test.txt, y_test.txt and subject_test.txt from the "test" folder and store them in *xtest*, *ytest* and *testsubject* variables respectively.  
 4. *xtest*, *ytest* and *testsubject* are concatenated by cbind function to create *testdata*.The new two columns are named as "subject" and "activity".
 5.  Concatenate *testdata* to *traindata* by rbind function to generate a 10299x561 data frame, *alldata*.  
 6. Read the features.txt file and store the data in a variable called *features*. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list called *featlist*. Then we take a subset of *alldata* with the 66 corresponding columns only.  
 7. Clean the column names of the subset. We remove spaces, brackets, hyphens,and other symbols in the names and change the case to lower.
 8. The shortenings are removed and replaced with their full terms like "time","frequency", "accelerometer", "gyroscope", etc.   
 9. Read the activity_labels.txt file and store the data in a variable called *activity*.  
 10. Clean the activity names in the second column of *activity*. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.  
 11. Transform the values of *activity* column of *alldata* according to the *activity* data frame.
 13. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the *result* data frame, we get a 180x68 data frame.

