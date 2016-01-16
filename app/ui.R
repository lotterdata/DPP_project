shinyUI(fluidPage(
  titlePanel('NJ Cash 5 Prize Predictor'),
  sidebarLayout(
    
  sidebarPanel(
    checkboxGroupInput(
      "selections",
      label = 'Selections',
      choices = list(
        "1" = 1,"2" = 2,"3"=3,"4"=4,"5"=5,"6"=6,"7"=7,"8"=8,"9"=9,
        "10" = 10, "11" = 11,"12" = 12,"13"=13,"14"=14,"15"=15,"16"=16,"17"=17,"18"=18,"19"=19,
        "20" = 20, "21" = 21,"22" = 22,"23"=23,"24"=24,"25"=25,"26"=26,"27"=27,"28"=28,"29"=29,
        "30" = 30, "31" = 31,"32" = 32,"33"=33,"34"=34,"35"=35,"36"=36,"37"=37,"38"=38,"39"=39,
        "40" = 40, "41" = 41,"42" = 42,"43"=43
      ), # end choices
      inline = TRUE
    ), # end checkboxGroupInput
    
    actionButton("submit", "Predict Prize")
  ), # end sidebarPanel
  
  mainPanel(
    helpText(h2('Find recent results here:')),
    helpText(HTML("<a href='https://www.njlottery.com/en-us/drawgames/dailygames/jerseycash.html'>NJ Lottery Cash 5 Web Page</a>")),
    helpText(h2('Selected Numbers:')),
    h4(textOutput("selected.numbers")),
    helpText(h2('Predicted Prize:')),
    h4(textOutput("prediction"))
  ) # end mainPanel
  
  ) # end sidebarLayout
) # end fluidPage
) # end shinyUI