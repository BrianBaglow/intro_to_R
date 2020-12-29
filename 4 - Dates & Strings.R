#Part 4 - dates & strings

#Load tidyverse library
library(tidyverse)

#Substituting starwars for comic_characters
starwars

#paste command name / homeworld with a space as separator
paste(starwars$name, starwars$homeworld, sep = " ")

#paste command with dash as separator
paste(starwars$name, starwars$homeworld, sep = "-")

##DEFAULT SEPARATOR IS A SPACE

#paste0 command removes all separators
paste0(starwars$name, starwars$homeworld)

#using paste with collapse rather than a separator
test_vector <- c("a", "b", "c", "d", "e")
#remove spaces between each letter
paste(test_vector, collapse = "")

#add pipe between each letter
paste(test_vector, collapse = "|")

paste0(test_vector, collapse = " ")

# Combine strings and stored objects
name <- "Brian"
paste("My name is", name)


##STRINGR

library(stringr)
starwars
# str_c is the stringr equivalent of paste()
# The default is no separator between strings

str_c(starwars$name, starwars$homeworld, sep = " ")

#str_c with dash as separator
str_c(starwars$name, starwars$homeworld, sep = "-")

# Can also be used to combine objects and strings with the same syntax as paste()
str_c("My Name is", name, sep = " ")

# You can also use the glue functions to place the object in {curly brackets}
str_glue("My name is {name}")

##REPLACING TEXT
#str_replace() allows you to replace text
#replace letters with L337 numerals
str_replace(starwars$name, "e", "3")

# a different version replaces all characters
str_replace_all(starwars$name, "e", "*")

## FINDING STRINGS

#str_detect() returns a TRUE/FALSE if a specified string is present
starwars$name
str_detect(starwars$name, pattern = "Skywalker")

#str_which() tells you which elements of the vector contain the string
str_which(starwars$name, pattern = "Skywalker")

#You can use the former (str_detect() within a filter() 
library (dplyr) #load dplyr
starwars %>%
  filter(str_detect(name, pattern = "Skywalker"))

#You cannot use this with str_which()
starwars %>%
  filter(str_which(name, pattern = "Skywalker")

#But you can use it with slice()

starwars %>%
  slice(str_which(name, pattern = "Skywalker"))

#str_locate() finds the string and provides a row for each entry in your vector
# and both the start and end characters for the string.
# If the string isn't present it returns NA

str_locate(starwars$name, pattern = "Skywalker")

#You can control the case using the regex() function.
str_locate(starwars$name, regex("SKYWALKER", ignore_case = TRUE))

#For help use
vignette("stringr")

## COMBINING COLUMNS OF DATA
#Although we can use paste() or str_c() to paste columns together, it is
# sometimes easier to use functions designed to work within dataframes/tibbles
#The tidyr package has provided functions separate() and unite() to help
#separate() splits a column up
# unite() joins columns together

#We can use unite() to pull all the marks together

##THIS IS NOT A GOOD IDEA

#col - name of the new column we are creating
#The columns we want to stick together
#sep - the character we will use to separate the newly pasted columns

library(tidyr)
# redefining the data
marks <- tibble(year = c(2017:2019),
                maths = c(47, 66, 74),
                physics = c(49, 42, 64),
                english = c(72, 71, 63),
                french = c(48, 61, 46))
marks

#Stick the marks together
marks_again <- unite(marks, col = "Mark", maths:french, sep = ",")
marks_again

#We can then use separate() to split the column up again. We need to provide:
# col - the name of the comun we're going to split up
# into - a character vector with the names of the columns to create
#sep - the character (or position if numeric) that we will split the column up by

separate(marks_again, col = "Mark",
         into = c("maths", "physics", "english", "french"), sep = ",")

##OTHER TIDYR FUNCTIONS

#tidyr has many other functions. Two useful ones are:
#replace_na() and fill()

#Lets take the data from above and make it worse:

marks = tibble(year = c(2017:2019),
               maths = c(47, 66, NA),
               physics = c(49, 42, NA),
               english = c(72, NA, 63),
               french = c(NA, 61, 46))
marks

# Now we can replace the NA values
# ??? Is replacing NA with 0 a good idea???

replace_na(marks,
           replace = list(maths = 0, physics = 0,
                          english = 0, french = 0))

#If we put our data into a long format and remove some of the subject info, we
#can demonstrate fill()

marks_long = pivot_longer(marks, 
                          cols = maths:french, 
                          names_to = "subject", 
                          values_to = "mark") %>%
  arrange(subject)
# make some subjects blank
marks_long$subject <- c("english", NA, NA, "french", NA, NA, 
                        "maths", NA, NA, "physics", NA, NA)
marks_long

#fill() the subjects back in

fill(marks_long, subject)
?