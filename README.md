# Introduction

In this repo we explore very simple transformations on the data that is gently supplied by the UCI in the following article:  

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

An R scripts that does the following transformations was created:
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In order to see more details about the data and how it was generated, please refer to the CodeBook markdown file.

# Generating the data

Both data sets (mergedData.txt and summarizedData.txt) are generated using the cleanData.R script. In order to re-generate the data, just open R and type the following in the command prompt:

\> setwd(PATH_TO_UCI_DATA)

\> source("../run_analysis.R")

\> cleanData()

Inside the script you'll find three functions:
* readData - Reads and formats one of the two data sets UCI provides (either the one from test or train).
* getMergedDataset - Merges the two data sets (test and train) into a single data frame.
* getSummarizedData - Summarizes the data that was created with getMergedDataset. Note that for this function the reshape2 R package was used, which needs to be installed in order for the scripts to work.
* cleanData - Uses the functions above to generate both the merged and summarized datasets in the file system. Note that the summarized data framed is the return value of the function.