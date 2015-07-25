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
    tags$h4("In April 1912, arguably one of the most infamous maritime disasters in history occurred with the sinking of the RMS Titanic."),
    tags$h4("Using a data set of produced by the British Board of Trade in their investigation of the tragedy, we employ logistic regression to calculate the likelihood that a passenger with a specific combination of characteristics would have survived the sinking of the Titanic."),
    tags$h4(textOutput("Prediction"))
  )
)
)