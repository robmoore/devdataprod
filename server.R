library(scales)

data(Titanic)
model <- glm(Survived ~ Class + Sex + Age, 
             data = as.data.frame(Titanic), 
             weights = Freq, family = binomial)

shinyServer(
  function(input, output) {
    output$Prediction <- renderText({
      prediction <- predict(model, 
                            newdata = data.frame(Class = input$Class, Sex = input$Sex, Age = input$Age), 
                            type = "response")
      c("As", 
        if (input$Age == 'Child') " a " else " an ",
        tolower(input$Age), 
        " ", 
        tolower(input$Sex), 
        " ", 
        tolower(input$Class), 
        " class passenger of the Titanic, the probability that you would survive was ",
        percent(prediction),
        ".")
    })
  }
)
