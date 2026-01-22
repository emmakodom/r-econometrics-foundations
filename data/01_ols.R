# ----------------------------------
# Title: Ordinary Least Squares (OLS)
# Author: Emmanuel Kodom
# ----------------------------------

# Load libraries
library(tidyverse)

# Load data
data <- read.csv("data/simulated_panel_data.csv")

# OLS regression
model_ols <- lm(outcome ~ treatment + education + income, data = data)

summary(model_ols)
