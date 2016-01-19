# See global.R for code that builds the predictive model

shinyServer(function(input,output){
  
  selected.numbers <- eventReactive(input$submit,{as.integer(input$selections)})
  
  output$selected.numbers <- renderText({
                             validate(need(length(selected.numbers())==5,
                                      'You must choose exactly 5 numbers.'))
                             paste(selected.numbers()[1],
                                   selected.numbers()[2],
                                   selected.numbers()[3],
                                   selected.numbers()[4],
                                   selected.numbers()[5],
                                   sep = ', ')
                             }) # end output$selected.numbers 
  
  predict.df <- reactive({temp <-
                           data.frame(
                           n1=selected.numbers()[1],
                           n2=selected.numbers()[2],
                           n3=selected.numbers()[3],
                           n4=selected.numbers()[4],
                           n5=selected.numbers()[5])
                           for(i in 1:43){
                             ft = paste('f', as.character(i), sep = '')
                             temp[[ft]] = apply(temp[,1:5],1,
                                                function(x) SetFlag(x,i))
                           }
                           return(temp)
                           }) # end predict.df

  output$prediction = renderText({
                                  validate(need(length(selected.numbers())==5,'NA'))
                                  paste('$',
                                        round(predict(modelfit,newdata = predict.df()),0),
                                        '.00',
                                        sep = '')})

}) # end shinyServer