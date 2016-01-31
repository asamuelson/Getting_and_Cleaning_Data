Variable names for the raw data:

SubjectTrain 	- the subject information for the training dataset (imported from subject_train.txt)
YTrain 		- the activity ID information for the test dataset (imported from Y_train.txt)
XTrain 		- the measurement data for the test dataset (imported from X_train.txt)
SubjectTest 	- the subject information for the test dataset (imported from subject_test.txt)
YTest 		- the activity ID information for the test dataset (imported from Y_test.txt)
XTest 		- the measurement data for the test dataset (imported from X_test.txt)
Features 	- the list of measurements (imported from features.txt)
ActivityLabels 	- the mapping from the activity IDs to descriptive names for the activities (imported from activity_labels.txt)
	
Transformations from raw data to combined data:

1) combine columns for the subject, activity ID, and measurement data for the training data using cbind
2) combine columns for the subject, activity ID, and measurement data for the test data using cbind
3) combine rows for the training and test data using rbind  
4) extract columns which contain means or standard deviations using grepl
5) subset the combined dataset to obtain only the subject, activity ID, means, and standard deviations columns
6) clean the variable names to expand time and frequency indicators, replace commas and parentheses with periods, remove extra periods, and change all letters to lowercase using gsub
7) update the column names of the combined dataset with descriptive names
  
Variable names for the combined data:

TrainData 			- the combined columns of SubjectTrain, YTrain, and XTrain 
TestData			- the combined columns of SubjectTest, YTest, and XTest
CombinedData	  		- the combined rows of TrainData and TestData
MeansAndStandardDeviationCols 	- an index vector for the columns of Combined data which reference the mean or the standard deviation
MeansAndStandardDeviations 	- the subset of CombinedData containing only the columns for the subjects, activities, means, and standard deviations 
GroupedData 			- the data in MeansAndStandardDeviations, grouped by subject and then by activity
TidyData 			- the tidy dataset containing the average values for each subject-activity combination

Transformations from combined data to tidy data:

1) group the combined data by subject and activity
2) calculate the means for each variable by subject and activity
3) output the tidy data to a text file  

Variable names for the tidy dataset:

