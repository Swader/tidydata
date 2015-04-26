# Make sure you have dplyr installed to use this script!

featuresNames <- read.table("UCI HAR Dataset/features.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
names(xTest) <- featuresNames$V2
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
test <- cbind(subjectTest, yTest, xTest)
names(test)[1:2] <- c('subject', 'activity')

subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
names(xTrain) <- featuresNames$V2
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
train <- cbind(subjectTrain, yTrain, xTrain)
names(train)[1:2] <- c('subject', 'activity')

joined <- rbind(test, train)

keepCols <- grep("mean\\(\\)|std\\(\\)|subject|activity",names(joined))
joined <- joined[,keepCols]

joined$activity <- as.factor(joined$activity)
levels(joined$activity) <- activityLabels$V2

tidy <- joined %>% group_by(subject,activity) %>% summarise_each(funs(mean))
write.csv(tidy, "tidy.txt", row.names=FALSE)