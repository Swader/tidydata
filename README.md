# tidydata
R studies about clean data

## Prerequisites

You need the `dplyr` package installed to use this.

## Usage

To use the `run_analysis.R` script included in this repo, download the source file from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Make sure the folder that is produced by unzipping the archive is in the same folder where the file `run_analysis.R` is.

To use the analysis, load up R studio or something and just source the file. Everything should happen automatically, and a tidy data set should be produced.

For information about the variables in the set, see the [CODEBOOK](CODEBOOK.MD).

---

## Full Assignment Text

You should create one R script called run_analysis.R that does the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.