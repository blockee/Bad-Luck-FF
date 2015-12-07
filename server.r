library(ggplot2)
source('winSimulation.r')
winsFrame <- data.frame()

shinyServer(function(input, output){
    
#     observeEvent(input$Submit,{
#         rankVector <- c(input$rank1, input$rank2, input$rank3, input$rank4, input$rank5,
#                         input$rank6, input$rank7, input$rank8, input$rank9,
#                         input$rank10, input$rank11, input$rank12, 
#                         input$rank13, input$rank14, input$rank15, input$rank16)
#         
#         winsFrame <- simulateWins(input$leagueSize, rankVector) 
#     })
    
    output$teamtext <- renderText({
        rankVector <- c(input$rank1, input$rank2, input$rank3, input$rank4, input$rank5,
                        input$rank6, input$rank7, input$rank8, input$rank9,
                        input$rank10, input$rank11, input$rank12, 
                        input$rank13, input$rank14, input$rank15, input$rank16)
        
        winsFrame <- simulateWins(input$leagueSize, rankVector)
        minValue <- min(winsFrame$wins)
        maxValue <- max(winsFrame$wins)
        summary(winsFrame)
    })
    
    
    
    output$winHist <- renderPlot({
        rankVector <- c(input$rank1, input$rank2, input$rank3, input$rank4, input$rank5,
                        input$rank6, input$rank7, input$rank8, input$rank9,
                        input$rank10, input$rank11, input$rank12, 
                        input$rank13, input$rank14, input$rank15, input$rank16)
        
        winsFrame <- simulateWins(input$leagueSize, rankVector)
        
        p1 <- ggplot(winsFrame, aes(x = wins)) + geom_histogram(color = 'darkgreen', fill = 'white', binwidth = 1, origin = min(winsFrame$wins))
        p1 <- p1 + geom_vline(color= "blue", xintercept = input$actualWins)
        print(p1) 
    })
    
    output$min <- renderText({
        rankVector <- c(input$rank1, input$rank2, input$rank3, input$rank4, input$rank5,
                        input$rank6, input$rank7, input$rank8, input$rank9,
                        input$rank10, input$rank11, input$rank12, 
                        input$rank13, input$rank14, input$rank15, input$rank16)
        
        winsFrame <- simulateWins(input$leagueSize, rankVector)
        
        paste('- Your lowest win total in the simulations: ', min(winsFrame$wins), 
              "This win total happened in ", sum(winsFrame$wins == min(winsFrame$wins)), " of the 10,000 simulations")
    })
    
    output$max <- renderText({
        rankVector <- c(input$rank1, input$rank2, input$rank3, input$rank4, input$rank5,
                        input$rank6, input$rank7, input$rank8, input$rank9,
                        input$rank10, input$rank11, input$rank12, 
                        input$rank13, input$rank14, input$rank15, input$rank16)
        
        winsFrame <- simulateWins(input$leagueSize, rankVector)
        
        paste('- Your highest win total in the simulations: ', max(winsFrame$wins), 
              "This win total happened in ", sum(winsFrame$wins == max(winsFrame$wins)), " of the 10,000 simulations")
    })
    
    output$playoffs <- renderText({
        rankVector <- c(input$rank1, input$rank2, input$rank3, input$rank4, input$rank5,
                        input$rank6, input$rank7, input$rank8, input$rank9,
                        input$rank10, input$rank11, input$rank12, 
                        input$rank13, input$rank14, input$rank15, input$rank16)
        
        winsFrame <- simulateWins(input$leagueSize, rankVector)
        
        paste('- You needed ', input$playoffWins, 
              "to reach the playoff. You met or exceeded that number in ", 
              round(sum(winsFrame$wins >= input$playoffWins)/10000, 4)*100, "% of the 10,000 simulations")
    })
 
    output$winTotal <- renderText({
        rankVector <- c(input$rank1, input$rank2, input$rank3, input$rank4, input$rank5,
                        input$rank6, input$rank7, input$rank8, input$rank9,
                        input$rank10, input$rank11, input$rank12, 
                        input$rank13, input$rank14, input$rank15, input$rank16)
        
        winsFrame <- simulateWins(input$leagueSize, rankVector)
        
        paste('- You won', input$actualWins, 
              "times. That win total is equal to or greater than the win total in ", 
              round(sum(winsFrame$wins <= input$actualWins)/10000, 4)*100, "% of the 10,000 simulations")
    })
    output$summary <- renderText({
        'Some stuff about standard score'
    })
    
}
)