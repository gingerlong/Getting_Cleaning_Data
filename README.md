README.md
=============================================================
auther: Yangjing Long



This package contains 4 files:
- **"README.md"** a readme file
can be run in Rstudio, it explains how all of the scipts work and how they are connected.


- **run_analysis.R**
 a R script doing the following steps:
 
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

What you need to do before run it in R:
#### Pre step ######

1. download the file from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. unzip it in the folder "UCI HAR Dataset"

3. in Rstudio: setwd("/home/user/data_analysis/getting_data/")
 
- **"tidyData.txt"** a tidy data 
   1. it is the result from run_analysis.R
   2. if you download and read it into R, please do:
    data <- read.table(file_path, header = TRUE) #if they used some other way of saving the file than a default write.table, this step will be different
    
- **"CodeBook.md"** a makedown CodeBook file
  1. can be run in Rstudio
  2. explains all the variables in tidy data, and any transformations or work that been performed to clean up the data.
    View(data)
    
## The following explains how exactly the run_analysi.R works.


#### Pre step ######

read data into R, and combine the vetors into matrix.


##### Step 1 ###########
Merges the training and the test sets to create one data set.

1.1 first change the colomn name of subject and y for both training set and testing set, 

1.2  merge by all the common colomn names.

##### Step 2 ##########

Extracts only the measurements on the mean and standard deviation for each measurement. 

2.1 read "features.txt", extract the colomn number of the measurement on the mean and standard deviations.

2.2 combine mean_col and std_col together, and subset the corresponding colomns to a new data variable called "new_data"

expain why taking mean() and std()

because in angle() there are additional vectors. We do not take into account.

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



## The following is the discription given by the instructor for reference.
-----------------------------------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 You should create one R script called run_analysis.R that does the following. 

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 

    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

----------------------

