library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)

# Define the UI
ui <- fluidPage(
  titlePanel("Monthly Expenses Calculator"),
  sidebarLayout(
    sidebarPanel(
      selectInput("month", "Select Month:", choices = month.name),
      numericInput("rent", "Rent/Mortgage:", value = 0, min = 0),
      numericInput("utilities", "Utilities:", value = 0, min = 0),
      numericInput("groceries", "Groceries:", value = 0, min = 0),
      numericInput("transportation", "Transportation:", value = 0, min = 0),
      numericInput("entertainment", "Entertainment:", value = 0, min = 0),
      actionButton("add_expenses", "Add Expenses")
    ),
    mainPanel(
      h4("Monthly Expenses:"),
      tableOutput("expenses_table"),
      plotOutput("expenses_plot")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  # Create a reactive value to store the expenses data
  expenses <- reactiveValues(data = data.frame(Month = character(),
                                               Rent = numeric(),
                                               Utilities = numeric(),
                                               Groceries = numeric(),
                                               Transportation = numeric(),
                                               Entertainment = numeric()))
  
  # Add expenses for the selected month
  observeEvent(input$add_expenses, {
    new_row <- data.frame(Month = input$month,
                          Rent = input$rent,
                          Utilities = input$utilities,
                          Groceries = input$groceries,
                          Transportation = input$transportation,
                          Entertainment = input$entertainment)
    
    expenses$data <- rbind(expenses$data, new_row)
  })
  
  # Output the expenses table
  output$expenses_table <- renderTable({
    expenses$data
  })
  
  # Plot the monthly expenses breakdown
  output$expenses_plot <- renderPlot({
    expenses_plot_data <- expenses$data %>%
      gather(key = "Expense_Category", value = "Amount", -Month) %>%
      arrange(Month)
    
    ggplot(expenses_plot_data, aes(x = Month, y = Amount, fill = Expense_Category)) +
      geom_col(position = "stack") +
      xlab("Month") +
      ylab("Expense Amount") +
      ggtitle("Monthly Expenses Breakdown") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
}

# Run the app
shinyApp(ui = ui, server = server)

