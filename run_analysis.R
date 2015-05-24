
#Load required packages
library(dplyr)
library(LaF)
library(tidyr)

#Download archive with the data
url_1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url_1,"prog.zip",method="curl")

#Unzip the data
unzip("prog.zip")

#Remove archive
file.remove("prog.zip")

#Read the test and the training data sets
laf_test <-laf_open_fwf("UCI HAR Dataset/test/X_test.txt", column_types=rep("numeric",561), column_widths=rep(16,561))
X_test<-laf_test[,]

laf_train <-laf_open_fwf("UCI HAR Dataset/train/X_train.txt", column_types=rep("numeric",561), column_widths=rep(16,561))
X_train<-laf_train[,]

#Read the test and the training labels
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")

#Read the test and the training subjects.
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")

#Merge subjects, labels and data sets
test_one<-cbind(subject_test,y_test,X_test)
train_one<-cbind(subject_train,y_train,X_train)

#Merges the training and the test sets to create one data set.
that_one<-rbind(train_one,test_one)

#Read the class labels with their activity names
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt", sep = " ",stringsAsFactors =FALSE)
names(activity_labels)<-c("labels_number","activity")

#Read the list of all features
features<-read.table("UCI HAR Dataset/features.txt", sep = " ",stringsAsFactors =FALSE)

#Uses descriptive activity names to name the activities in the data set
names(that_one)<-c("subject","labels_number",features[,2])

#Appropriately labels the data set with descriptive variable names
that_two<-merge(activity_labels,that_one,by.y = "labels_number", by.x = "labels_number", all.y = TRUE)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
std_mean_clmn<-grep("mean\\()|std\\()", names(that_two))
that_three<-that_two[,c(1:3,std_mean_clmn)]



#Create a second, independent tidy data set with the average of each variable for each activity and each subject.

#Create a data frame tbl.
raw_data<-tbl_df(that_three)

#Take multiple columns with measurements and collapse into key-value pairs
tidy_data<-gather(raw_data,measurement,value,-c(labels_number,activity,subject))

#Select columns without labels_numbers
tidy_data<-select(tidy_data,-labels_number)

#Group data by each measurement, each activity and each subject
tidy_data<-group_by(tidy_data,activity,subject,measurement)

#Find average of each variable for each activity and each subject
tidy_data<-summarize(tidy_data,AVG_value=mean(value))

#Write txt file with tidy data
write.table(tidy_data,"UCI HAR Dataset/tidy_data_set.txt",row.name=FALSE) 


