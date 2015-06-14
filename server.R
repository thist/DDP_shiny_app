library(shiny)
library(datasets)

# load the iris data from the datasets package into the application
irisData <- iris

# Define server logic required to plot various variables for different iris species
shinyServer(function(input, output) {
    
    # Compute the formula text in a reactive expression since it is
    # shared by the output$caption and output$irisPlot functions
    formulaText <- reactive({
        paste( input$property, "~ Species")
    })
    
    # Return the formula text for printing as a caption
    output$caption <- renderText({
        formulaText()
    })
    
    # Generate a plot of the requested variable vs iris species and
    # only include outliers if requested
    output$irisPlot <- renderPlot({
        boxplot(as.formula(formulaText()),
                data = irisData,
                xlab = "Species",
                ylab = paste(input$property, "[cm]"),
                outline = input$outliers)
    })
})