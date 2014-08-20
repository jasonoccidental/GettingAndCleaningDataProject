Getting and Cleaning Data Project

Project repository for the Getting and Cleaning Data Course in Coursera.

=============================

## Project Goal

The goal of this project is to produce a tidy dataset from the Human Activity Recognition Using Smartphones Dataset provided in the project page. The tidy dataset should only include the averaged mean and standard deviation of each activity done by each test dubject.

=============================

## Preliminaries

1. Download the data from:
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the data to your working directory. The run_analysis.R should also be downloaded and placed in the working directory as well.
3. Source the run_analysis.R
4. Two new files will be added to the raw dataset folder {'UCI HAR Dataset'}:
- AveragedDataset.txt {0.218 MB} = Independent tidy dataset of averages of each variable of each activity done by each subject.
- CleanData.txt {7.97 MB} = Merged and labeled data from the raw dataset.

=============================

## run_analysis.R

The code does the following steps:

1. Merges the training and the test sets to create one data set.
- The dataset contains a training set and test set. This section will upload the files into Rstudio and merge them into a single dataset.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
- Searches for the variables having mean {'mean()'} or standard deviation {'std()'} using the grepl function. This results into a data table of 66 rows.

3. Uses descriptive activity names to name the activities in the data set.
- Get the activity names data and turn the numeric equivalent of the activity cells into a descriptive equivalent. The numeric data will still be retained so that subsetting can be made easier. It will then be removed at the end of the program.

4. Appropriately labels the data set with descriptive variable names.
- The dataset is labeled with the descriptive variable names as mentioned in the course lecture. Since these variables contain more than one word, the first letters of the second word up to the last word is capitalized to make it more readable as compared to transforming the name into all small caps.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
- The output dataset is first saved for backup purposes. Then, the data is subsetted by subject then by activity to get the mean of each variable. The resulting dataset has 180 rows which contains the means of each variable of each activity done by each subject. The data is saved inside the folder of the raw dataset.
