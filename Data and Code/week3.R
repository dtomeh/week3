#Data Import and cleaning
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

raw_df <- read.csv("week3.csv")
raw_df$timeStart <- as.POSIXct(as.Date(raw_df$timeStart, format = "%m/%d/%Y"))
raw_df$timeEnd <- as.POSIXct(as.Date(raw_df$timeEnd, format = "%m/%d/%Y"))
clean_df <- subset(raw_df, format(raw_df$timeStart, '%m') != '06')
clean_df <- subset(clean_df, format(clean_df$q6) == "1")

#Analysis 
clean_df$timeSpent <- difftime(clean_df$timeStart, clean_df$timeEnd, units = c("secs"))
hist((as.numeric(clean_df$timeSpent)))
frequency_tables_list <- lapply(clean_df[, 5:14], function(x) {table(x)})
lapply(frequency_tables_list, barplot)
sum(clean_df$q1 >= clean_df$q2 & clean_df$q2 != clean_df$q3)
for (table in frequency_tables_list) {
  barplot(table)}