readData <- function(set, features)
{
  # Read the data
  rawData <- read.fwf(sprintf("%s/X_%s.txt", set, set),widths=rep(16,561))
  
  # Assign the names to each column
  colnames(rawData) <- features
  
  # Now filter the columns, leaving only the mean and std ones
  interestingData <- rawData[,grep(colnames(rawData),pattern="-mean\\(\\)|-std\\(\\)")]
  
  # Add the activity column
  activityTable <- read.table(sprintf("%s/y_%s.txt", set, set),colClasses = "factor")
  levels(activityTable[,1]) <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
  
  interestingData$activity <- activityTable[,1]
  
  # Now add the subject column    
  subject <- read.table(sprintf("%s/subject_%s.txt", set, set),colClasses = "factor")
  interestingData$subject <- subject[,1]
  
  # Reorder the columns, having the subject and activity at the start is nice
  interestingData <- interestingData[,c(ncol(interestingData),ncol(interestingData)-1,1:(ncol(interestingData)-2))]
  
  interestingData
}

getMergedDataset <- function()
{
  # Read the features list
  features <- read.table("features.txt", sep=" ")
  
  # Get the data
  trainData <- readData("train", features[,2])
  testData <- readData("test", features[,2])
  
  # Combine test and train tables
  fusedDataset <- rbind(trainData, testData)
  
  fusedDataset
}

getSummarizedData <- function(fusedData)
{
  # Use reshape2 to get the summary
  library(reshape2)
  
  # For each pair of activity and subject, calculate the mean for each variable
  meltedData <- melt(fusedData, id=c("activity","subject"))
  summarized <- dcast(meltedData, activity + subject ~ variable, mean)
  
  summarized
}


cleanData <- function()
{
  mergedData <- getMergedDataset()
  
  write.table(mergedData, "../mergedData.txt", row.names=FALSE)
  
  summarizedData <- getSummarizedData(mergedData)
  
  write.table(summarizedData, "../summarizedData.txt", row.names=FALSE)
  
  summarizedData
}
