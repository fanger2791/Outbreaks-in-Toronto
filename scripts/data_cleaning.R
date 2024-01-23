#### Preamble ####
# Purpose: Cleans raw data for outbreaks within toronto healthcare insitiutions
# Author: Michael Fang
# Email: m.fang@mail.utoronto.ca
# Date: 23 January 2023

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

# Convert date columns to Date type
data$`Date Outbreak Began` <- as.Date(data$`Date Outbreak Began`, format="%Y-%m-%d")
data$`Date Declared Over` <- as.Date(data$`Date Declared Over`, format="%Y-%m-%d")

# Convert 'Active' column to boolean (TRUE for 'Y', FALSE for 'N')
data$Active <- data$Active == "Y"

# Remove duplicate rows
data <- distinct(data)

#Change heading names to be more concise
data <- data %>%
  rename(ID = `X_id`, Name = `Institution.Name`, Address = `Institution.Address`, Setting = `Outbreak.Setting`, Type = `Type.of.Outbreak`, Causative1 = `Causative.Agent.1`, Causative2 = `Causative.Agent.2`, DateBegan = `Date.Outbreak.Began`, DateEnded = `Date.Declared.Over`) %>%
  mutate(ID = str_to_title(ID),
         Name = str_to_title(Name),
         Address = str_to_title(Address),
         Setting = str_to_title(Setting),
         Type = str_to_title(Type), 
         Causative1 = str_to_title(Causative1), 
         Causative2 = str_to_title(Causative2),
         DateBegan = str_to_title(DateBegan),
         DateEnded = str_to_title(DateEnded))%>%
  select(-Causative2)

# Add a new column for outbreak duration - Duration will be NA for ongoing outbreaks
data$Duration <- interval(start = data$`Date Outbreak Began`, end = data$`Date Declared Over`) / ddays(1)

# Write the cleaned data to a new CSV file
write.csv(data, "outputs/data/cleaned_healthcare_data.csv", row.names = FALSE)

