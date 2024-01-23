#### Preamble ####
# Purpose: Simulates data for outbreaks within toronto healthcare insitiutions
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

#### Build simulated data ####

set.seed(123)

# Function to generate more realistic names and addresses
generate_names <- function(n) {
  paste0(sample(c("Maple", "Cedar", "Elm", "Pine", "Oak", "Birch", "Willow"), n, replace = TRUE), 
         " ",
         sample(c("Hospital", "Care Center", "Clinic", "Nursing Home", "Medical Center"), n, replace = TRUE))
}

generate_addresses <- function(n) {
  paste0(sample(1:1000, n, replace = TRUE), 
         " ",
         sample(c("Main", "Park", "Oak", "Pine", "Elm", "Maple", "Cedar"), n, replace = TRUE), 
         " St, ",
         sample(c("Toronto", "Mississauga", "Brampton", "Markham", "Vaughan"), n, replace = TRUE))
}

# Function to generate realistic causative agents
generate_causative_agents <- function(n) {
  sample(c("Influenza A", "Influenza B", "Norovirus", "COVID-19"), n, replace = TRUE)
}

# Function to simulate data
simulate_data <- function(n) {
  tibble(
    #_id = 1:n,
    Institution_Name = generate_names(n),
    Institution_Address = generate_addresses(n),
    Outbreak_Setting = sample(c("LTCH", "Hospital", "Community", "School", "Other"), n, replace = TRUE),
    Type_of_Outbreak = sample(c("Respiratory", "Gastrointestinal", "Other"), n, replace = TRUE),
    Causative_Agent_1 = generate_causative_agents(n),
    Causative_Agent_2 = ifelse(runif(n) > 0.9, generate_causative_agents(n), NA_character_),
    Date_Outbreak_Began = as.Date('2023-01-01') + days(sample(1:365, n, replace = TRUE)),
    Date_Declared_Over = ifelse(runif(n) > 0.2, as.Date('2023-01-01') + days(sample(1:365, n, replace = TRUE)), NA),
    Active = ifelse(runif(n) > 0.2, 'N', 'Y')
  )
}

# Simulate data
simulated_data <- simulate_data(1067)

# Convert tibble to data frame
simulated_data_df <- as.data.frame(simulated_data)

# Select only the first 10 rows for display
first_10_rows <- head(simulated_data_df, 40)

# Print the first 10 rows of the data frame using kableExtra
first_10_rows %>%
  kbl(caption = "Outbreaks in Toronto Healthcare Institutions") %>%
  kable_classic(full_width = F, html_font = "Cambria")

#### Graph simulated data ####

# Process and visualize the data focusing on Outbreak Setting
simulated_data %>%
  group_by(`Outbreak_Setting`) %>%
  summarise(Count = n()) %>%
  ggplot(aes(x = `Outbreak_Setting`, y = Count, fill = `Outbreak_Setting`)) +
  geom_bar(stat = "identity") +
  labs(title = "Outbreaks by Setting", x = "Setting", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


