library(janitor)
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(knitr)
library(lubridate)
library(stringi)
library(ggplot2)
library(kableExtra)

set.seed(123)

# Function to generate more realistic names and addresses
generate_names <- function(n) {
  paste0(sample(c("Maple", "Cedar", "Elm", "Pine", "Oak", "Birch", "Willow"), n, replace = TRUE), 
         " ",
         sample(c("Hospital", "Care Center", "Clinic", "Nursing Home", "Medical Center"), n, replace = TRUE))
}

# Function to generate realistic causative agents
generate_causative_agents <- function(n) {
  sample(c("Influenza A", "Influenza B", "Norovirus", "COVID-19", "Rhinovirus", "Adenovirus", "Rotavirus"), n, replace = TRUE)
}

# Function to simulate data
simulate_data <- function(n) {
  tibble(
    Institution_Name = generate_names(n),
    Causative_Agent_1 = generate_causative_agents(n),
    Date_Outbreak_Began = as.Date('2023-01-01') + days(sample(1:365, n, replace = TRUE)),
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

