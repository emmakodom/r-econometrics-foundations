# ----------------------------------
# Title: Simulated Panel Data Generator
# Author: Emmanuel Kodom
# ----------------------------------

set.seed(123)

# Create panel structure
n_ids <- 100
years <- 2000:2010

data <- expand.grid(
  id = 1:n_ids,
  year = years
)

# Generate variables
data$education <- rnorm(nrow(data), mean = 12, sd = 2)
data$income <- rnorm(nrow(data), mean = 30000, sd = 5000)
data$instrument <- rnorm(nrow(data))
data$treatment <- ifelse(data$year >= 2006, 1, 0)

# Outcome variable with structure
data$outcome <- 0.5 * data$treatment +
  0.3 * data$education +
  0.00001 * data$income +
  rnorm(nrow(data))

# Save dataset
write.csv(data, "data/simulated_panel_data.csv", row.names = FALSE)
