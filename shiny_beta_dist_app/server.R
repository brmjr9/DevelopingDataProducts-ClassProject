# Shiny server module for Beta PDF/CDF Demonstrations
# Coursera class project - Developing Data Products
# 10/24/15 - Bruce Montgomery
#
# Thanks to http://shiny.rstudio.com/articles/action-buttons.html and
# http://shiny.rstudio.com/reference/shiny/latest/updateSliderInput.html
# for key code examples on updating sliders and plots dynamically

library(shiny)
library(ggplot2)

shinyServer(
  function(input, output, ClientData, session) {
  
  v <- reactiveValues(data = NULL)
    
  observeEvent(input$arcSin, {
    updateNumericInput(session, "alpha", value = .5)
    updateNumericInput(session, "beta",value = .5)
  })

  observeEvent(input$unif, {
    updateNumericInput(session, "alpha", value = 1)
    updateNumericInput(session, "beta",value = 1)
  })
  
  observeEvent(input$para, {
    updateNumericInput(session, "alpha", value = 2)
    updateNumericInput(session, "beta",value = 2)
  })
  
  observeEvent(input$powFun, {
    updateNumericInput(session, "alpha", value = 2)
    updateNumericInput(session, "beta",value = 1)
  })
  
  observeEvent(input$revPowFun, {
    updateNumericInput(session, "alpha", value = 1)
    updateNumericInput(session, "beta",value = 2)
  })

  observeEvent(input$Jshape, {
    updateNumericInput(session, "alpha", value = 2)
    updateNumericInput(session, "beta",value = .5)
  })
  
  observeEvent(input$revJshape, {
    updateNumericInput(session, "alpha", value = .5)
    updateNumericInput(session, "beta",value = 2)
  })
  
  output$plot1 <- renderPlot({
    x <- seq(0,1,length=101)
    a <- input$alpha
    b <- input$beta
    y <- dbeta(x,a,b)
    d <- data.frame(x,y)
    ggplot(d,aes(x,y))+geom_point(color="blue")+ylab("f(x)")
  })

  output$plot2 <- renderPlot({
    x <- seq(0,1,length=101)
    a <- input$alpha
    b <- input$beta
    y <- pbeta(x,a,b)
    d <- data.frame(x,y)
    ggplot(d,aes(x,y))+geom_point(color="red")+ylab("F(x)")
  })
  
})