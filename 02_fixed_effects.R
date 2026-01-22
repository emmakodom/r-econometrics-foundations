# ----------------------------------
# Title: Fixed Effects Regression
# Author: Emmanuel Kodom
# ----------------------------------

# Load libraries
library(tidyverse)
library(fixest)

# Load data
data <- read.csv("data/simulated_panel_data.csv")

# Fixed Effects regression
# Controls for time-invariant unobserved heterogeneity
model_fe <- feols(
  outcome ~ treatment + education + income | id + year,
  data = data,
  cluster = ~id
)

# Display results
summary(model_fe)
