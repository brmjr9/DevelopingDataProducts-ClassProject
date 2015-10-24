# Shiny UI module for Beta PDF/CDF Demonstrations
# Coursera class project - Developing Data Products
# 10/24/15 - Bruce Montgomery

shinyUI(pageWithSidebar(
  headerPanel("Beta Distribution Probability Functions Demonstration"),
  sidebarPanel(
    h5(HTML("App documentation: The beta distribution takes on different shapes based on the values of two shape parameters.  Use the sliders to modify the &alpha; & &beta; shape parameters, or press a button for one of the examples.  Plots of the PDF and CDF for the selected shape parameters will update automatically with any change.")),
    sliderInput('alpha', HTML("Select shape parameter &alpha;:") ,value = 1.5, min = .1, max = 4, step = 0.1),
    sliderInput('beta', HTML("Select shape parameter &beta;:") ,value = 3, min = .1, max = 4, step = 0.1),
    h4("Distribution Examples"),
    actionButton("arcSin", label = HTML("Arcsine: &alpha;=&beta;=1/2")),
    actionButton("unif", label = HTML("Uniform: &alpha;=&beta;=1")),
    actionButton("para", label = HTML("Parabolic: &alpha;=&beta;=2")),
    actionButton("powFun", label = HTML("Power: &alpha;>=1, &beta;=1")),
    actionButton("revPowFun", label = HTML("Reverse Power: &alpha;=1, &beta;>=1")),
    actionButton("Jshape", label = HTML("J-Shaped: &alpha;>=1, &beta;<1")),
    actionButton("revJshape", label = HTML("Reverse J-Shaped: &alpha;<1, &beta;>=1"))
  ),
  mainPanel(
    h4("PDF - Probability Distribution Function: f(x) = P(X = x)"),
    plotOutput('plot1'),
    h4("CDF - Cumulative Distribution Function: F(x) = P(X <= x)"),
    plotOutput('plot2')
  )
))