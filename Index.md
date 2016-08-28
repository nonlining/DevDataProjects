---
title       : Shiny Reproducible Pitch Presentation
subtitle    : 
author      : Min-Jung Wang
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction


Introduction

This presentation is part of the Course Project for the Coursera Developing Data Products class. The peer assessed assignment has two parts. First, we need to create a Shiny application and deploy it on Rstudio's servers. Second, we should use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about the application. This presentation adresses the second part of the course project.

The app developed for the first part of the assignment is avalilable at: https://nonlining.shinyapps.io/DevDataProjects/

Source code for ui.R and server.R files are available on the GitHub: https://github.com/nonlining/DevDataProjects


--- .class #id 

## Simple Linear Regression Model Demo

This application using 2 data set in regression class, Diamond and Galton. 
You can use select which data set you want to use. It will also show regression model plot, Residuals and summary on left side.
After you select the data set, you can use text box to predict diamond price with caret or child high with parent high.

The purpose of this application is for showing some basic shiny application skill.

--- .class #id 

## Embedded R Code


```r
library(UsingR)

data(diamond)
data(galton)

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
```

```
## Error in output$Plot <- renderPlot({: object 'output' not found
```

```r
    output$Datanames <- renderPrint({
      formulaText()
    })
```

```
## Error in output$Datanames <- renderPrint({: object 'output' not found
```

```r
    output$selectnames <- renderPrint({
      DataVariables()
    })
```

```
## Error in output$selectnames <- renderPrint({: object 'output' not found
```

```r
    output$fit <- renderPrint({
      summary(fit())
    })
```

```
## Error in output$fit <- renderPrint({: object 'output' not found
```

```r
    output$rPlot <- renderPlot({
      if(input$variable == 'diamond'){
        plot(diamond$price, resid(fit()));
      }
      else if (input$variable == 'galton'){
        plot(galton$child, resid(fit()));
      }
      abline(h = 0)
    })
```

```
## Error in output$rPlot <- renderPlot({: object 'output' not found
```

```r
    output$pred <- renderText({
      x = pred()
    })
```

```
## Error in output$pred <- renderText({: object 'output' not found
```

--- .class #id 

## Application screenshots



