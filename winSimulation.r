simulateWins <- function(leagueSize, rankVector){
    results <- list()
    opponents <- leagueSize-1
    for(i in 1:10000) {
        wins <- 0
            for(n in 1:leagueSize){
                winProb <- (leagueSize - n)/opponents
                wins <- wins + sum(sample(c(1,0), rankVector[n], replace = TRUE, prob = c(winProb, 1-winProb)))
            }
        results[[i]] <- wins       
    }
    resultFrame <- data.frame(unlist(results))
    names(resultFrame) <- c('wins')
    return(resultFrame)
}
