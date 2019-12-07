library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(data.table)
options(scipen=999)
features_path <- list.files(pattern = "features.txt", recursive = TRUE)
features <- read_delim(features_path, delim = "\t", col_names = FALSE)
features1 <- features %>% separate(X1, c("number", "title"), sep = " ")

test_path <- list.files(pattern = "X_test.txt", recursive = TRUE)
test <- read_delim(test_path, delim = " ", col_names = features1$title)

training_path <- list.files(pattern = "X_train.txt", recursive = TRUE)
training <- read_delim(test_path, delim = " ", col_names = features1$title)

mean_std_names <- grep("mean|std", features1$title, value = TRUE)

df <- rbind(test, training)
df_1 <- df %>% select(mean_std_names)