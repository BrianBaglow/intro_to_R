##SKILLS TEST 2 - Brian Baglow - 

# load package
library(tidyverse)

# set seed and sample size
set.seed(8) # change this
sample_size <- 500 # feel free to increase this

# create randomised tibble/data frame
fuel_data <- tibble(
  year = sample(c(2010:2020), min(500, sample_size), replace = TRUE),
  month = sample(c(1:12), min(500, sample_size), replace = TRUE),
  day = sample(c(1:31), min(500, sample_size), replace = TRUE),
  petrol_price = round(rnorm(min(500, sample_size), 110, 1)/100, 2),
  diesel_price = round(rnorm(min(500, sample_size), 120, 1)/100, 2)
)
fuel_data
# write fuel_data to file
# ----- write a csv file to my working directory, from the tibble created above -----
write_csv(fuel_data, "C:/Users/user/Google Drive/Documents/Brian's Documents/2020/EDU/UHI - Data Course/intro_to_R/Data/fuel_prices.csv")

# ----- read csv file in from data directory and create the fuel_data_2 dataframe ------
fuel_data_2 <- read_csv("C:/Users/user/Google Drive/Documents/Brian's Documents/2020/EDU/UHI - Data Course/intro_to_R/Data/fuel_prices.csv")

# ----- display the newly created data frame -----
view(fuel_data_2)

# summarise data in at least one way 
# ----- Summarise the average petrol and diesel prices from the whole data set ----
summarise(fuel_data_2, ave_petrol = mean(petrol_price), ave_diesel = mean(diesel_price))

## ----- This DOES give some meaningful data - the average costs for both fuel types, but suspect this is 
# overly simplistic for a skills test -----


# plot the data in at least one way
# ----- Load the GGPLOT library for plotting -----
library(ggplot2)
ggplot(fuel_data_2, aes(x = year, y = petrol_price)) +
  geom_line()

# ----- This produces a confusing and useless plot, which doesn't illustrate anything, but does look like runes -----
# ----- A more useful chart could be to show the cost of petrol and diesel according to date -----
# ----- Let's create a date column from year, month & days -----


# ----- Load Lubridate library to handle date/time functions -----
library(lubridate)

# ----- Create a date column by combining Year, Month and Day columns with mutate() -----
fuel_data_2 <- mutate(fuel_data_2, date = str_c(year, month, day, sep = "/"),
# ----- Use the ymd() function to turn the date column into the date format -----
date = ymd(date))

# ----- Clean the data by filtering out date columns with NA using the na.omit() function
fuel_data_3 <- na.omit(fuel_data_2) 

# ----- Group by date -----
fuel_data_3 <- group_by(fuel_data_3, date)

# ----- Summarise the new data, by date, showing the average cost for both fuels -----
summarise(fuel_data_3, av_petrol = mean(petrol_price), av_diesel = mean(diesel_price))

# ----- Plot the costs of both fuels on the same graph over time (x-axis) -----
ggplot(fuel_data_3, aes(x = date)) +
 geom_line(aes(y = petrol_price, colour = "darkred")) + 
  geom_line(aes(y = diesel_price, colour= "steelblue")) +
  
# ----- Change the legend title and components to reflect the fuel types -----
  scale_color_discrete(name = "Fuel Type", labels = c("Petrol", "Diesel")) +
  
# ----- Label the X-axis as Date & Y axis to show it's displaying the cost of both fuels -----
  labs(y="Fuel Cost (£)", x="Date")

