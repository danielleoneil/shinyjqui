library(shiny)
library(shinyjqui)

server <- function(input, output) {

  output$lst_order <- renderPrint({
    cat('List1: ')
    cat(input$lst1_order)
    cat('\n')

    cat('List2: ')
    cat(input$lst2_order)
    cat('\n')

    cat('List3: ')
    cat(input$lst3_order)
    cat('\n')

    cat('List4: ')
    cat(input$lst4_order)
    cat('\n')
  })

}

ui <- fluidPage(
  # includeJqueryUI(),

  orderInput('lst1', 'List1', items = month.abb, item_class = 'info', legacy = TRUE),
  orderInput('lst2', 'List2 (can be moved to List1 and List4)', items = month.abb,
             connect = c('lst1', 'lst4'), item_class = 'primary', legacy = TRUE),
  orderInput('lst3', 'List3 (can be copied to List2 and List4)', items = month.abb,
             as_source = TRUE, connect = c('lst2', 'lst4'), item_class = 'success', legacy = TRUE),
  orderInput('lst4', 'List4 (can be moved to List2)', items = NULL, connect = 'lst2',
             placeholder = 'Drag items here...', legacy = TRUE),

  verbatimTextOutput('lst_order')

)

shinyApp(ui, server)
