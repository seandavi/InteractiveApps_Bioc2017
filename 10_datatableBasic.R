#' Datatable example
#' 
#' @param df a data.frame
#' 
#' @import DT
#' @import shiny
#' 
#' @examples 
#' shinydt(mtcars)
#' 
#' @export
shinydt = function(df) {
    stopifnot(inherits(df,'data.frame')) 
    
    shinyApp(
        ui = fluidPage(
            fluidRow(
                dataTableOutput('dx')
            ),
            fluidRow(
                column(6,verbatimTextOutput('rows')),
                column(6,plotOutput('scatter'))
            )
        ),
        
        server = function(input, output, session) {
            output$dx = renderDataTable(df)
            output$scatter = renderPlot(plot(mtcars[,'hp'],mtcars[,'mpg']))
            output$rows = renderPrint({
                cat('Rows on the current page:\n\n')
                cat(input$dx_rows_current, sep = ', ')
                cat('\n\nAll rows:\n\n')
                cat(input$dx_rows_all, sep = ', ')
                cat('\n\nSelected rows:\n\n')
                cat(input$dx_rows_selected, sep = ', ')
            })
            
            output$scatter = renderPlot({
                s1 = input$dx_rows_current  # rows on the current page
                s2 = input$dx_rows_all      # rows on all pages (after being filtered)
                
                par(mar = c(4, 4, 1, .1))
                c1 = 'hp'
                c2 = 'mpg'
                plot(mtcars[,c1],mtcars[,c2])

                
                # solid dots (pch = 19) for current page
                if (length(s1)) {
                    points(mtcars[s1, c1], mtcars[s1, c2], 
                           pch = 19, cex = 2)
                }
                
                # show red circles when performing searching
                if (length(s2) > 0 && length(s2) < nrow(mtcars)) {
                    points(mtcars[s2, c1], mtcars[s2, c2],
                           pch = 21, cex = 3, col = 'red')
                }
                
                # dynamically change the legend text
                s = input$x1_search
                txt = if (is.null(s) || s == '') 'Filtered data' else {
                    sprintf('Data matching "%s"', s)
                }
                
                legend(
                    'topright', c('Original data', 'Data on current page', txt),
                    pch = c(21, 19, 21), pt.cex = c(1, 2, 3), col = c(1, 1, 2),
                    y.intersp = 2, bty = 'n'
                )
                
            })
            
        }
    )
}