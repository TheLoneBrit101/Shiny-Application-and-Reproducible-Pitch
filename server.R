library(shiny)


in50 <- function(Salary){
    (Salary * .5) / 12
}
in20 <- function(Salary){
    (Salary * .2) / 12
}
in30 <- function(Salary){
    (Salary * .3) / 12
}


# Define server logic
shinyServer(function(input, output) {
    
    output$pie <- renderPlot({
        df <- data.frame(
            Type = c("Living", "Financial", "Flex"),
            value = c(in50(input$Salary), in20(input$Salary), in30(input$Salary)))
        gg <- ggplot(df, aes(x="", y=value, fill=Type)) +
            geom_bar(width = 1, stat = "identity") + coord_polar("y", start=0)
        plot(gg)
})
     output$out50 <- renderPrint({in50(input$Salary)})
     output$out20 <- renderPrint({in20(input$Salary)})
     output$out30 <- renderPrint({in30(input$Salary)})
     output$rent <- renderPrint({in30(input$Salary)})
})

