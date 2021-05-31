library(shiny)
library(dplyr)
library(ggplot2)
library(leaflet)
library(DT)

data <- read.csv("eda/data/HEALTH_PROC_11052021025328109.csv")

intro_panel <- tabPanel(
  "Introduction",
  p("Group 8: Padma Gundapaneni, Ayush Banwari, Thomas Lee, Zikai Song"),
  h4("Purpose"),
  p("In the recent global pandemic of COVID-19, we noticed that a great
    number of countries faced or are facing the issue of medical resource
    shortage. People lost their lives because of the lack of beds,
    ICU spots, and even oxygen. This phenomenon raised our concerns in
    medical and healthcare resource and utilization data. In this research,
    examined the healthcare usage data by countries to uncover some insights
    about the distribution and utilization of healthcare resources across
    the globe."),
  h4("Data"),
  p(
    "The dataset we used comes from the Organisation for Economic Co-operation
    (OECD). The dataset contains healthcare utilization data from many different
    countries from 2000 to 2018. It includes data about the average length of
    stay in a hospital by year and country, as well as by medical condition.
    The data was collected by OECD from a variety of credible health
    departments across the world. The data was accessed from the OECD website,
    at the following",
    tags$a(
      href = "https://stats.oecd.org/Index.aspx?DataSetCode=HEALTH_PROC#",
      "link."
    )
  ),
  h4("Methods"),
  p("We filtered the dataset by year and country to obtain healthcare
    utilization data by those two parameters. We not only looked at the most
    recent year of data, but also compared data across year to understand
    how healthcare utilization has changed over time. We analyzed differences
    across countries as well to see which countries use hospitals more
    and which ones use them less."),
  h4("Insights and Benefits"),
  p("Using our resource, healthcare researchers will be able to learn
  about how different countries perform on their healthcare utilization.
  Some specific questions that we answered are: 'Which countries historically
  have used healthcare more than others?' and 'Which years had the highest
  healthcare utilization?' Based on our insights, researchers will also
  be able to study the factors that affect the quality of healthcare
  utilization to improve their services.")
)

year_panel <- tabPanel(
  "Hospital Average Length of Stay by Country",
  sidebarLayout(
    sidebarPanel(
      h4("Adjustable Parameters"),
      selectInput(
        inputId = "Country",
        label = "Country",
        choices = c(
          "Australia", "Austria", "Belgium", "Canada", "Chile", "Costa Rica",
          "Czech Republic", "Denmark", "Estonia", "Finland", "France",
          "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Israel",
          "Italy", "Korea", "Latvia", "Lithuania", "Luxembourg",
          "Mexico", "Netherlands", "New Zealand", "Norway", "Poland",
          "Portugal", "Slovak Republic", "Slovenia", "Spain", "Sweden",
          "Switzerland", "Turkey", "United Kingdom", "United States"
        ),
        selected = "Australia"
      )
    ),
    mainPanel(
      h4("Hospital Average Length of Stay by Country"),
      plotOutput(outputId = "plot_data"),
    )
  )
)

map_panel <- tabPanel(
  "Hospital Average Length of Stay by Year",
  sidebarLayout(
    sidebarPanel(
      h4("Adjustable Parameters"),
      selectInput(
        inputId = "Year",
        label = "Year",
        choices = c(
          "2000", "2001", "2002", "2003", "2004", "2005",
          "2006", "2007", "2008", "2009", "2010", "2011",
          "2012", "2013", "2014", "2015", "2016", "2017",
          "2018"
        ),
        selected = "2000"
      )
    ),
    mainPanel(
      h4("Hospital Average Length of Stay by Year"),
      leafletOutput(outputId = "map"),
    )
  )
)

insights_panel <- tabPanel(
  "Insights and Conclusion",
  h4("Insights"),
  p("Hospital average length of stay has stayed consistent across the years
    2011-2017. In the United States there is an interesting drop between the
    years 2005 and 2007 when the average length of hospital stay was much
    less than the years prior and following this time frame. Interestingly,
    countries such as Spain and Korea had spikes at the tail end of this
    time period (roughly 2017), while most other countries such as the
    United States, United Kingdom, and New Zealand saw lows in the at the
    tail end of the time period. The map is also of interest because the
    map shows that throughout the years European countries have not had a
    vast amount of change of hospital average length of stay during the
    time period of 2011-2018."),
  h4("Conclusion"),
  p("Therefore, while analyzing the data set and displaying it in the form of an
    app we were able to gain valuable insights of the change in hospital average
    length of stay. It was interesting to have one page dedicated to each
    countries average length of stay as well as a map that would show how the
    hospital average length of stay changed over time for all countries on a
    macro-level. Though the data set concerned data from the time periods
    between roughly 2000-2018, it is interesting to understand how the current
    pandemic may have changed this average length of stay. This app could allow
    researchers in the future to compare the hospital length of stay during the
    pandemic to the hospital length of stay prior to the pandemic. Thus, by
    creating this resource we hope to provide crucial knowledge to population
    health researchers in order to plan for any future possible threats to
    public health.")
)

ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
    "Healthcare Utilization Analysis",
    intro_panel,
    year_panel,
    map_panel,
    insights_panel
  )
)
