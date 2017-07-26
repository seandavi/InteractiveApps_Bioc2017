#' wrap a shiny app in a function
#' 
#' Wrapping a shiny app in a function allows one to 
#' use all the "function" niceties like documentation,
#' encapsulation of the "app" with any preprocessing,
#' and inclusion in packages. 
#' 
#' @examples 
#' wrappedShiny()
#' 
#' @export
wrappedShiny = function() {
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
}