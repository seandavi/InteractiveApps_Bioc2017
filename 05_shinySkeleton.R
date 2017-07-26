library(shiny)

shinyApp(
    server = function(input,output,session) {
        # Do important work in here
    },
    
    ui = fluidPage(
        titlePanel("title panel"),
        
        sidebarLayout(
            sidebarPanel("sidebar panel"),
            mainPanel("main panel")
        )
    )
)
