Project for Getting and Cleaning Data
=============================================================

**Author**: Yangjing Long   
**Date** : 19.09.2014

---------------------------------------------------------

This file devided into 3 parts, the first part describe what the project is, the second part explains how all of the scipts work and how they are connected. The last part is the discription of how run_analysis.R script works.

-----------------------------------------------------------
# Project introduction


The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

----------------------


# Scripts
This package contains 4 files:
- **"README.md"** a readme file, descibes how scripts work and how they are connected.

- **run_analysis.R** 
  This is the R code for runing the required analysis. The resulting file is "tidyData.txt".
  
What you need to do before run it in R:

1. download the file from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. unzip it in the folder "UCI HAR Dataset".

3. set working dictory to be the one with the unziped file in Rstudio: for example, what I did is "setwd("/home/user/data_analysis/getting_data/")"  
 
The more detailed explanation of how run_analysis.R is structured, please find in next Section.
  
- **"tidyData.txt"** a tidy data, containing the results.
   1. it is the result from run_analysis.R
   2. if you download and read it into R, please do:  
   
   ```{r}
       data <- read.table(file_path, header = TRUE)   
       View(data)
```
- **"CodeBook.md"** a makedown CodeBook file,  
it explains all the variables in tidy data, and any transformations or work that been performed to clean up the data.
   
    
# Explanation of run_analysis.R

This a R script doing the following steps:
 
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The following explains how exactly the run_analysi.R works.


#### Pre step ######

read data into R, and combine the vetors into matrix.


##### Step 1 ###########
Merges the training and the test sets to create one data set.

1.1 first change the colomn name of subject and y for both training set and testing set, 

1.2  merge by all the common colomn names.

##### Step 2 ##########

Extracts only the measurements on the mean and standard deviation for each measurement. 

2.1 read "features.txt", extract the colomn number of the measurement on the mean and standard deviations.

2.2 combine mean_col and std_col together, and subset the corresponding colomns to a new data variable called "new_data", because in angle() there are additional vectors. We do not take into account.

##### Step 3 ###############

Uses descriptive activity names to name the activities in the data set

3.1. read the file acitivity_labels.txt and give colomn names

3.2. merge it with the data set file


##### Step 4 ##########

Appropriately labels the data set with descriptive variable names. 

4.1. read the features.txt file, find the corresponding names, 
make a list out of it.

4.2 change the colomn name based on the list.

4.3 delete the "()" in names


##### Step 5 ################

5.1. order the set by first subject and then activity, and also the colomn is reordered to put the activity and subject first and then all other variables.

5.2 write a function my_mean with parameter "activity" and "subject" to caculate the mean of all other variables in the correponding combination of activity and subject.

5.3 caculate my_mean for all combinations of activity and subject, convert it as data.frame and merge them together to "data"

5.4 save data to tidyData.txt by write.table(). The data can be read into R by 

     data <- read.table(file_path, header = TRUE)
     View(data)




