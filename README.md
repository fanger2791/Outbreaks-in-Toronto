# Outbreaks-in-Toronto

## Overview

This repo provides students with a foundation for their own projects associated with *Telling Stories with Data*. You do not need every aspect for every paper and you should delete aspects that you do not need.

To use this folder, click the green "Code" button", then "Download ZIP". Move the downloaded folder to where you want to work on your own computer, and then modify it to suit.

## File Structure

The repo is structured as:

-   `input/data` contains the data sources used in analysis including the raw data.
-   `outputs/data` contains the cleaned dataset that was constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## How to Run and Reproduce

Run `scripts/download_data.R` to download the raw data
Run `scripts/simulate_data.R` to simulate what the data could look like
Run `scripts/test_data.R` to test the data
Run `scripts/data_cleaning.R` to generate the clean data
Run `outputs/paper/paper.qmd` and render the quarto file to see the pdf

## LLM usage

LLMs were used in aid to write this paper. You can see the usage here at `inputs/LLM/usage.txt` 