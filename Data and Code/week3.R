#Data Import and cleaning
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

raw_df <- read.csv("week3.csv")
raw_df$timeStart <- as.POSIXct(as.Date(raw_df$timeStart, format = "%m/%d/%Y"))
raw_df$timeEnd <- as.POSIXct(as.Date(raw_df$timeEnd, format = "%m/%d/%Y"))
clean_df <- subset(raw_df, format(raw_df$timeStart, '%m') != '06')
clean_df <- subset(clean_df, format(clean_df$q6) == "1")