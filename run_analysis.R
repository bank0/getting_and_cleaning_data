library("reshape2")
library("dplyr")

# Downloads and unzips the raw dataset
fetch_data <- function() {
    url         <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    dataset_zip <- "Dataset.zip"

    # Check if dataset already exist
    if (!file.exists(dataset_zip)) {
        # Download dataset
        download.file(url,
                      method="wget",
                      destfile="Dataset.zip")
    }

    # Check if dataset is already extracted
    if (file.exists(dataset_zip) && !file.exists("./UCI HAR Dataset")) {
        # Unzip downloaded dataset
        unzip(dataset_zip)
    }

    # Make sure files have been properly extracted
    stopifnot(file.exists("./UCI HAR Dataset"))
}

# Reads the raw data from the test or train sets and compiles
# a dataset including "Activity", "Subject" and feature measurements. 
# Input: test/train
read_and_compile_set <- function(set_type) {
    stopifnot(set_type %in% c("train", "test"))

    # Read table for activity labels
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",
                                  sep=" ",
                                  col.names=c("Activity_Id", "Activity"))

    # Read table with features
    feature_labels <- read.table("./UCI HAR Dataset/features.txt",
                                 sep=" ",
                                 col.names=c("Feature_Id", "Feature"))

    # Read tables with user identification id
    subject <- read.table(paste0("./UCI HAR Dataset/",set_type,
                                 "/subject_",set_type,".txt"),
                          col.names=c("Subject"))

    # Read tables with activities
    activity_id <- read.table(paste0("./UCI HAR Dataset/",set_type,
                                     "/y_",set_type,".txt"),
                              col.names=c("Activity_Id"))

    # Read tables with feature data
    feature_data <- read.table(paste0("./UCI HAR Dataset/",set_type,
                                      "/X_",set_type,".txt"),
                               col.names=feature_labels$Feature)

    # Extract mean and standard deviation values (task 2).
    # Weighted average of frequency components are intentionally ignored.
    mean_std_cols <- grep("(mean|std)\\.", names(feature_data))
    feature_data  <- feature_data[,mean_std_cols]

    # Task 4: Lets Clean the names up a little bit
    data_names <- gsub("\\.","", names(feature_data))
    data_names <- gsub("mean","Mean", data_names)
    data_names <- gsub("std","Std", data_names)
    colnames(feature_data) <- data_names
    
    # Base the extended dataset on the feature_data
    dataset <- feature_data

    # Convert activity id to activity name(task 3) and append it,
    # together with, user identification to the dataset
    match.idx <- match(activity_id$Activity_Id,activity_labels$Activity_Id)
    dataset   <- cbind(Activity=activity_labels$Activity[match.idx], dataset)
    dataset   <- cbind(Subject=subject, dataset)
    dataset
}

# Download and unzip the raw data
fetch_data()

# Compile one data frame for each of the train and test sets
dataset_test  <- read_and_compile_set("test")
dataset_train <- read_and_compile_set("train")

# Task 1: Merge the "test" and "train" datasets
dataset <- rbind(dataset_train, dataset_test)

# Task 5: Create a Tidy dataset
# Melt the combined dataset by ids; Subject and Activity
# Exclude Subject, Activity and Set variables from the measured variables
dataset_melt <- melt(dataset,
                    id=names(select(dataset, (Subject:Activity))),
                    measure.vars=names(select(dataset, -(Subject:Activity))))

# Cast the molten data frame into a shape where the mean is executed for
# each measurement and order it by Subject & Activity
tidy_set <- dcast(dataset_melt, Subject + Activity ~ variable, mean)
write.table(tidy_set, "./TidyDataSet.txt", row.name=FALSE)