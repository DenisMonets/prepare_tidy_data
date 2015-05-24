# prepare_tidy_data
Getting and Cleaning Data Course Project

I make tidy data in a different order from the assignment.

1.Merges the training and the test sets to create one data set.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

You can read comments in the code, and i discribe all steps here one more time. What is in the data you can read in the code book.

1.Load required packages: LaF (for fast access to large ASCII files), dplyr and tidyr to make a tidy data.
2.Download archive with the data.
3.Unzip the data.
4.Remove archive.
5.Read the test and the training data sets.
6.Read the test and the training labels.
7.Read the test and the training subjects.
8.Merge subjects, labels and data sets.
9.Merge the training and the test sets to create one data set.
10.Read the class labels with their activity names.
11.Read the list of all features.
12.Uses descriptive activity names to name the activities in the data set
13.Appropriately labels the data set with descriptive variable names
14.Extracts only the measurements on the mean and standard deviation for each measurement.
15.Create a second, independent tidy data set with the average of each variable for each activity and each subject.
16.Take multiple columns with measurements and collapse into key-value pairs
17.Select columns without labels_numbers
18.Group data by each measurement, each activity and each subject
19.Find average of each variable for each activity and each subject
20.Write txt file with tidy data


