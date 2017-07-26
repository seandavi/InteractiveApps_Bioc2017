library(shiny)

shinyApp(
    ###########################
    # The "server" function
    #   - Business goes here
    ###########################
    server = function(input,output,session) {
        
        # Do important work in here
        #   - read inputs
        #   - set up outputs
        
    },
    
    
    #########################################
    # and the "user interface"
    #   - Just displays user interface and
    #     provides interactivity features 
    #     and layout
    #########################################
    ui = fluidPage(
        titlePanel("title panel"),
        
        sidebarLayout(
            sidebarPanel("sidebar panel"),
            mainPanel("main panel")
        )
    )
)
