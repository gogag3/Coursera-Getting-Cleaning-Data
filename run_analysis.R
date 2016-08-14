# The path for files
path_files <- "~/UCI HAR Dataset"
# Reading the data from different files
Activity_Train_Data <- read.table(file.path(path_files, "train", "Y_train.txt"), header = FALSE)
Activity_Test_Data <- read.table(file.path(path_files, "test", "Y_test.txt"), header = FALSE)
Subject_Train_Data <- read.table(file.path(path_files, "train", "subject_train.txt"), header = FALSE)
Subject_Test_Data <- read.table(file.path(path_files, "test", "subject_test.txt"), header = FALSE)
Features_Train_Data <- read.table(file.path(path_files, "train", "X_train.txt"), header = FALSE)
Features_Test_Data <- read.table(file.path(path_files, "test", "X_test.txt"), header = FALSE)
# View and visually inspect
View(Features_Train_Data)
# Merging the data
Activity_merged_Data <- rbind(Activity_Train_Data, Activity_Test_Data)
Subject_merged_Data <- rbind(Subject_Train_Data, Subject_Test_Data)
Features_merged_Data <- rbind(Features_Train_Data, Features_Test_Data)
# Setting Descriptive Names for variables
names(Activity_merged_Data) = "Activity"
names(Subject_merged_Data) = "Subject"
featurenames <- read.table(file = "~/features.txt", header = FALSE)
names(Features_merged_Data) = featurenames$V2
# Combining the Training and Test Data
subject_activity_combined <- cbind(Subject_merged_Data, Activity_merged_Data)
Data <- cbind(Features_merged_Data, subject_activity_combined)
namesOfdataRequired <- featurenames$V2[grep("mean\\(\\)|std\\(\\)", featurenames$V2)]
Final_Names <- c(as.character(namesOfdataRequired), "Subject", "Activity")
Data <- subset(Data, select = Final_Names)
# View for visual Inspection
str(Data)

filepath_activityLabel = "~/activity_labels.txt"
Act_Labels <- read.table(filepath_activityLabel, header = F)
Act_Labels[,2] <- as.character(Act_Labels[,2])
# Convert Name into factors
Data$Activity <- factor(Data$Activity, levels = Act_Labels[,1], labels = Act_Labels[,2])
Data$Subject <- as.factor(Data$Subject)

# Create one Data set with all the variables as desired and taking average of each value
Data2 <- aggregate(. ~ Subject + Activity, Data, mean)
Data2 <- Data2[order(Data2$Activity, Data2$Subject), ]
# Write a Tidy Data Set
write.table(Data2, file = "tidy_data.txt", row.names = FALSE)