## run_analysis.R
library(data.table)
## Read the files and merge the training and test sets
## x data
train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
xData <- rbind(train, test)

## y data
train <- read.table("UCI HAR Dataset/train/y_train.txt")
test <- read.table("UCI HAR Dataset/test/y_test.txt")
yData <- rbind(train, test)
setnames(yData, "V1", "activity")

## subject data
train <- read.table("UCI HAR Dataset/train/subject_train.txt")
test <- read.table("UCI HAR Dataset/test/subject_test.txt")
sData <- rbind(train, test)
setnames(sData, "V1", "subject")

## Extract the measurements on the mean and standard deviation for each measurement
fData <- read.table("UCI HAR Dataset/features.txt")
setnames(fData, names(fData), c("featureNum", "featureName"))
fData <- fData[grepl("mean\\(\\)|std\\(\\)", fData$featureName),]
xData <- xData[,fData[,1]]
names(xData) <- gsub("\\(\\)|-","",fData[,2])

## merge all the data
Data <- cbind(sData,yData,xData)

## clear the unmerged data
rm(train, test, sData, xData, yData, fData)

## Name the activities with descriptive activity names
aData <- read.table("UCI HAR Dataset/activity_labels.txt")
names(aData) <- c("activity","activityName")
## Remove Spaces from Activity Names
aData$activityName <- gsub("_","",aData$activityName)
Data = merge(aData,Data,by.x="activity",by.y="activity")


## Label the data set with descriptive variable names
## First letters of 2nd to the last words in name are capitalized to maintain readability
names(Data) <- gsub("mean","Mean",names(Data))
names(Data) <- gsub("std","Std",names(Data))

## Save the clean data set
write.table(Data, "UCI HAR Dataset/CleanData.txt",row.name=FALSE)
rm(aData)

## Creates a second, independent tidy data set
rData <- Data[1:(30*6), ]
r <- 1
for (s in 1:30) {
        temp1 <- Data[Data$subject==s,]
        for (a in 1:6) {
                temp2 <- temp1[temp1$activity==a,]
                rData[r,] <- c(temp2[1,c(1,2,3)],colMeans(temp2[,c(-1,-2,-3)]))
                r <- r+1
        }
}
rm(temp1, temp2, r)

## Remove non-descriptive variable (Activity Number)
rData <- rData[,-1]
rData[,1] <- as.factor(rData[,1])

## Save the dataset to text file
write.table(rData, "UCI HAR Dataset/AveragedDataset.txt",row.name=FALSE)