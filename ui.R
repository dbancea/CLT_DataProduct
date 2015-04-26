library(shiny);
shinyUI(pageWithSidebar(
  headerPanel("Central Limit Theorem"),
  sidebarPanel(
    numericInput('observations','Number of Observations', 5000, min=100, max=10000, step=20),
    radioButtons("dist", "Probability Distribution",
                 c("Uniform", "Exponential",
                   "Poisson", "Normal"),
                 selected = "Normal"
   ),
   numericInput('lambdaPois', 'Lambda value for Poisson distribution', 1, min=0.1, max=10, step=0.1),
   numericInput('sampleSize', 'Sample Size', 30, min=1, max=500, step=1),
   numericInput('samples', 'Number of Samples', 1000, min=1, max=1000, step=1),
   submitButton('Submit')
  ),
mainPanel(
  plotOutput(outputId = "newDist"),
  plotOutput(outputId = "newHist"),
  plotOutput(outputId = "newStdSampHist"),
  plotOutput(outputId = "newSampHist"),
  h4('Population mean'),
  verbatimTextOutput("pop_mean"),
  h4('Mean for sample mean'),
  verbatimTextOutput("sampmean_mean")
)
));


