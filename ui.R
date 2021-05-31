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
    p("In the recent global pandemic of COVID-19, we noticed that a great number of countries faced or are facing the issue of medical resource shortage. People lost their lives because of the lack of beds, ICU spots, or even oxygen. This phenomenon raised our concerns in medical and healthcare resource and utilization data. In this research, examined the healthcare usage data by countries to uncover some insights about the distribution and utilization of healthcare resources across the globe."),
    h4("Data"),
    p("The dataset we used comes from the Organisation for Economic Co-operation (OECD). The dataset contains healthcare utilization data from many different countries from 2000 to 2018. It includes data about the average length of stay in a hospital by year and country, as well as by medical condition. The data was collected by OECD from a variety of credible health departments across the world. The data was accessed from the OECD website, at the following", tags$a(href = "https://stats.oecd.org/Index.aspx?DataSetCode=HEALTH_PROC#", "link"), ".")
)

year_panel <- tabPanel(
    "Hospital Average Length of Stay by Countries",
        sidebarLayout(
            sidebarPanel(
                h4("Adjustable Parameters"),
                selectInput(
                    inputId = "Country",
                    label = "Country",
                    choices = c("Australia", "Austria", "Belgium", "Canada", "Chile", "Costa Rica", "Czech Republic", "Denmark", "Estonia", "Finland", "France", 
                                "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Israel", "Italy", "Korea", "Latvia", "Lithuania", "Luxembourg", "Mexico", 
                                "Netherlands", "New Zealand", "Norway", "Poland", "Portugal", "Slovak Republic", "Slovenia", "Spain", "Sweden", "Switzerland", 
                                "Turkey", "United Kingdom", "United States"),
                    selected = "Australia"
                )),
            mainPanel(
                h4("Scatterplot"),
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
                choices = c("2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"),
                selected = "2000"
            )),
        mainPanel(
            h4("Map"),
            plotOutput(outputId = "plot_map"),
        )
    )
)

insights_panel <- tabPanel(
    "Insights and Conclusion"
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