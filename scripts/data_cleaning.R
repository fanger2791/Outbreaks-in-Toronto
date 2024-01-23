#### Preamble ####


#### Workspace setup ####
library(janitor)
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(knitr)
library(lubridate)
library(stringi)
library(ggplot2)
library(kableExtra)

#### Clean data ####

data <- read.csv("inputs/data/raw_healthcare_data.csv")

# Data Cleaning Steps

# Convert date columns to Date type
data$`Date Outbreak Began` <- as.Date(data$`Date Outbreak Began`, format="%Y-%m-%d")
data$`Date Declared Over` <- as.Date(data$`Date Declared Over`, format="%Y-%m-%d")

# Convert 'Active' column to boolean (TRUE for 'Y', FALSE for 'N')
data$Active <- data$Active == "Y"

# Remove duplicate rows
data <- distinct(data)

# Add a new column for outbreak duration
# Duration will be NA for ongoing outbreaks
data$Duration <- interval(start = data$`Date Outbreak Began`, end = data$`Date Declared Over`) / ddays(1)

# Write the cleaned data to a new CSV file
write.csv(data, "outputs/data/cleaned_healthcare_data.csv", row.names = FALSE)
