library(shiny)

shinyApp(
    server = function(input,output,session) {
        output$hist1 = renderPlot({
            hist(rnorm(input$sample))
        })
    },
    
    ui = fluidPage(
        titlePanel("title panel"),
        
        sidebarLayout(
            sidebarPanel("sidebar panel",
                         sliderInput('sample',label = 'Random sample of size:',
                                     min = 2, max = 10000, value = 25))
            ,
            mainPanel("main panel",
                      plotOutput('hist1'))
        )
    )
)
