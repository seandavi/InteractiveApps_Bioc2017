library(shiny)

shinyApp(
    server = function(input,output,session) {
        x = reactive({
            # The curly brackets are to allow a "code block"
            # here. Not needed in this case, but a more
            # complex example would help
            rnorm(input$sample)
        })
        output$hist1 = renderPlot({
            hist(x())
        })
        output$sampleSummary = renderText(as.matrix(summary(x())))
    },
    
    ui = fluidPage(
        titlePanel("title panel"),
        
        sidebarLayout(
            sidebarPanel("sidebar panel",
                         sliderInput('sample',label = 'Random sample of size:',
                                     min = 2, max = 10000, value = 25),
                         textOutput('sampleSummary'))
            ,
            mainPanel("main panel",
                      plotOutput('hist1'))
        )
    )
)
