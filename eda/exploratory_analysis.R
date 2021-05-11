surgical_procedures <- read.csv('data/HEALTH_PROC_11052021025404519.csv')
hospital_length_of_stay <- read.csv('data/HEALTH_PROC_11052021025328109.csv')

agg = aggregate(hospital_length_of_stay,
                by = list(hospital_length_of_stay$Country),
                FUN = mean)

# Padma - 1. Distribution of the mean of average hospital stay length by country
# Ayush - 2. Distribution of the mean of average hospital stay length by year

# Dependent variable: average length of stay in hospital

# Thomas - 3. make a scatter plot for a single country over time
# Zikai - 4. make a line plot for all countries in a single year