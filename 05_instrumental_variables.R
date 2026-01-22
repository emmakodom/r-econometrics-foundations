# ----------------------------------
# Title: Instrumental Variables Regression
# Author: Emmanuel Kodom
# ----------------------------------

# Load libraries
library(tidyverse)
library(fixest)

# Load data
data <- read.csv("data/simulated_panel_data.csv")

# Instrumental Variables regression
# education is treated as endogenous
# instrument is used as an IV
model_iv <- feols(
  outcome ~ income | id + year | education ~ instrument,
  data = data,
  cluster = ~id
)

# Display results
summary(model_iv)
