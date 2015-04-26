subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
featuresNames <- read.table("UCI HAR Dataset/features.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

names(subjectTrain)[1] <-  "subjectId"
names(subjectTest)[1] <- "subjectId"
names(yTrain)[1] <- "activity"
names(yTest)[1] <- "activity"

names(xTrain) <- featuresNames$V2
names(xTest) <- featuresNames$V2

joinedTrain <- cbind(subjectTrain,yTrain,xTrain)
joinedTest <- cbind(subjectTest,yTest,xTest)
joined <- rbind(joinedTrain,joinedTest)

keepCols <- grep("mean\\(\\)|std\\(\\)|subjectId|activity",names(joined))
joined <- joined[,keepCols]

joined$activity <- as.factor(joined$activity)
levels(joined$activity) <- activityLabels$V2

tidy <- joined %>% group_by(subjectId,activity) %>% summarise_each(funs(mean))
write.csv(tidy, "tidy.txt", row.names=FALSE)