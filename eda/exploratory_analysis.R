library(ggplot2)
library(dplyr)

# Import Data
hospital_length_of_stay <- read.csv("data/HEALTH_PROC_11052021025328109.csv")

# Padma
# Graph 1: Distribution of average hospital stay length variable
filtered_df <- hospital_length_of_stay %>%
  filter(Variable == "All causes")

hist_length_of_stay <- ggplot(data = filtered_df) +
  geom_histogram(
    stat = "count", mapping = aes(x = Value), fill = "lightblue",
    color = "black", binwidth = 30
  ) +
  labs(
    title = "Average Length of Stay Frequency Distribution",
    x = "Average Length of Stay (in days)",
    y = "Frequency"
  )

# Ayush
# Graph 2: Distribution of the year variable
year_distribution_plot <- ggplot(data = hospital_length_of_stay) +
  geom_histogram(
    mapping = aes(x = Year), fill = "lightblue",
    color = "black", bins = 10
  ) +
  labs(
    title = "Year Frequency Distribution",
    x = "Year",
    y = "Frequency"
  )

# Thomas
# Graph 3: Make a plot for a single country over time
new_data <- hospital_length_of_stay %>%
  filter(Variable == "All causes" & Country == "Korea")

korea_plot <- ggplot(data = new_data) +
  geom_point(mapping = aes(x = Year, y = Value)) +
  labs(
    title = "Average Length of Stay in Hospital (Korea, 2002 - 2018)",
    x = "Years",
    y = "Average Length of Stay (in days)"
  )

# Zikai
# Graph 4: Make a plot for all countries in a single year
barpdata <- hospital_length_of_stay %>%
  filter(Variable == "All causes" & Year == 2000)

barp <- ggplot(data = barpdata) +
  geom_col(mapping = aes(x = reorder(Country, Value), y = Value)) +
  coord_flip() +
  labs(
    title = "Average Length of Stay in Hospital in 2000 by Country",
    x = "Country", y = "Average Length of Stay in Hospital (in days)"
  )
