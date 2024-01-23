#### Preamble ####
# Purpose: Downloads and Saves Data from opendatatoronto
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

#### Download data ####

# Set the package ID
package_id <- "80ce0bd7-adb2-4568-b9d7-712f6ba38e4e"

# Get all resources for this package
resources <- list_package_resources(package_id)

# Filter for datastore resources (CSV or GeoJSON)
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# Check if there are datastore resources
if (nrow(datastore_resources) > 0) {
  # Load the first datastore resource as a sample
  data <- filter(datastore_resources, row_number() == 1) %>% get_resource()
  
#### Save data ####
  
  # Write the data to a CSV file
  write.csv(data, "inputs/data/raw_healthcare_data.csv", row.names = FALSE)
}

