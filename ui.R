## Calculate how much of salary should go on rent

library(shiny)
library(ggplot2)

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Bugeting"),
  
  # Sidebar with numeric input 
    sidebarPanel(
        numericInput('Salary','Insert your annual salary (gross)', 0,min = 0, max = 300000, step = 500)),
    
    mainPanel(
        p("The 50-20-30 Rule helps you build a budget by using three spending categories:"),
        tags$ul(
            tags$li("50% of your income should go to living expenses and essentials. This includes your rent, utilities, and things like groceries and transportation for work."),
            tags$li("20% of your income should go to financial goals, meaning your savings, investments, and debt-reduction payments (if you have debt, such as credit card payments)"),
            tags$li("30% of your income should be used for flexible spending. This is everything you buy that you want but don't necessarily need (like money spent on movies and travel).")),
        p('In addition, many experts say it is best to spend no more than 30% of your monthly gross income on housing-related expenses, including rent and utilities.'),
    
    
    h4('Based on your annual salary, you should be spending no more than the following monthly:'),
    
    # Pie chart
    plotOutput("pie"),
    
    p("Living expenses:"), verbatimTextOutput("out50"), tags$br(),

    p("Including 30% that should go on rent & utilities:"), verbatimTextOutput("rent"), tags$br(),
    
    p("Savings:"), verbatimTextOutput("out20"), tags$br(),
    
    p("Flex. spending:"), verbatimTextOutput("out30")
  ))
)
