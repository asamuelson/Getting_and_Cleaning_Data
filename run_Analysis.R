library(dplyr)
XTrain <- read.table("X_train.txt")
YTrain <- read.table("y_train.txt")
SubjectTrain <- read.table("subject_train.txt")
XTest <- read.table("X_test.txt")
YTest <- read.table("y_test.txt")
SubjectTest <- read.table("subject_test.txt")
Features <- read.table("features.txt")
ActivityLabels <- read.table("activity_labels.txt")
TrainData <- cbind(SubjectTrain, YTrain, XTrain)
TestData <- cbind(SubjectTest, YTest, XTest)
CombinedData <- rbind(TrainData, TestData)
MeansAndStandardDeviationCols <- c(TRUE, TRUE, grepl("*mean[(][)]|std[(][)]*", Features[,2], ignore.case = TRUE))
MeansAndStandardDeviations <- CombinedData[MeansAndStandardDeviationCols]
for (i in 1:nrow(MeansAndStandardDeviations)) {
    for (j in 1:6) {
        if (MeansAndStandardDeviations[i,2] == ActivityLabels[j,1]) {
            MeansAndStandardDeviations[i,2] <- as.character(ActivityLabels[j,2])
        }
    }
}
FeaturesCleaned <- gsub("^t", "time", Features$V2)
FeaturesCleaned <- gsub("^f", "freq", FeaturesCleaned)
FeaturesCleaned <- gsub("[(]t", ".time", FeaturesCleaned)
FeaturesCleaned <- gsub("[(]f", ".freq", FeaturesCleaned)
FeaturesCleaned <- gsub("[(]", ".", FeaturesCleaned)
FeaturesCleaned <- gsub("[)]", ".", FeaturesCleaned)
FeaturesCleaned <- gsub("-", ".", FeaturesCleaned)
FeaturesCleaned <- gsub(",", ".", FeaturesCleaned)
FeaturesCleaned <- gsub("...", "..", FeaturesCleaned, fixed = TRUE)
FeaturesCleaned <- gsub("..", ".", FeaturesCleaned, fixed = TRUE)
FeaturesCleaned <- gsub("\\.$", "", FeaturesCleaned)
FeaturesCleaned <- FeaturesCleaned[MeansAndStandardDeviationCols[3:length(MeansAndStandardDeviationCols)]]
FeaturesCleaned <- tolower(FeaturesCleaned)
colnames(MeansAndStandardDeviations) <- c("subject", "activity", FeaturesCleaned)
GroupedData <- group_by(MeansAndStandardDeviations, subject, activity)
TidyData <- summarise_each(GroupedData, funs(mean))
write.table(TidyData, row.names = FALSE, file = "TidyData.txt")    

