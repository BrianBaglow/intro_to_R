##Exercises for Part 4

#Exercise 1 - read in nairn_raw tab separated file
library(tidyverse)

nairn_num <- read_tsv("C:/Users/user/Google Drive/Documents/Brian's Documents/2020/EDU/UHI - Data Course/intro_to_R/Data/nairn_raw.tsv")
#view(nairn_num)
# Exercise 2 - clean and tidy the dataset

colnames(nairn_num)

nairn_num %>%
  mutate(across(where(is.character), str_remove, pattern = "\\*")) %>%
  # then change to numeric
  mutate(across(where(is.character), as.numeric))
view(nairn_num)
  
  
  mutate(across(colnames(nairn_num)[3:8], as.numeric))
  str_remove('tmax (degC)', "\\*")
view(nairn_num)

