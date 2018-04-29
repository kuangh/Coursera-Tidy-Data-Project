# Coursera-Tidy-Data-Project
this is a course project for "Getting and Cleaning Data" on Coursera

1. The R code
The R code combines the training and testing data sets from the "Human Activity Recognition Project":
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# to combine the train and test data sets
-It first reads in the training data contained in "X_train.txt" to a data table called "train" and testing data contained in "X_test.txt" to a data table called "test". 

-The two data tables each contains 561 columns correspondign to 561 features calcuated by the original authors based on raw data. The names of these 561 columsn are extracted from file "features.txt" and assgined to the two data tables as headers.

-Then a new column called "activity.class" is added to each data table that indicates the activity class for each row of data. The activity class data are extracted from files called "y_train.txt" and "y_text.txt". 

-Another new column called "activity" is added to each data table to translate the activity class (1-6) into the activity name. 

-Then another new column called "subject" is added to each data table to indicate the IDs of the individuales who took the measurements. The subject IDs are extracted from the "subject_test.txt" files.

-Finally, the two data tables are combined by rows into a new data table called "all".

# to extract the mean and standard deviation data for each measurement
-get the column indexes that contain the strings "mean" anywhere in the column headers, "std" anywhere in the column headers, and "activity" and the end of the headers, then subset the "all" data table using those indexes

-get the column indexes that contain the string "mean", then subset the "all" data table using those indexes and store it in a data table called "tidy"

# to write out the tidy data
-using the write.table() function to write out "tidy" into a file named "tidy.txt"

2. Code book
# to generate the code book
-store the column names of the "tidy" data table in a data table called "tidy.features" and name the column "Features"

-add a "Units" column to "tidy.features" using the sub function: all Acc variables have units of g; all Gyro variables have units of radians/second

-write out this data table to a file named "codebook.txt"

# Here's the code book:
tBodyAcc-mean()-X,g
tBodyAcc-mean()-Y,g
tBodyAcc-mean()-Z,g
tBodyAcc-std()-X,g
tBodyAcc-std()-Y,g
tBodyAcc-std()-Z,g
tGravityAcc-mean()-X,g
tGravityAcc-mean()-Y,g
tGravityAcc-mean()-Z,g
tGravityAcc-std()-X,g
tGravityAcc-std()-Y,g
tGravityAcc-std()-Z,g
tBodyAccJerk-mean()-X,g
tBodyAccJerk-mean()-Y,g
tBodyAccJerk-mean()-Z,g
tBodyAccJerk-std()-X,g
tBodyAccJerk-std()-Y,g
tBodyAccJerk-std()-Z,g
tBodyGyro-mean()-X,radians/second
tBodyGyro-mean()-Y,radians/second
tBodyGyro-mean()-Z,radians/second
tBodyGyro-std()-X,radians/second
tBodyGyro-std()-Y,radians/second
tBodyGyro-std()-Z,radians/second
tBodyGyroJerk-mean()-X,radians/second
tBodyGyroJerk-mean()-Y,radians/second
tBodyGyroJerk-mean()-Z,radians/second
tBodyGyroJerk-std()-X,radians/second
tBodyGyroJerk-std()-Y,radians/second
tBodyGyroJerk-std()-Z,radians/second
tBodyAccMag-mean(),g
tBodyAccMag-std(),g
tGravityAccMag-mean(),g
tGravityAccMag-std(),g
tBodyAccJerkMag-mean(),g
tBodyAccJerkMag-std(),g
tBodyGyroMag-mean(),radians/second
tBodyGyroMag-std(),radians/second
tBodyGyroJerkMag-mean(),radians/second
tBodyGyroJerkMag-std(),radians/second
fBodyAcc-mean()-X,g
fBodyAcc-mean()-Y,g
fBodyAcc-mean()-Z,g
fBodyAcc-std()-X,g
fBodyAcc-std()-Y,g
fBodyAcc-std()-Z,g
fBodyAcc-meanFreq()-X,g
fBodyAcc-meanFreq()-Y,g
fBodyAcc-meanFreq()-Z,g
fBodyAccJerk-mean()-X,g
fBodyAccJerk-mean()-Y,g
fBodyAccJerk-mean()-Z,g
fBodyAccJerk-std()-X,g
fBodyAccJerk-std()-Y,g
fBodyAccJerk-std()-Z,g
fBodyAccJerk-meanFreq()-X,g
fBodyAccJerk-meanFreq()-Y,g
fBodyAccJerk-meanFreq()-Z,g
fBodyGyro-mean()-X,radians/second
fBodyGyro-mean()-Y,radians/second
fBodyGyro-mean()-Z,radians/second
fBodyGyro-std()-X,radians/second
fBodyGyro-std()-Y,radians/second
fBodyGyro-std()-Z,radians/second
fBodyGyro-meanFreq()-X,radians/second
fBodyGyro-meanFreq()-Y,radians/second
fBodyGyro-meanFreq()-Z,radians/second
fBodyAccMag-mean(),g
fBodyAccMag-std(),g
fBodyAccMag-meanFreq(),g
fBodyBodyAccJerkMag-mean(),g
fBodyBodyAccJerkMag-std(),g
fBodyBodyAccJerkMag-meanFreq(),g
fBodyBodyGyroMag-mean(),radians/second
fBodyBodyGyroMag-std(),radians/second
fBodyBodyGyroMag-meanFreq(),radians/second
fBodyBodyGyroJerkMag-mean(),radians/second
fBodyBodyGyroJerkMag-std(),radians/second
fBodyBodyGyroJerkMag-meanFreq(),radians/second


