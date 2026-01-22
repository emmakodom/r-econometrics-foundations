# ----------------------------------
# Title: Panel Data Models
# Author: Emmanuel Kodom
# ----------------------------------

# Load libraries
library(tidyverse)
library(fixest)

# Load data
data <- read.csv("data/simulated_panel_data.csv")

# Pooled OLS (ignores panel structure)
model_pooled <- lm(
  outcome ~ treatment + education + income,
  data = data
)

# Fixed Effects panel model
model_panel_fe <- feols(
  outcome ~ treatment + education + income | id + year,
  data = data,
  cluster = ~id
)

# Compare results
summary(model_pooled)
summary(model_panel_fe)
