library(shiny)

shinyUI(pageWithSidebar(
  headerPanel(
    "Titanic Odds" 
  ),
  sidebarPanel(
    tags$em("Select the characteristics of the passenger to learn their fate."),
    selectInput("Sex", "Gender", choices = c("Male", "Female")),
    selectInput("Class", "Class", choices = c("1st", "2nd", "3rd", "Crew")),
    selectInput("Age", "Age", choices = c("Adult", "Child"))
  ),
  mainPanel(
    tags$img(src="http://i122.photobucket.com/albums/o250/blackroutes/Scans/PeopleTakeWarningTitanic.jpg",
             width = "50%"),
    tags$h4(textOutput("Prediction"))
  )
)
)