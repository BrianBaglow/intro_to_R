## ----- Exercises Part 5 -----

# ----- Create two test vectors, one with < 10 values and one with > 10 values -----
library(tidyverse) #load tidyverse to read in CSV file for dataframe
test_vector <- c(1,2,3,4,5)
test_vector_2 <- c(1,2,3,4,5,6,7,8,9,10,11)

# ----- Create dataframe from student_marks CSV file -----
student_marks <- read_csv("C:/Users/user/Google Drive/Documents/Brian's Documents/2020/EDU/UHI - Data Course/intro_to_R/Data/student_marks.csv")
student_marks

# ----- Exercise 1.1 - Check the length of test_vector -----
if (length (test_vector) >=10) { # ------ check the length of the vector with the length() function -----
  print ("Vector has more than 10 values") # if vector has >=10 values, print >10
 } else {
  print ("Vector has fewer than 10 values") # if vector has <10 values, print <10
 }

# ----- Check the length of test_vector_2 -----
if (length (test_vector_2) >=10) { # ------ check the length of the vector with the length() function -----
  print ("Vector has more than 10 values") # if vector has >=10 values, print >10
} else {
  print ("Vector has fewer than 10 values") # if vector has <10 values, print <10
}

# ----- Check what happens when we feed the above if statement a dataframe -----
if (length (student_marks) >=10) { # ------ check the length of the vector with the length() function -----
  print ("Vector has more than 10 values") # if vector has >=10 values, print >10
} else {
  print ("Vector has fewer than 10 values") # if vector has <10 values, print <10
}

# BB - The data frame is reported as having fewer than 10 values, presumably because it
# has only 5 columns



# ----- Exercise 1.2 - Test whether something is a data frame -----

if (is.data.frame(student_marks) == TRUE) { # ------ Check whether the value is a data frame with the is.data.frame() function -----
  print ("This is a data frame") # if is.data.frame returns TRUE then it is a df
} else {
  print ("This is not a data frame") # if is.data.frame returns FALSE (list, etc.) it is NOT a df
}
# The function is.data.frame returns a true/false depending upon whether the input is or is not a data frame


# ----- Exercise 1.3 - Test whether something is a vector or a data frame.
# If it is a vector find its length. If it is a data frame find the number of rows and columns


# Create a test_data variable we can turn into different types of input
test_data <- student_marks


if (is.data.frame(test_data) == TRUE) { # ------ Check whether the value is a data frame with the is.data.frame() function -----
   print(paste("This is a data frame with dimensions:", dim(test_data))) # if it is a data frame, print the dimensions
}  else  if (is.list(test.data) == TRUE) {
  print ("Dude, this is a list!")
} else {
   print (paste("This is a vector of length: ", length(test_data))) # if not a data frame, it's a vector, so print it's length
}  
  

# ----- Exercise 5.2 -----
# Use FOR loops to:
# a) Loop through a vector and print out the cumulative total as you go 
# b) Adds the elements of two vectors of equal lengths together

# ----- Create two vectors for the above exercises -----
vector_one <- 1:10
vector_two <- 1:10

# Create a vector to place the total in
sum_x <- 0

for (i in c(1:length(vector_one))) { # go from the beginning to the end of vector_one
  sum_x <- sum_x + vector_one[i] # add each element of the vector into sum_x
  print(paste("count:", sum_x)) # print a running total as we add each number
}
print(paste("The total is", sum_x)) # print the total


# Add the elements of two equally sized vectors together
sum_y <- 0 # create a vector for the answers to go into

for (i in c(1:length(vector_one))) {#go from the beginning to the end of vector_one
sum_y <- vector_one[i] + vector_two[i] # add the elements [i] of each vector together
print(paste("sum:", sum_y))
}


Fibonacci <- numeric(10)
Fibonacci[1] <- Fibonacci[2] <- 1
for (i in 3:10) Fibonacci[i] <- Fibonacci[i - 2] + Fibonacci[i - 1]

print(paste("First 10 Fibonacci numbers:", Fibonacci))