subject 			- the subject ID (integer)                              
activity 			- the activity name (character string)                            
timebodyacc.mean.x		- mean of acceleration in x direction (time domain) 
timebodyacc.mean.y 		- mean of acceleration in y direction (time domain)
timebodyacc.mean.z 		- mean of acceleration in z direction (time domain)
timebodyacc.std.x		- standard deviation of acceleration in x direction (time domain) 
timebodyacc.std.y 		- standard deviation of acceleration in y direction (time domain) 
timebodyacc.std.z 		- standard deviation of acceleration in z direction (time domain) 
timegravityacc.mean.x		- mean of acceleration in x direction (time domain)
timegravityacc.mean.y		- mean of acceleration in y direction (time domain)
timegravityacc.mean.z		- mean of acceleration in z direction (time domain)
timegravityacc.std.x 		- standard deviation of acceleration in x direction (time domain) 	
timegravityacc.std.y 		- standard deviation of acceleration in y direction (time domain) 
timegravityacc.std.z 		- standard deviation of acceleration in z direction (time domain) 
timebodyaccjerk.mean.x 		- mean of jerk in x direction (time domain)
timebodyaccjerk.mean.y 		- mean of jerk in y direction (time domain)
timebodyaccjerk.mean.z		- mean of jerk in z direction (time domain)
timebodyaccjerk.std.x 		- standard deviation of jerk in x direction (time domain) 
timebodyaccjerk.std.y		- standard deviation of jerk in y direction (time domain) 
timebodyaccjerk.std.z 		- standard deviation of jerk in z direction (time domain) 
timebodygyro.mean.x 		- mean of angular velocity in x direction (time domain)
timebodygyro.mean.y 		- mean of angular velocity in y direction (time domain)
timebodygyro.mean.z		- mean of angular velocity in z direction (time domain)
timebodygyro.std.x 		- standard deviation of angular velocity in x direction (time domain) 
timebodygyro.std.y		- standard deviation of angular velocity signal in y direction (time domain) 
timebodygyro.std.z 		- standard deviation of angular velocity signal in z direction (time domain) 
timebodygyrojerk.mean.x		- mean of angular jerk in x direction (time domain)
timebodygyrojerk.mean.y 	- mean of angular jerk in y direction (time domain)		
timebodygyrojerk.mean.z		- mean of angular jerk in z direction (time domain)
timebodygyrojerk.std.x 		- standard deviation of angular jerk in x direction (time domain) 
timebodygyrojerk.std.y 		- standard deviation of angular jerk in y direction (time domain) 
timebodygyrojerk.std.z 		- standard deviation of angular jerk in z direction (time domain) 
timebodyaccmag.mean		- mean of acceleration magnitude (time domain)
timebodyaccmag.std 		- standard deviation of acceleration magnitude (time domain) 
timegravityaccmag.mean		- mean of acceleration magnitude (time domain)
timegravityaccmag.std		- standard deviation of acceleration magnitude (time domain) 
timebodyaccjerkmag.mean 	- mean of jerk magnitude (time domain)
timebodyaccjerkmag.std		- standard deviation of jerk magnitude (time domain) 
timebodygyromag.mean 		- mean of angular velocity magnitude (time domain)
timebodygyromag.std 		- standard deviation of angular velocity magnitude (time domain) 
timebodygyrojerkmag.mean	- mean of angular jerk magnitude (time domain)
timebodygyrojerkmag.std 	- standard deviation of angular jerk magnitude (time domain) 	
freqbodyacc.mean.x		- mean of acceleration in x direction (frequency domain)
freqbodyacc.mean.y 		- mean of acceleration in y direction (frequency domain)
freqbodyacc.mean.z 		- mean of acceleration in z direction (frequency domain)
freqbodyacc.std.x 		- standard deviation of acceleration in x direction (frequency domain) 
freqbodyacc.std.y 		- standard deviation of acceleration in y direction (frequency domain) 
freqbodyacc.std.z		- standard deviation of acceleration in z direction (frequency domain) 
freqbodyaccjerk.mean.x 		- mean of jerk in x direction (frequency domain)
freqbodyaccjerk.mean.y		- mean of jerk in y direction (frequency domain)
freqbodyaccjerk.mean.z 		- mean of jerk in z direction (frequency domain)
freqbodyaccjerk.std.x		- standard deviation of jerk in x direction (frequency domain) 
freqbodyaccjerk.std.y		- standard deviation of jerk in y direction (frequency domain) 
freqbodyaccjerk.std.z 		- standard deviation of jerk in z direction (frequency domain) 
freqbodygyro.mean.x 		- mean of angular in x direction (frequency domain)
freqbodygyro.mean.y 		- mean of angular in y direction (frequency domain)
freqbodygyro.mean.z		- mean of angular in z direction(frequency domain)
freqbodygyro.std.x 		- standard deviation of angular velocity in x direction(frequency domain) 
freqbodygyro.std.y 		- standard deviation of angular velocity in y direction(frequency domain) 
freqbodygyro.std.z 		- standard deviation of angular velocity in z direction(frequency domain) 
freqbodyaccmag.mean 		- mean of acceleration magnitude (frequency domain)
freqbodyaccmag.std 		- standard deviation of acceleration magnitude (frequency domain) 
freqbodybodyaccjerkmag.mean	- mean of jerk magnitude (frequency domain)
freqbodybodyaccjerkmag.std 	- standard deviation of jerk magnitude (frequency domain) 
freqbodybodygyromag.mean 	- mean of angular velocity magnitude (frequency domain)
freqbodybodygyromag.std 	- standard deviation of angular velocity magnitude (frequency domain) 
freqbodybodygyrojerkmag.mean 	- mean of angular jerk magnitude (frequency domain)
freqbodybodygyrojerkmag.std 	- standard deviation of angular jerk magnitude (frequency domain) 

