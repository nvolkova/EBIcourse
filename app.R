library(shiny)
load("shiny.plotting.Rdata")
source("myplot.R")

ui <- fluidPage(
  titlePanel("Mutational signatures catalogue"),
  sidebarLayout(
    sidebarPanel( 
      selectInput(inputId="gen", 
                  label="Choose genotype:", 
                  choices = genotypes,
                  selected = "N2"),
      selectInput(inputId="mut", 
                  label="Choose mutagen:", 
                  choices = c("NA",mutagens),
                  selected = "NA")),
  # Show a plot of the generated distribution
    mainPanel(
      plotOutput("myplot")
    )
  )
)

server <- function(input, output) {
  output$myplot <- renderPlot({
    if (input$mut!="NA") {
      effects <- E[paste(input$gen,input$mut,sep=":"),]
    } else {
      effects <- E[input$gen,]
    }
    myplot(effects, input$gen, input$mut)
  })
}


shinyApp(ui = ui, server = server)
