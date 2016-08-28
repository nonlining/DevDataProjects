library(shiny)

library(UsingR)

data(diamond)
data(galton)

x <- 0


shinyServer(
  function(input, output) {
    
    
    formulaText <- reactive({
      if(input$variable == 'diamond'){
        "Diamond"
      }
      else if (input$variable == 'galton') {
        "Galton"
      }
      
    })
    
    
    fit <- reactive({
      if(input$variable == 'diamond'){
          lm(diamond$price~., data = diamond)
      }
      else if (input$variable == 'galton') {
          lm(galton$child~., data = galton)
      }
    })
    
    pred <- reactive({
      coef(fit())[1] + coef(fit())[2] * as.numeric(input$text2)
    })
    
    
    output$Plot <- renderPlot({
      if(input$variable == 'diamond'){
        plot(diamond$carat, diamond$price,  
             bg = "lightblue", 
             col = "black", cex = 1.1, pch = 21,frame = FALSE)
        abline(fit(), lwd = 2)
      }
      else if(input$variable == 'galton'){
        plot(galton$parent,galton$child,
             bg = "lightblue", 
             col = "black", cex = 1.1, pch = 21,frame = FALSE)
        abline(fit(), lwd = 2)
        
      }
      points(as.numeric(input$text2),as.numeric(pred()),pch = 12, col = 'red', lwd = 3)
    })
    
    output$Datanames <- renderPrint({
      formulaText()
    })
    
    output$selectnames <- renderPrint({
      DataVariables()
    })
    
    output$fit <- renderPrint({
      summary(fit())
    })
    
    
    
    output$rPlot <- renderPlot({
      if(input$variable == 'diamond'){
        plot(diamond$price, resid(fit()));
      }
      else if (input$variable == 'galton'){
        plot(galton$child, resid(fit()));
      }
      abline(h = 0)
    })

    
    output$pred <- renderText({
      x = pred()
    })
    
  }
)