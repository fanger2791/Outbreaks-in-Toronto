# Outbreaks-in-Toronto

## Overview

This repo provides an overview and analysis of outbreak data from long-termcare homes and other healthcare instituions in 2023

## File Structure

The repo is structured as:

-   `input/data` contains the data sources used in analysis including the raw data.
-   `outputs/data` contains the cleaned dataset that was constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## How to Run and Reproduce

1. Run `scripts/download_data.R` to download the raw data
2. Run `scripts/simulate_data.R` to simulate what the data could look like
3. Run `scripts/test_data.R` to test the data
4. Run `scripts/data_cleaning.R` to generate the clean data
5. Run `outputs/paper/paper.qmd` and render the quarto file to see the pdf

## LLM usage

LLMs were used in aid to write this paper. You can see the usage here at `inputs/LLM/usage.txt` 