library(ggplot2)

# Import Data
hospital_length_of_stay <- read.csv('data/HEALTH_PROC_11052021025328109.csv')

##################################################################################
# Padma
# Graph 1: Distribution of the mean of average hospital stay length by country
aggregated_df = aggregate(hospital_length_of_stay,
      by = list(hospital_length_of_stay$Country),
      FUN = mean)

colnames(aggregated_df) <- c("CountryName", "", "", "", "", "", "", "", "", "Value")

plot_hist<-ggplot(aggregated_df, aes(x=Value)) + 
  geom_histogram(color="black", fill="lightblue", binwidth=1) +
  labs(x="Average Hospital Stay (in days)",
       y="Number of Countries",
       title="Average Hospital Stay Per Country")

##################################################################################
# Ayush
# Graph 2: Distribution of the mean of average hospital stay length by year

# Dependent variable = average length of stay in hospital

# Thomas
# Graph 3: Make a scatter plot for a single country over time

# Zikai
# Graph 4: Make a line plot for all countries in a single year