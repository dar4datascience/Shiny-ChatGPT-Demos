library(shiny)
library(shinydashboard) # <-- Change this line to: library(semantic.dashboard)
library(chatgpt)

ui <- dashboardPage(
    dashboardHeader(title = "Basic dashboard"),
    dashboardSidebar(sidebarMenu(
        menuItem(
            tabName = "home",
            text = "Home",
            icon = icon("home")
        )
        # ,
        # menuItem(tabName = "another", text = "Another Tab", icon = icon("heart"))
    )),
    dashboardBody(fluidRow(
        box(
            title = "Controls",
            shiny::textInput("prompt", "Prompt ChatGPT!", "Enter text..."),
            # Action button that will trigger the print
            actionButton("printBtn", "Click me to ask chat gpt!")
        )),
        fluidRow(
        box(textOutput("textOut"))

    ))
)

server <- function(input, output) {
    value <- reactiveVal(0)       # rv <- reactiveValues(value = 0)

    observeEvent(input$printBtn, {
        newValue <- value() - 1     # newValue <- rv$value - 1
        value(newValue)             # rv$value <- newValue
    })

    response <- reactiveVal()

    observeEvent(input$printBtn,{
       res <- ask_chatgpt(input$prompt)
       cat(res)
       response(res)
    })

    output$textOut <- renderText({
        #take dependency on button
        #input$printBtn

        response()

        })
    #%>% debounce(1000)
}

shinyApp(ui, server)
