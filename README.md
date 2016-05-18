The R script in this repository is part of the Getting and Cleaning Data Course Project at Courera.org.  The data was collected from the accelerometers from the Samsung S2 phone as part of creating an algorithm to better track user's activity.

The data for this project is from  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

More information about this data can be found here:
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

And the raw data can be found here:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A discription of the test, and data parsed from it,  can be found in the features.txt file.  

This project's goal was to take the original study data and manipulate via R script it n the following way;

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement.
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To run the scrip, the raw data must be unzipped into the defualt directory, one directory below the working directory.  Two data frames will be created.  One, called TestData, which is the data created from steps 1 - 4 from above, and a data frame called GroupAverages, which is the data created by step number 5 from above.  




