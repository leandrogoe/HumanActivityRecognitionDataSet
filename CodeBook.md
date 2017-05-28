# Introduction

Based on the data provided in the UCI article (which is also available in the "UCI HAR Dataset" directory), two data sets are generated using R scripts:
* mergedData.txt
* summarizedData.txt

The first one contains a merge of both the train and tests data, only taking into account a subset of the features of the original data set. Specifically, only standard deviation and mean features were extracted.

The later is a post processing of the first one, having summarized the value of each feature for each combination of activity and subject value.

# Variable names

Each row in the mergedData.txt corresponds to an observation of a subject in a given activity. Note that each subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) for which we have extracted 66 out of the original 561 features mentioned in the original work (those that involved a standard deviation or a mean of a given variable).

The name of the features was preserved from the original work. In order to see a full specification of each feature, please refer to the file "UCI HAR Dataset/features_info.txt".

The summarizedData.txt table has exactly the same structure as the first table, but data was summarized so that only one row exist for each combination of activity and subject (feature columns are averaged).

