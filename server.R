library(scales)

data(Titanic)
titanicDF <- as.data.frame(Titanic)
model <- glm(Survived ~ Class + Sex + Age, 
             data = titanicDF,
             weights = Freq, 
             family = binomial)

shinyServer(
  function(input, output) {
    output$Prediction <- renderText({
      prediction <- percent(predict(model, 
                                    newdata = data.frame(Class = input$Class, 
                                                         Sex = input$Sex, 
                                                         Age = input$Age), 
                                    type = 'response'))
      survived <- titanicDF[titanicDF$Class == input$Class & 
                              titanicDF$Sex == input$Sex & 
                              titanicDF$Age == input$Age & 
                              titanicDF$Survived == 'Yes', 
                            'Freq']
      perished <- titanicDF[titanicDF$Class == input$Class & 
                              titanicDF$Sex == input$Sex & 
                              titanicDF$Age == input$Age & 
                              titanicDF$Survived == 'No', 
                            'Freq']
      reality <- ifelse(survived + perished != 0, 
                      paste('the percentage of survivors with these characteristics was', percent(survived / (survived + perished))), 
                      'no passengers with this combination of characteristics is found in the data')
      c('As', 
        ifelse(input$Age == 'Child', 'a', 'an'),
        tolower(input$Age),
        tolower(input$Sex),
        tolower(input$Class), 
        paste0('class passenger of the Titanic, our model suggests that the probability that you would survive was ', prediction, '.'),
        paste0('In actual fact, ', reality, '.'))
    })
  }
)
