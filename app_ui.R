page1 <- tabPanel(
  "Introduction",
  h1("Introduction"),
  p("In the recent global pandemic of COVID-19, we noticed that a great number of countries faced or "),
  p("are facing the issue of medical resource shortage. People lost their lives because of the lack of beds, "),
  p("ICU spots, or even oxygen. This phenomenon raises our concerns in medical and healthcare resource "),
  p("and utilization data. In this research, we plan to examine the healthcare usage data by countries to "),
  p("provide some insights to people about the distribution and utilization of healthcare resources across "),
  p("the globe."),
  h1("Datasets"),
  p("There are the two data sources we used for this project."),
  p(""),
  p("The dataset we hope to use comes from the Organisation for Economic Co-operation (OECD). The "),
  p("dataset contains healthcare utilization data from many different countries from 2000 to 2018. It "),
  p("includes many indicators of healthcare utilization, such as consultations, surgical procedures, waiting "),
  p("times, the average length of stay, and more. The data collected by OECD from a variety of credible "),
  p("health departments across the world. The data was accessed from the OECD website, at the following "),
  p("link: https://stats.oecd.org/Index.aspx?DataSetCode=HEALTH_PROC#."),
  p(""),
  p("A dataset comes from the US Department of Health and Human Services (HHS). The dataset contains "),
  p("hospital utilization data related to COVID-19 in the United States from November 2020 to December "),
  p("2020. It includes the estimated number of hospital beds occupied for inpatient use for a given state "),
  p("and date. The data was collected by the Department of Health and Human Services as well as by state "),
  p("health departments. The data was accessed from the HHS website, at the following link: "),
  p("https://healthdata.gov/dataset/COVID-19-Estimated-Patient-Impact-and-Hospital-Cap/vzfs-79pr.")
)
ui <- navbarPage(
    "Sections",
    page1
)
