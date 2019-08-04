---
title: "README.md"
author: "Jquinsan"
date: "Sunday, March 22, 2015"
output: html_document
---

# Data

This script use the data of Human Activity Recognition Using Smartphones Dataset. That datase can be download from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# Description of experiment

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.


# Data treatment

The script in this repo merge test data and training data. Extract of the new dataset de measurements on the mean and standard deviation. Replace the activities values by descriptive names (WALKING, WALKING UPSTAIR, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING). Rename all of measurements names by non abbreviated names and then calculate the mean of all measurements by subject and activities. The new dataset contain a six rows for each subjet, one by each activity.
