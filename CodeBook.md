### Data Description
Document describing output variables from script "run_analysis.R".

Two datasets are produced

1. dataset
2. tidySet (TidyDataSet.txt)

Both datasets share the same variables, the difference is that 'dataset' holds
the complete measurement data, multiple entries of the same activity for each
subject, while 'tidySet' summarize 'dataset' into average values for each
measurement per activity and user. Only parameters describing mean and
standard deviation are covered in this analysis.

Four column example data from TidyDataSet.txt

| Subject | Activity           | tBodyAccMeanX     | tBodyAccMeanY        | ... |
|---------|--------------------|-------------------|----------------------|-----|
| 1       | LAYING             | 0.22159824394     | -0.0405139534294     | ... |
| 1       | SITTING            | 0.261237565425532 | -0.00130828765170213 | ... |
| 1       | STANDING           | 0.278917629056604 | -0.0161375901037736  | ... |
| 1       | WALKING            | 0.277330758736842 | -0.0173838185273684  | ... |
| 1       | WALKING_DOWNSTAIRS | 0.289188320408163 | -0.00991850461020408 | ... |
| 1       | WALKING_UPSTAIRS   | 0.255461689622641 | -0.0239531492643396  | ... |
| 2       | LAYING             | 0.281373403958333 | -0.0181587397583333  | ... |
| 2       | SITTING            | 0.27708735173913  | -0.0156879937282609  | ... |


### Variables
* Subject
  * Description: Identifies individual participants
  * Range: 1..30

* Activity
  * DescriptionExecuted Activity
  * Possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

* tBodyAccMeanX
* tBodyAccMeanY
* tBodyAccMeanZ
* tBodyAccStdX
* tBodyAccStdY
* tBodyAccStdZ
* tGravityAccMeanX
* tGravityAccMeanY
* tGravityAccMeanZ
* tGravityAccStdX
* tGravityAccStdY
* tGravityAccStdZ
* tBodyAccJerkMeanX
* tBodyAccJerkMeanY
* tBodyAccJerkMeanZ
* tBodyAccJerkStdX
* tBodyAccJerkStdY
* tBodyAccJerkStdZ
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStdX
* tBodyGyroStdY
* tBodyGyroStdZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdX
* tBodyGyroJerkStdY
* tBodyGyroJerkStdZ
* tBodyAccMagMean
* tBodyAccMagStd
* tGravityAccMagMean
* tGravityAccMagStd
* tBodyAccJerkMagMean
* tBodyAccJerkMagStd
* tBodyGyroMagMean
* tBodyGyroMagStd
* tBodyGyroJerkMagMean
* tBodyGyroJerkMagStd
* fBodyAccMeanX
* fBodyAccMeanY
* fBodyAccMeanZ
* fBodyAccStdX
* fBodyAccStdY
* fBodyAccStdZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStdX
* fBodyAccJerkStdY
* fBodyAccJerkStdZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdX
* fBodyGyroStdY
* fBodyGyroStdZ
* fBodyAccMagMean
* fBodyAccMagStd
* fBodyBodyAccJerkMagMean
* fBodyBodyAccJerkMagStd
* fBodyBodyGyroMagMean
* fBodyBodyGyroMagStd
* fBodyBodyGyroJerkMagMean
* fBodyBodyGyroJerkMagStd
  * :For all of the above:
    * Std: Standard deviation
    * Mean: Mean value
    * Gyro: Measurements from Gyroscope
    * Acc: Measurements from Accelerometer
    * t: time domain
    * f: frequency domain