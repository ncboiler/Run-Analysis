
library(dplyr)

#load the features list into R to rename column names later and turn it onto a vector
features <- read.table("./UCI HAR Dataset/features.txt")
featureVext <- features[,2]

#load the Xtest data into R
Xtest <-read.table("./UCI HAR Dataset/test/X_test.txt")

#load the Y test data into R to get activies
Ytest <-read.table("./UCI HAR Dataset/test/Y_test.txt")

#load the test subject data into R
Testsubjest <-read.table("./UCI HAR Dataset/test/subject_test.txt")

#set the column names of Xtest to the feature names so it makes sense
names(Xtest) <- featureVext

#combine the Xtest data and Y test data to add activities to Xtest and change col name to Activity
Xtest <- cbind(Ytest, Xtest)
colnames(Xtest)[1] <- "Activity"

#combine the testsubject DF to the Xtest DF 
Xtest <- cbind(Testsubjest, Xtest)
colnames(Xtest)[1] <- "Subject"

#load the Xtrain data into R
Xtrain <-read.table("./UCI HAR Dataset/train/X_train.txt")

#load the Y train data into R to get activies
Ytrain <-read.table("./UCI HAR Dataset/train/Y_train.txt")

#load the train subject data into R
Trainsubject <-read.table("./UCI HAR Dataset/train/subject_train.txt")

#set the column names of Xtest to the feature names so it makes sense
names(Xtrain) <- featureVext

#combine the Xtrain data and Ytrain data to add activities to Xtest and change col name to Activity
Xtrain <- cbind(Ytrain, Xtrain)
colnames(Xtrain)[1] <- "Activity"

#combine the train subject DF with the Xtrain DF
Xtrain <- cbind(Trainsubject, Xtrain)
colnames(Xtrain)[1] <- "Subject"

#merge the test data and train data into one
TestData <- rbind(Xtest, Xtrain)

#change Activity values to something that makes sense
for (i in 1:nrow(TestData)){
        if (TestData[i,2] == 1){
                TestData[i,2] <- "walking"
        }
        else if (TestData[i,2] == 2){
                TestData[i,2] <- "Walking Upstairs"
        }
        else if (TestData[i,2] == 3){
                TestData[i,2] <- "Walking Downstairs"
        }
        else if (TestData[i,2] == 4){
                TestData[i,2] = "Sitting"
        }
        else if (TestData[i,2] == 5) {
                TestData[i,2] <- "Standing"
        }
        else {
                TestData[i,2] <- "Laying"
        }
}

#pair down the data frame to only measurements of mean and sdev
KeepMean <- grep("mean", names(TestData))
TestDataMean <- TestData[,KeepMean]
KeepStd <- grep("std", names(TestData))
TestDataStd <- TestData[,KeepStd]
TestData <- TestData[c(1,2,KeepStd, KeepMean)]

## This section of the code creates a data set with the average of each variable 
##for each activity and each subject.

#get the everages of each variable and create a line for each
GroupAverages <- aggregate(TestData[,3:ncol(TestData)], list(TestData$Subject), mean)
GroupAverages <- rbind(GroupAverages,aggregate(TestData[,3:ncol(TestData)], 
                                               list(TestData$Activity),mean))
colnames(GroupAverages)[1] <-"Average of Subjects and Activities"

#remove the mess of unneeded variables in the envirnment
remove(features, TestDataStd, TestDataMean, Testsubjest, Trainsubject, Xtest, Xtrain, Ytrain,
       Ytest, featureVext, i, KeepMean, KeepStd)