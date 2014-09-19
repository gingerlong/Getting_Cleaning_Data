#Step 1 Merges the training and the test sets to create one d

test_subject <- read.table("./test/subject_test.txt", head = FALSE)
test_X <- read.table("./test/X_test.txt", head = FALSE)
test_Y <- read.table("./test/y_test.txt", head = FALSE)

train_subject <- read.table("./train/subject_train.txt", head = FALSE)
train_X <- read.table("./train/X_train.txt", head = FALSE)
train_Y <- read.table("./train/y_train.txt", head = FALSE)

# change colnames

colnames(test_subject) <- "subject"
colnames(test_Y) <- "activity"

colnames(train_subject) <- "subject"
colnames(train_Y) <- "activity"

# merge test data into one file

data.test <- cbind(test_X, test_Y, test_subject)
data.train <- cbind(train_X, train_Y, train_subject)

merge.data <- merge(data.train, data.test, all = TRUE)

# Extracts only the measurements
# on the mean and standard deviation for each measurement. 

features <- read.table("./features.txt", head = FALSE)

mean_col <- grep("mean()", features$V2)

std_col <- grep("std()", features$V2)

all_col <- union(mean_col, std_col)

all_col <- append(all_col, c(562, 563))

new_data <- merge.data[, all_col]

## step 3. give names to the ativity

#3.1. read the file acitivity_labels.txt and give colomn names

activity <- read.table("./activity_labels.txt", head = FALSE)
colnames(activity) <- c("activity", "activity names")

#3.2. merge it with the data set file

data_act <- merge(new_data, activity, by.x = "activity", by.y = "activity", sort= FALSE)

### Step 4 : rename the variables ##############

names <- colnames(data_act)

names1 <- sub("V","", names)

colnames(data_act) <- names1

#delete the bracket in feature names
new<- features[,2]
features[, 2] <- gsub("\\( | \\)", "", new)
features[, 2] <- gsub("\\)", "", features[,2])

#match and change names

match <-  match(names1, features[, 1])
match <- na.omit(match)
match <- as.vector(match)

colnames(data_act) [2:80] <- features[ match , 2]

########### step 5 #########

data_order <-data_act[with(data_act, order(activity, subject)), ]
data_reorder <- data_order[ , c(1, 81, 2:80)]

my_mean <- function(act, sub)
{
  new.file <- subset(data_reorder, activity == act & subject == sub)
  me <-apply(new.file, 2, mean)
#  return(me)
}



data <- data.frame(t(my_mean(1,1)))

for (i in 1:6){
   for (j in 1:30){
       add_data<- data.frame(t(my_mean(i,j)))
       data <- merge(data, add_data, all = TRUE)
     } 
}

#change the activity number back to activity names


data <- merge(data, activity, by.x = "activity", by.y = "activity", sort= FALSE)

# delete the activity number line.

data$activity <- NULL

data <- data[ , c(1, 81, 2:80)]

write.table(data, file ="./tidyData.txt", row.name = FALSE)
