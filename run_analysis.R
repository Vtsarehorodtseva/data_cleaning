library(readr)
library(dplyr)

test_path <- list.files(path = ".", pattern = "X_test.txt", recursive = TRUE)
test <- read_delim(test_path, delim = "\t")
