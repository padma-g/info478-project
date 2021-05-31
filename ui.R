library(shiny)
library(dplyr)
library(ggplot2)
library(leaflet)
library(DT)

data <- read.csv("eda/data/HEALTH_PROC_11052021025328109.csv")

intro_panel <- tabPanel(
  "Introduction",
  p("Group: Padma Gundapaneni, Ayush Banwari, Thomas Lee, Zikai Song"),
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
  p(" "),
  h4("Conclusion"),
  p(" ")
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
