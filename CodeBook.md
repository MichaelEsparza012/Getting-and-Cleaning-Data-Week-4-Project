# Getting and Cleaning Data - Week 4 Project Code Book - Michael A. Esparza, PMP, PgMP, CPEM

# Executive Summary

This Code Book summarizes the r Script, data and variables in tidyData.txt and describes the information contained in the Dataset and elements used in the original data analysis study.  The R Script is reviewed first, followed by the Study Information and Data Elements.

# Description of the run_analysis.R Script

Script was designed and created to perform the following functions (Source: https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)

1. Input UCI HAR Dataset downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Merge the training and the test sets to create one data set. 

3. Extract only the measurements on the mean and standard deviation for each measurement. 

4. Use descriptive activity names to name the activities in the data set 

5. Appropriately label the data set with descriptive activity names. 

6. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

# Text Files Imported:

1. 'features.txt'

2. 'activity_labels.txt'

3. 'subject_train.txt'

4. 'x_train.txt'

5. 'y_train.txt'

6. 'subject_test.txt'

7. 'x_test.txt'

8. 'y_test.txt'

# Merging the Training and Test Datasets into one complete dataframe

The following text files were imported and merged: 

1. all files in the TRAINING set (_train.txt). 

2. all files in the TEST set (_test.txt).

3. Column names were assigned during data import and before merging the two datasets. 

4. Files were imported individually and applicable files were then merged into sets, completed prior to merging the two sets into the combined, complete dataset required.

# Specified Projects Tasks and Solutions (Source: https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project).

1. Extracting Measurements on Mean and Standard Deviation. 

Method of Extracting using R: A logical vector was created identifying TRUE for the ID, mean and stdev columns and FALSE for other values. Merged data was then subsetted to keep the required columns

2. Rename Activities in the Dataset with Descriptive Activity Names.

Methd of Renaming using R: 'activity_labels.txt' was merged with the subsetted data to add descriptive activity names to merged and subsetted data set. Values in 'activityId' column were then replaced with the matching values from the 'activityType' column for simplicity, clarity and readability. 

3. Appropirately Label Dataset with Descriptive Activity Names.

Method of Lableing using R:'gsub' function was used to tidy up the column names in the merged & subsetted datasets. 'activityType' column removed in order to cleand and tidy data more completely.

4. Independent Tidy Data Set created with the average for each variable and subject.

Method of creating in R: New table was created containing the average for each variable for each activity and subject.

# Study Information and Data Elements.

1. Information on Data Set. 

2. Sample Size / Number of Volunteers: 30

3. Demographics / Age Range: 19-48 years old

4. Number of Activities Performed: 6

    (1) WALKING

    (2) WALKING_UPSTAIRS

    (3) WALKING _DOWNSTAIRS

    (4) SITTING

    (5) STANDING

    (6) LAYING 

5. Wireless Sensor Network (WSN) equipment collecting the activity data:

    (1) Samsung Galaxy SII (Smartphone)

    (2) Methood Worn / Location of Smartphone: Waist

    (3) Samsung Galaxy S II Specifics: (Source: https://gadgets.ndtv.com/samsung-galaxy-s-ii-554)

      The Samsung Galaxy S II is a single SIM (GSM) smartphone that accepts a Regular-SIM. Connectivity options include Wi-Fi, GPS,           Bluetooth, NFC and 3G. Sensors on the phone include Compass/ Magnetometer, Proximity sensor, Accelerometer and Gyroscope.

      Samsung Galaxy S II smartphone was launched in April 2011. The phone comes with a 4.30-inch touchscreen display with a resolution       of 480 pixels by 800 pixels. The Samsung Galaxy S II is powered by 1.2GHz dual-core processor and it comes with 1GB of RAM. The         phone packs 16GB of internal storage that can be expanded up to 32GB via a microSD card. Cameras: the Samsung Galaxy S II packs a       8-megapixel primary camera on the rear and a 2-megapixel front shooter.

      The Samsung Galaxy S II runs Android 2.3 and is powered by a 1650mAh removable battery. It measures 125.30 x 66.10 x 8.49 (height       x width x thickness) and weighs 116.00 grams.

6. Methodology: 

    (1) Using its embedded accelerometer and gyroscope, the study captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

    (2) The experiments were recorded on video to allow for manual labeling of the collected data. 

    (3) The obtained dataset has been randomly partitioned into two datasets, designated "training" and "test":

       a. 70% of the volunteers were selected for generating the training data 

       b. 30% of the volunteeers were selected for generaeting the test data.

    (4) The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width       sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

    (5) The sensor acceleration signal, with gravitational and body motion inputs, were separated using a Butterworth low-pass filter       into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, resulting in the use     of a filter with 0.3 Hz cutoff frequency.

    (6) A vector of features was obtained by calculating variables from the time and frequency domain.

7. Dataset Records Elements:

    (1) Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

    (2) Triaxial Angular velocity from the gyroscope.

    (3) A 561-feature vector with time and frequency domain variables.

    (4) Activity Label.

    (5) A discrete identifier for each of the personnel who carried out the experiment.
    
    End of Code Book.
