## Introduction
The purpose of this script written in 'R' is to download and clean a dataset
with measured accelerometer and gyroscope sensor values mapping to different
activities and users. The raw measurement values are produced by wearing a
smartphone on the wrist while performing different activities. 

See CodeBook.md for a complete description of the extracted variables.

This analysis uses data from
the <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">UC Irvine Machine
Learning Repository</a>
* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ">Human Activity Recognition</a>

## Files in project
  * README.md       - Readme markdown file
  * CodeBook.md     - CodeBook describing output parameters
  * run_analysis.R  - Script performing analysis
  * TidyDataSet.txt - Output file describing the tidy dataset

## Dependencies

* An 'R' environment installed and working.
* 'reshape2' and 'dplyr' packages installed

```
install.packages("reshape2")
install.packages("dplyr")
```

Loading the packages is handled in the script.

## Running the script

Open any preferred R console and execute below command in workset directory:
```
source("run_analysis.R")
```

## Output

Two datasets are produced

1. dataset
2. tidy_set (TidyDataSet.txt)

Both dataset share the same variables, the difference is that 'dataset' holds
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


See CodeBook.md for a complete description of the extracted variables.