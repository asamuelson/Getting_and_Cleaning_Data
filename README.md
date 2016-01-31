# Getting_and_Cleaning_Data
## Course Project

The script run_Analysis.R imports and cleans the UCI HAR dataset.
The script performs the following operations:

1) Imports the subjects (SubjectTrain and SubjectTest), activities (YTrain and YTest), activity labels (ActivityLabels), variable names (Features), and measurement data (XTrain and XTest) for the training and test datasets

2) Attaches the subject and label columns to the measurement data tables to the training and test datasets (TrainData and TestData)

3) Combines the training and test data into one dataset called CombinedData

4) Extracts the columns (MeansAndStandardDeviationCols) which contain means or standard deviations from the combined dataset and creates a new dataset called MeansAndStandardDeviations

5) Matches activity labels to the list of activities using for loops and inserts the labels into MeansAndStandardDeviations

6) Cleans the measurement data variable names (FeaturesCleaned) by using a sequence of gsub stateemnts to replace parentheses and commas with periods, making all letters lowercase, and expanding time and frequency markers

7) Replaces the measurement data column names with the descriptive names in FeaturesCleaned

8) Uses the group_by function from the dplyr package to grouped the data by subject, then by activity and places the resulting data in the variable GroupedData

9) Creates a tidy dataset containing the averages of each variable by subject and activity and places it in the variable TidyData

10) Outputs the TidyData dataset to a text file using write.table with row.names = FALSE

