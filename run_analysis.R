library(plyr)
library(dplyr)
library(reshape2)

subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")        ##reading the subject names for the test data
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")                ##reading the test data
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")               ##reading the activity data for the test subjects


subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")     ##reading the subject for the train data
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")                ##reading the train data
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")               ##reading the activity data for the test subjects


##Extracting the mean and standard deviation data from the contents of xtest and xtrain
xtestdf_mean <- select(xtest, V1:V3, V41:V43, V81:V83, V121:V123, V161:V163, V201, V214, V227, V240, V253, V266:V268, V294:V296, V345:V347, V373:V375, V424:V426, V452:V454, V503, V513,V516, V526, V529, V539, V542, V552, V555:V561)

xtraindf_mean <- select(xtrain, V1:V3, V41:V43, V81:V83, V121:V123, V161:V163, V201, V214, V227, V240, V253, V266:V268, V294:V296, V345:V347, V373:V375, V424:V426, V452:V454, V503, V513,V516, V526, V529, V539, V542, V552, V555:V561)

xtestdf_std <- select(xtest, V4:V6, V44:V46, V84:V86, V124:V126, V164:V166, V202, V215, V228, V241, V254, V269:V271, V348:V350, V427:V429, V504, V517, V530, V543)

xtraindf_std <- select(xtrain, V4:V6, V44:V46, V84:V86, V124:V126, V164:V166, V202, V215, V228, V241, V254, V269:V271, V348:V350, V427:V429, V504, V517, V530, V543)

##Binding the columns with subject, activity, mean and standard deviation data from test and train data
testdf <- cbind(subtest,ytest,xtestdf_mean,xtestdf_std)
traindf <- cbind(subtrain, ytrain, xtraindf_mean, xtraindf_std)

##Row binding the test and train data
mydf <- rbind(testdf, traindf)


## Giving appropriate names to the columns of the data frame obtained by rbinding the test and train data
names(mydf)<- c("SUBJECT", "ACTIVITY", "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z",
                        "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyAccMag-mean()", "tGravityAccMag-mean()", "tBodyAccJerkMag-mean()",
                        "tBodyGyroMag-mean()", "tBodyGyroJerkMag-mean()", "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", "fBodyAcc-meanFreq()-X", "fBodyAcc-meanFreq()-Y", "fBodyAcc-meanFreq()-Z", "fBodyAccJerk-mean()-X", 
                       "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", "fBodyAccJerk-meanFreq()-X", "fBodyAccJerk-meanFreq()-Y", "fBodyAccJerk-meanFreq()-Z", "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z","fBodyGyro-meanFreq()-X",
                       "fBodyGyro-meanFreq()-Y", "fBodyGyro-meanFreq()-Z", "fBodyAccMag-mean()", "fBodyAccMag-meanFreq()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-meanFreq()", "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-meanFreq()", 
                       "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-meanFreq()", "angle(tBodyAccMean,gravity)", "angle(tBodyAccJerkMean),gravityMean)","angle(tBodyGyroMean,gravityMean)", "angle(tBodyGyroJerkMean,gravityMean)", "angle(X,gravityMean)",
                      "angle(Y,gravityMean)", "angle(Z,gravityMean)", "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y",
                      "tBodyGyro-std()-Z", "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", "tBodyAccMag-std()","tGravityAccMag-std()","tBodyAccJerkMag-std()","tBodyGyroMag-std()","tBodyGyroJerkMag-std()", "fBodyAcc-std()-X","fBodyAcc-std()-Y","fBodyAcc-std()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y","fBodyAccJerk-std()-Z",
                       "fBodyGyro-std()-X", "fBodyGyro-std()-Y","fBodyGyro-std()-Z","fBodyAccMag-std()", "fBodyBodyAccJerkMag-std()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-std()")
## creating a copy of the data frame containing test and train data
mydf1 <- mydf

## melting the data from the final data frame with test and train data into id and measures
d <- melt(data= mydf1, id = c("SUBJECT", "ACTIVITY"), measure.vars=colnames(mydf1[, grep("mean|std",colnames(mydf1))]))

## getting the average of each variable of each subject performing each activity
df <- dcast(d, SUBJECT + ACTIVITY ~ variable, mean)

## renaming the rows of ACTIVITY as the names of the activities performed by the volunteers
df$ACTIVITY[df$ACTIVITY %in% 1] <- "WALKING"
df$ACTIVITY[df$ACTIVITY %in% 2] <- "WALKING_UPSTAIRS"
df$ACTIVITY[df$ACTIVITY %in% 3] <- "WALKING_DOWNSTAIRS"
df$ACTIVITY[df$ACTIVITY %in% 4] <- "SITTING"
df$ACTIVITY[df$ACTIVITY %in% 5] <- "STANDING"
df$ACTIVITY[df$ACTIVITY %in% 6] <- "LAYING"


