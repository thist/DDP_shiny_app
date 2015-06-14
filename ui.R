library(shiny)

# Define UI for plotting properties of iris species
shinyUI(fluidPage(
    # Application title
    titlePanel("Statistics for Different Iris Species"),
    
    # Sidebar with controls to select the variable to plot vs.
    # iris species and to specify whether outliers should be included
    sidebarLayout(
        sidebarPanel(
            selectInput("property", "Property:",
                        c("Sepal Length" = "Sepal.Length",
                          "Sepal Width" = "Sepal.Width",
                          "Petal Length" = "Petal.Length",
                          "Petal Width" = "Petal.Width")),
                        
            checkboxInput("outliers", "Show outliers", FALSE)
        ),
        
        # Show the caption and plot of the requested variable against
        # mpg
        mainPanel(
            h3(textOutput("caption")),
            p("This application visualizes the distribution of different properties of the famous (Fisher's or Anderson's) iris data set (included in the R datasets package). It gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica."),
            p("The user can chose between the 4 different properties (sepal width, sepal length, pedal width, pedal) in the side panel. This produces a box plot showing the distribution of the selected property with respect to the iris species. It is possible to show outliers by clicking the \"Show outliers\" option in the side bar."),
            plotOutput("irisPlot")
        )
    )
))