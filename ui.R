library(shiny)
library(UsingR)
data(diamond)


shinyUI(
  
  navbarPage("Shiny Application",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The Simple Linear Regression Model in Regression course"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Data Set:",
                                        c("diamond",
                                          "galton"
                                        )),
                            textInput(inputId="text2", label = "Predictor variable"),
                            p('Predicted variable'),
                            verbatimTextOutput("pred")

                          ),

                          
                          mainPanel(
                            h3(textOutput("Datanames")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("Plot", plotOutput("Plot")),
                                        tabPanel("Residuals and Summary", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             )

  )

) # shinyUI