library(shiny)

shinyApp(
    server = function(input,output,session) {
        # In the server, we "render" the plot
        output$hist1 = renderPlot({
            hist(rnorm(100))
        })
    },
    
    ui = fluidPage(
        titlePanel("title panel"),
        
        sidebarLayout(
            sidebarPanel("sidebar panel"),
            mainPanel("main panel",
                      # and "output" the plot in the UI
                      plotOutput('hist1'))
        )
    )
)
