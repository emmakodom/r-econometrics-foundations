# ----------------------------------
# Title: Difference-in-Differences (DiD)
# Author: Emmanuel Kodom
# ----------------------------------

# Load libraries
library(tidyverse)
library(fixest)

# Load data
data <- read.csv("data/simulated_panel_data.csv")

# Create DiD variables
data <- data %>%
  mutate(
    treated_group = ifelse(id <= 50, 1, 0),
    post_policy = ifelse(year >= 2006, 1, 0),
    did = treated_group * post_policy
  )

# DiD regression
model_did <- feols(
  outcome ~ did + education + income | id + year,
  data = data,
  cluster = ~id
)

# Display results
summary(model_did)
