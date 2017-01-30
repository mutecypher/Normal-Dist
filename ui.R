library(shiny)
shinyUI(fluidPage(
  titlePanel("Plot Normal Distribution, highlight area of interest"),
  sidebarLayout(
    sidebarPanel(
      h2("Just enter the Mean, the standard deviation, the lower limit, and the upper limit for the portion of the normal distribution that you care about"),
       numericInput("MeanValue", "Pick Mean of distribution",
                  -100, 100, value = c(0)),
      numericInput("StdDev", "Pick Standard deviation of distrubution",
                  .1, 100, value = c(1)),
      numericInput("lowerend", "Lower end of distribution of interest",
                -99, 99, value = c(1)),
      numericInput("upperend", "Upper end of distribution of interest",
                  -99, 100, value = c(2))

    ),
    mainPanel(
      h3("Graph of normal distribution with intervals of interest."),
     plotOutput("plot1"),
      h4("The area under the curve is written right above this.")
    )
  )
))
