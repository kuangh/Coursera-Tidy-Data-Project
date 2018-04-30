# Coursera-Tidy-Data-Project
this is a course project for "Getting and Cleaning Data" on Coursera

# 1. The R code
The R code combines the training and testing data sets from the "Human Activity Recognition Project":
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## 1.1 Combine the train and test data sets
-Reads in the training data contained in "X_train.txt" to a data table called "train" and testing data contained in "X_test.txt" to a data table called "test". 

-The two data tables each contains 561 columns correspondign to 561 features calcuated by the original authors based on raw data. The names of these 561 columsn are extracted from file "features.txt" and assgined to the two data tables as headers.

-The two data tables are combined by rows into a new data table called "all".

## 1.2. Extract the mean and standard deviation data for each measurement
-get the column indexes that contain the strings "mean" or "std" anywhere in the column headers, then subset the "all" data table using those indexes and store the subset into a data table called "tidy"

## 1.3. Use descriptive activity names to name the activities in the data set
-Read in and combine the activity class data from files called "y_train.txt" and "y_text.txt". Store it in a data table called "activities"

-Translate the activity.class data into the names of each activity using the sub function

## 1.4. Appropriately label the data set with descriptive variable names
-Please see section 1.1

## 1.5. From the data set in step 1.4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
-add a subject ID column to the tidy data table using data extracted from "subject_train.txt" and "subject_test.txt" and name the new data table "tidy2"

-calculate the mean for each variable and group by activity and subject ID using lapply on the data table

-write out "tidy2" usign using the fread function

# 2. Code book
## 2.1 Generate the code book
-store the column names of the "tidy2" data table in a data table called "tidy2.features" and name the column "Features"

-add a "Units" column to "tidy2.features" using the sub function: all Acc variables have units of g; all Gyro variables have units of radians/second

-write out this data table to a file named "codebook.txt"