##Giving appropriate and meaningful column names to the final tidy data set
names(df) <- c("SUBJECT", "ACTIVITY", "Group_mean_tBodyAcc_mean-X","Group_mean_tBodyAcc_mean-Y","Group_mean_tBodyAcc_mean-Z","Group_mean_tGravityAcc_mean-X","Group_mean_tGravityAcc_mean-Y","Group_mean_tGravityAcc_mean-Z", "Group_mean_tBodyAccJerk_mean-X", "Group_mean_tBodyAccJerk_mean-Y","Group_mean_tBodyAccJerk_mean-Z","Group_mean_tBodyGyro_mean-X",
               "Group_mean_tBodyGyro_mean-Y","Group_mean_tBodyGyro_mean-Z","Group_mean_tBodyGyroJerk_mean-X","Group_mean_tBodyGyroJerk_mean-Y","Group_mean_tBodyGyroJerk_mean-Z", "Group_mean_tBodyAccMag_mean","Group_mean_tGravityAccMag_mean","Group_mean_tBodyAccJerkMag_mean", "Group_mean_tBodyGyroMag_mean", "Group_mean_tBodyGyroJerkMag_mean", "Group_mean_fBodyAcc_mean-X",
               "Group_mean_fBodyAcc_mean-Y","Group_mean_fBodyAcc_mean-Z", "Group_mean_fBodyAcc_meanFreq-X", "Group_mean_fBodyAcc_meanFreq-Y", "Group_mean_fBodyAcc_meanFreq-Z", "Group_mean_fBodyAccJerk_mean-X", "Group_mean_fBodyAccJerk_mean-Y", "Group_mean_fBodyAccJerk_mean-Z", "Group_mean_fBodyAccJerk_meanFreq_X", "Group_mean_fBodyAccJerk_meanFreq_Y", 
               "Group_mean_fBodyAccJerk_meanFreq_Z", "Group_mean_fBodyGyro_mean-X", "Group_mean_fBodyGyro_mean-Y", "Group_mean_fBodyGyro_mean-Z", "Group_mean_fBodyGyro_meanFreq-X", "Group_mean_fBodyGyro_meanFreq-Y", "Group_mean_fBodyGyro_meanFreq-Z", "Group_mean_fBodyAccMag_mean", "Group_mean_fBodyAccMag_meanFreq", "Group_mean_fBodyBodyAccJerkMag_mean",
               "Group_mean_fBodyBodyAccJerkMag_meanFreq", "Group_mean_fBodyBodyGyroMag_mean", "Group_mean_fBodyBodyGyroMag_meanFreq", "Group_mean_fBodyBodyGyroJerkMag_mean", "Group_mean_fBodyBodyGyroJerkMag_meanFreq", "Group_std_tBodyAcc_std-X", "Group_std_tBodyAcc_std-Y", "Group_std_tBodyAcc_std-Z", "Group_std_tGravityAcc_std-X", "Group_std_tGravityAcc_std-Y", 
               "Group_std_tGravityAcc_std-Z", "Group_std_tBodyAccJerk_std-X", "Group_std_tBodyAccJerk_std-Y", "Group_std_tBodyAccJerk_std-Z", "Group_std_tBodyGyro_std-X","Group_std_tBodyGyro_std-Y", "Group_std_tBodyGyro_std-Z", "Group_std_tBodyGyroJerk_std-X", "Group_std_tBodyGyroJerk_std-Y", "Group_std_tBodyGyroJerk_std-Z", "Group_std_tBodyAccMag_std", 
               "Group_std_tGravityAccMag_std", "Group_std_tBodyAccJerkMag_std", "Group_std_tBodyGyroMag_std", "Group_std_tBodyGyroJerkMag_std", "Group_std_fBodyAcc_std-X", "Group_std_fBodyAcc_std-Y", "Group_std_fBodyAcc_std-Z", "Group_std_fBodyAccJerk_std-X", "Group_std_fBodyAccJerk_std-Y", "Group_std_fBodyAccJerk_std-Z", "Group_std_fBodyGyro_std-X", "Group_std_fBodyGyro_std-Y",
               "Group_std_fBodyGyro_std-Z", "Group_std_fBodyAccMag_std", "Group_std_fBodyBodyAccJerkMag_std", "Group_std_fBodyBodyGyroMag_std", "Group_std_fBodyBodyGyroJerkMag_std")

## creating a final text file to output the tidy data set
write.table(df,"./df.txt",row.name=FALSE)
