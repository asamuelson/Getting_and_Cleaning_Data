# Getting_and_Cleaning_Data

The script run_Analysis.R imports and cleans the UCI HAR dataset.
The script performs the following operations:

1) Imports the subjects (SubjectTrain and SubjectTest), activities (YTrain and YTest), activity labels (ActivityLabels), variable names (Features), and measurement data (XTrain and XTest) for the training and test datasets

2) Attaches the subject and label columns to the measurement data tables to the training and test datasets (TrainData and TestData)

3) Combines the training and test data into one dataset called CombinedData

4) Extracts the columns which contain means or standard deviations from the combined dataset and creates a new dataset called MeansAndStandardDeviations

5) Matches activity labels to the list of activities using for loops and inserts the labels into MeansAndStandardDeviations

6) Cleans the variable (feature) names by replacing parentheses and commas with periods, making all letters lowercase,  
