## Script Title: run_analysis.R.

## Script Objectives: 

## 1. Download and input specfied UCI HAR Dataset from the following URL: 

## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## 2. Meet the following Project Specified Tasks:

## a.  As directed:

## (1) Merge the training and the test sets to create one data set.
## (2) Extract only the measurements on the mean and standard deviation for each measurement. 
## (3) Use descriptive activity names to name the activities in the data set
## (4) Appropriately label the data set with descriptive activity names. 
## (5) Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

## 3. Script to meet requirements of Project Specified Task "Merge the training and the test sets to create one data set."

## a. Import training data and identify columns from the dataset by name: 

features <- read.table('./features.txt',header=FALSE);
activityLabels <- read.table('./activity_labels.txt',header=FALSE); 
        colnames(activityLabels) <- c("activityId","activityType");
subjectTrain <- read.table('./train/subject_train.txt',header=FALSE); 
        colnames(subjectTrain) <- "subjectId";
xTrain <- read.table('./train/x_train.txt',header=FALSE); colnames(xTrain) <- features[,2];
yTrain <- read.table('./train/y_train.txt',header=FALSE); colnames(yTrain) <- "activityId";

## b. Merge data into a complete training dataset:

trainingSet = cbind(yTrain,subjectTrain,xTrain);

## c. Import test data and identify columns from the dataset by name:

subjectTest <- read.table('./test/subject_test.txt',header=FALSE); 
        colnames(subjectTest) <- "subjectId";
xTest <- read.table('./test/x_test.txt',header=FALSE); colnames(xTest) <- features[,2];
yTest <- read.table('./test/y_test.txt',header=FALSE); colnames(yTest) <- "activityId";

## d. Merge data into a complete test dataset:

testSet = cbind(yTest,subjectTest,xTest);

## e. Combine Training and Test Datasets into one Merged Dataset:

MergedDataSet = rbind(trainingSet,testSet);

## f. Establish columns vector to prepare data for subsetting:

columns <- colnames(MergedDataSet);

## 4. Script to meet requirements of Project Specified Task "Extract only the measurements on the mean and standard deviation for each measurement."

## a. Establish a vector that desingates the ID, mean and stddev columns as TRUE:

vector <- (grepl("activity..",columns) | grepl("subject..",columns) | grepl("-mean..",columns) &
                  !grepl("-meanFreq..",columns) & !grepl("mean..-",columns) | 
                        grepl("-std..",columns) & !grepl("-std()..-",columns));

## b. Update MergedDataSet based on previously identified columns:

MergedDataSet <- MergedDataSet[vector==TRUE];

## 5. Script to meet requirements of Project Specified Task "Use descriptive activity names to name the activities in the data set."

MergedDataSet <- merge(MergedDataSet,activityLabels,by='activityId',all.x=TRUE);
        MergedDataSet$activityId <-activityLabels[,2][match(MergedDataSet$activityId, activityLabels[,1])] 

columns <- colnames(MergedDataSet);

## 6. Script to meet requirements of Project Specified Task "Appropriately label the data set with descriptive activity names."

## a. Clean and Tidy column names

for (i in 1:length(columns)){
                columns[i] <- gsub("\\()","",columns[i])
                columns[i] <- gsub("-std$","StdDev",columns[i])
                columns[i] <- gsub("-mean","Mean",columns[i])
                columns[i] <- gsub("^(t)","time",columns[i])
                columns[i] <- gsub("^(f)","freq",columns[i])
                columns[i] <- gsub("([Gg]ravity)","Gravity",columns[i])
                columns[i] <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",columns[i])
                columns[i] <- gsub("[Gg]yro","Gyro",columns[i])
                columns[i] <- gsub("AccMag","AccMagnitude",columns[i])
                columns[i] <- gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",columns[i])
                columns[i] <- gsub("JerkMag","JerkMagnitude",columns[i])
                columns[i] <- gsub("GyroMag","GyroMagnitude",columns[i])},
              
## b. Update MergedDataSet with new descriptive column names:

colnames(MergedDataSet) <- columns;

## c Remove activityType column from the tidy dateset:

MergedDataSet <- MergedDataSet[,names(MergedDataSet) != 'activityType'];

## 7. Script to meet requirements of Project Specified Task "Create a second, independent tidy data set with the average of each variable for each activity and each subject."

## a. Averaging "activity" and "subject" as Tidy Data:

tidyData <- aggregate(MergedDataSet[,names(MergedDataSet) 
                != c('activityId','subjectId')],by=list
                        (activityId=MergedDataSet$activityId,
                                subjectId=MergedDataSet$subjectId),mean);

## b. Export tidyData set 

write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t')

## End explanations and R Script for run_analysis.R.
