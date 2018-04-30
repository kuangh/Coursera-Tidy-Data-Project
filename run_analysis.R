setwd("~/Desktop/R/assignment/data")
library(data.table)

# 1.1 Combine the train and test data sets
#read in the names of the 561 features in the datasets.
features <- fread("features.txt")

#read in the traing set and the test set
train <- fread("./train/X_train.txt")
test <- fread("./test/X_test.txt")
#assign the 561 features as headers to the training set
names(train) <- features$V2
names(test) <- features$V2
#merge the training and test data sets
all <- rbind(train, test)


# 1.2. Extract the mean and standard deviation data for each measurement
mean.and.std.col.nums <- grep(pattern="(mean|std)", names(all))
tidy <- subset(all, select=mean.and.std.col.nums)

# 1.3. Use descriptive activity names to name the activities in the data set
#read in the corresponding activity class for each row
train.act.class <- fread("./train/y_train.txt")
test.act.class <- fread("./test/y_test.txt")
activities <- rbind(train.act.class, test.act.class)
#add an activity.class column to the data table "all"
tidy[, activity.class:=activities$V1]
#read in the names of the 6 activities.
activity.names <- fread("activity_labels.txt")
#add an activity column indicating the type of activity corresponding to the activity class
tidy[,activity:=activity.names$V2[activity.class]]


## 1.4. Appropriately label the data set with descriptive variable names
#-Please see section 1.1


# 1.5. From the data set in step 1.4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
#read in the subject IDs.
train.subjects <- fread("./train/subject_train.txt")
test.subjects <- fread("./test/subject_test.txt")
#combine the subject data
subIDs <- rbind(train.subjects, test.subjects)
#add a subject column indicating the type of activity corresponding to the activity class
tidy[,subject:=subIDs$V1]
#calculate the mean for each column and group by activity and subject ID
tidy2 <- tidy[, lapply(.SD, FUN=mean), by=.(activity, subject)]
write.table(tidy2, file="tidydata.txt", row.name=FALSE)

#mae the code book
tidy2.features <- names(tidy2)
tidy2.features <- as.data.table(tidy2.features)
names(tidy2.features) <- "Features"
#add units for features: Acc features have units of "g", Gyro features have units of "radians/second"
tidy2.features[,Units:=sub(pattern=".*Acc.*", replacement="g", Features)]
tidy2.features[,Units:=sub(pattern=".*Gyro.*", replacement="radians/second", Units)]
tidy2.features[,Units:=sub(pattern="activity.*|subject", replacement="", Units)]
fwrite(tidy2.features, "codebook.txt",sep = "\t")
