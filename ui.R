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
                            verbatimTextOutput("pred"),
                            helpText("This application using 2 data set in regression class, Diamond and Galton. You can use selec which data set you want to use. It will show regression model plot, Residuals and summary in left side.",
                                     "After you select the data set, you can use text box for predict diamond price with caret or child high with parent high.")

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