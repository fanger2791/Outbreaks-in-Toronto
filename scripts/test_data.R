#### Preamble ####
# Purpose: Test Data
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

# Test 1 - Verify the number of records
sim_test_1 <- nrow(simulated_data) == 1067
sim_test_1

# Test 2 - Check date range validity
sim_test_2 <- all(simulated_data$Date_Outbreak_Began >= as.Date('2023-01-01')) &&
  all(simulated_data$Date_Outbreak_Began <= as.Date('2023-12-31'))
sim_test_2

# Test 3 - Verify unique institution names
sim_test_3 <- length(unique(simulated_data$Institution_Name)) == nrow(simulated_data)
sim_test_3

# Test 4 - Outbreak setting distribution
expected_settings <- c("LTCH", "Hospital", "Community", "School", "Other")
sim_test_4 <- all(names(table(simulated_data$Outbreak_Setting)) %in% expected_settings)
sim_test_4

# Test 5 - Active outbreaks count
sim_test_5 <- sum(simulated_data$Active == 'Y') <= nrow(simulated_data) * 0.2
sim_test_5

