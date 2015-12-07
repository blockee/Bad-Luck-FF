shinyUI(fluidPage(
    titlePanel('How many games SHOULD you have won?'),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Find out your expected win total in Fantasy Football this year.
                     Were you besieged by bad luck or graced by good fortune?"),
            
            numericInput('leagueSize',
                    label = 'How Many teams are in your league?',
                    value = 0, min = 8, max = 16, step = 1),
            
            numericInput('actualWins',
                    label = 'How many games did you manage to win this year?',
                    value = 0, min = 0, max = 32, step = 1),
            
            numericInput('playoffWins',
                         label = 'How many total wins would you need to make the playoffs?',
                         value = 0, min = 0, max = 32, step = 1),
            
            helpText("Look back at all the weeks of your league and jot down your scoring rank for each individual week.
                     In the boxes below, enter the number of times you achieved each rank. For ranks higher than the 
                     number of teams in your league, leave the value at 0."),
            
            numericInput('rank1',
                    label = 'Rank 1',
                    value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank2',
                         label = '2nd',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank3',
                         label = '3rd',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank4',
                         label = '4th',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank5',
                         label = '5th',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank6',
                         label = '6th',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank7',
                         label = '7th',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('8th',
                         label = '8th',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank9',
                         label = '9th',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank10',
                         label = '10th',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank11',
                         label = '11th',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank12',
                         label = '12th',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank13',
                         label = '13th',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank14',
                         label = '14th',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank15',
                         label = '15th',
                         value = 0, min = 0, max = 32, step = 1),
            
            numericInput('rank16',
                         label = '16th',
                         value = 0, min = 0, max = 32, step = 1),
            
            submitButton('Submit')
            
            ),
    
        
        mainPanel(
            tabsetPanel(
                tabPanel("Main", textOutput('teamtext'),
                    plotOutput('winHist'),
                    textOutput('min'),
                    textOutput('max'),
                    textOutput('playoffs'),
                    textOutput('winTotal')
                ),
                tabPanel("About Standard Score", textOutput('summary'))
            )
        )
    )
))