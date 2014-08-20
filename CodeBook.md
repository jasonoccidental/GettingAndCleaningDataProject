# Code Book
### Getting and Cleaning Data Project

This code book provides information regarding the raw and the output dataset of this project.

==================================================================

## Raw Dataset

- The site where the data was sourced:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

- The URL of a zipped file of the dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

- The data contains the output of experiments conducted on 30 volunteers wherein different activities where distinguished based on the accelerometer and gyroscope reading of an attached smartphone.

###### Acknowledgement of the source:
- Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

### Data used

- 'features.txt': List of all of the features.
- 'activity_labels.txt': Links the labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt' : Subjects under test.
- 'train/subject_train.txt' : Subjects under train.

### Activity Labels

- 1 : Walking
- 2 : Walking Upstairs
- 3 : Walking Downstairs
- 4 : Sitting
- 5 : Standing
- 6 : Laying

### Variable Labels

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

==================================================================

## run_analysis.R

### Variables Assigned

- train : Temporary variable for the training data.
- test : Temporary variable for the Test data.
- xData : Merged training and testing data.
- yData : Merged training and testing labels.
- sData : Merged training and testing subjects.
- fData : Descriptive labels of features.
- aData : Descriptive labels of activities.
- Data : Merged xData,yData, and sData
- rData : Resulting tidy dataset.

### Code Description

1. The xData, yData, and sData is stored. The column names for the yData and sData are also set.
2. The fData is stored and the column names are set. The entries that do not have mean() and std() are removed using the grepl function. The fData is used as labels for the xData. 
3. The Data is stored from the cbind of the sData, yData, and xData.
4. Temporary datatables are removed using the rm function.
5. The aData is stored and the column names are set. Spaces are removed from the variables. All caps is retained to emphasize being a variable and not a label (similar to TRUE/FALSE example in slides).
6. The aData and Data is merged.
7. The names of the columns with mean and std are identified and their first letters capitalized to signify the next word.
8. The clean dataset is written as 'CleanData.txt'.
9. A new tidy dataset is made by creating a subset of each subject then each activity within it through a nested loop. The output data is averaged and transformed into a single row at the output dataset. This results to 180 rows of data.
10. The ouput of this dataset is written as 'MergedData.txt'.

==================================================================
## Output Dataset

- The ouput dataset is a 180x68 data frame that contains the average of each variable from each subject's activity.

### Variables

- subject: Test subject numbered from 1-30.
- activityName : Activity done by each subject.
- Variable Labels from raw dataset : These labels are retained but only its mean and standard deviation is retained.

#### Variable Suffix
###### This is the identifier at the end of each variable label.
- Mean : Mean value.
- Std : Standard Deviation

==================================================================
###### By Jason O.
