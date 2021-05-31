library(shiny)
library(dplyr)
library(ggplot2)
library(leaflet)
library(DT)
library(maps)

data <- read.csv("eda/data/HEALTH_PROC_11052021025328109.csv")
data(world.cities)

server <- function(input, output) {
  output$plot_data <- renderPlot({
    plot_data1 <- data %>%
      filter(Year >= 2000 & Year <= 2018) %>%
      ungroup() %>%
      group_by(Year, Country) %>%
      summarise(Stay = mean(Value)) %>%
      ungroup() %>%
      filter(Country == input$Country)

    lh_plot <- ggplot(plot_data1) +
      geom_line(aes(
        x = Year,
        y = Stay
      ), group = 1) +
      labs(
        title = "Hospital Average Length of Stay by Countries (2000 - 2018)",
        x = "Year", y = paste0("Average Length of Stay for ", input$Country),
        color = "Country"
      )

    lh_plot
  })

  output$map <- renderLeaflet({
    df <- world.cities %>%
      filter(capital == 1) %>%
      dplyr::select(Country = country.etc, lat, lng = long) %>%
      left_join(hospital_length_of_stay, ., by = "Country") %>%
      filter(Year == input$Year)

    map <- leaflet(df) %>%
      addProviderTiles("CartoDB.Positron") %>%
      addCircleMarkers(
        lat = ~lat,
        lng = ~lng,
        radius = ~ Value / 5,
        color = "red",
        stroke = FALSE,
        popup = paste0("Country: ", df$Country)
      )

    map
  })
}
