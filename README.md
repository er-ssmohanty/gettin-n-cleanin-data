# gettin-n-cleanin-data
Peer-graded Assignment: Getting and Cleaning Data Course Project [https://www.coursera.org] [John Hopkins University]
=====================================================================================================================
This file describes how run_analysis.R script works.
* This script is written by keeping user convenience in mind.
* To get the two datasets just run the following two lines of code in any R console.
```
source("run_analysis.R") #make sure the R script file is in the working directory
a=main_()                #the main_() function will return a list of 2 dataframes we want
merged_dtframe = a[[1]]  #created by merging the training and the test sets; its dimension=10299*68
groupedmean_df = a[[2]]  #created by averaging the values of each variable grouped by activity & subject of "merged_dtframe"; its dimension 180*68
View(merged_dtframe)     #To view the 1st dataframe
View(groupedmean_df)     #To view the 2nd dataframe
write.table(merged_dtframe,"tidy_ds1.txt",row.name=FALSE)       #To save the 1st dataframe as a textfile
write.table(groupedmean_df,"tidy_ds2.txt",row.name=FALSE)       #To save the 2nd dataframe as a textfile
```
* Thus, we have got the two dataframes in two text files. The first and second texftfile would take nearly 8.3 MB and 225 KB of disk-space respectively.
* You might notice that the 2nd dataframe has 180 entries. It is because we got the combination of all 6 activities and 30 test participants.
* We can use the following code to retrieve the dataframes anytime from their respective text file. 
```
merged_dtframe <- read.table("tidy_ds1.txt")
groupedmean_df <- read.table("tidy_ds2.txt)
```
