# Exercises for Part 3 - Reading in Data and Dates/Strings

# Load entire tidyverse library
library(tidyverse)
library(readxl)

# Exercise 1 - practice using read_csv() and read_tsv() using local data sets
#read student data file
read_csv("C:/Users/user/Google Drive/Documents/Brian's Documents/2020/EDU/UHI - Data Course/intro_to_R/Data/student_marks.csv")
#read stornoway raw weather data file
read_tsv("C:/Users/user/Google Drive/Documents/Brian's Documents/2020/EDU/UHI - Data Course/intro_to_R/Data/stornoway_raw.tsv")

# Write a csv file from the storms dataset
write_csv(storms, path = "C:/Users/user/Google Drive/Documents/Brian's Documents/2020/EDU/UHI - Data Course/intro_to_R/Data/storms.csv")

#read the previously created storms.xls file 
read_excel("C:/Users/user/Google Drive/Documents/Brian's Documents/2020/EDU/UHI - Data Course/intro_to_R/Data/storms.xls")


#Exercise 3

# Change the storms status column into a factor

##HEEEEELPP

# Exercise 4
# Read in student_marks.csv, convert it to long format, plot it 

student_marks <- read_csv("C:/Users/user/Google Drive/Documents/Brian's Documents/2020/EDU/UHI - Data Course/intro_to_R/Data/student_marks.csv")
marks_long = pivot_longer(student_marks, cols = maths:economics,
             names_to = "subjects", values_to = "mark")
# plot the results using the new long data set. x-axis = student, y-axis = marks, colour = subjects
ggplot(marks_long, aes(x = student, y = mark, colour = subjects)) +
  geom_point()


#Exercise 5 
# See R markdown Document: exercises_3