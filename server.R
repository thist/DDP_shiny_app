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
    
    # Generate quantiles of the requested variable over all iris species
    #output$quantiles <- renderText({
    #    paste("iris$", input$property)
    #})
    output$quantiles <- renderPrint({
        if( input$property == "Petal.Length") quantile(iris$Petal.Length)
        else if( input$property == "Petal.Width") quantile(iris$Petal.Width)
        else if( input$property == "Sepal.Length") quantile(iris$Sepal.Length)
        else if( input$property == "Sepal.Width") quantile(iris$Sepal.Width)
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