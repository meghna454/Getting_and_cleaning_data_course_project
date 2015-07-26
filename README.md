---
title: "README"
output: html_document
---
This is the README file to give step by step instructions on how to us run_analysis.R,

Load the packages plyr, dplyr and reshape 2 in the beginning. 

The data is read from the test and train text files located in the UCI HAR subdirectory in the current working folder.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. So the data is divided into two parts: test data and train data. Each type contains files stating the subject, activity, and test/train data.

The appropriate columns containing information about mean and standard deviation of vairables are selected from xtest.txt and xtrain.txt.

All the columns with mean and standard deviation information are column binded with activity and subject to get testdf and traindf.

Then testdf and train df are rowbinded to combine the data from the test and the train runs and the result is stored in mydf.

The columns of mydf are now given appropriate names. A duplicate of the data frame mydf is made.

The data frame mydf1 is then melted with SUBJECT and ACTIVITY going into I.D. and the remaining mean and standard deviation variables going into measures.

This data is then dcast to find the mean values of all the measure variables and list them according to every activity that every subject did and the value is stored in df.

The numeric values in the ACTIVITY column are converted to the actual activities performed by the subject. 1. WALKING  2.WALKING_DOWNSTAIRS 3. WALKING_UPSTAIRS 4. SITTING 5.STANDING  6.LAYING

The columns in the final data frame df are then named appropriately. 

The final tidy data frame df is then outputted using write.table into a text file "df.txt", which is stored in the working directory too. Run the script <read.table("./df.txt", header=TRUE)> in R to see the tidy data. 
