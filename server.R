library(shiny)
shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    meanX <- input$MeanValue
    stdY <- input$StdDev
    lowerD <- input$lowerend
    UpperD <- input$upperend
    xlab <- ifelse(input$show_xlab, "X Axis", "")
    ylab <- ifelse(input$show_ylab, "Y Axis", "")
    main <- ifelse(input$show_title, "Title", "")
    xseq<-seq(meanX - 3.5*stdY,meanX + 3.5*stdY,.01)
    densities<-dnorm(xseq, meanX, stdY)
    from.z <- lowerD
    to.z <- UpperD
    out <- pnorm(to.z, mean = meanX, sd = stdY, lower.tail = TRUE) - pnorm(from.z, mean = meanX, sd = stdY, lower.tail = TRUE)
    out <- round(out, 3)
    plot(xseq, densities, col="darkgreen",xlab="", ylab="Density", type="l",lwd=2, cex=2, main="PDF of Standard Normal", sub =out, cex.axis=.8)
   S.x  <- c(from.z, seq(from.z , to.z, .01), to.z)
   lowinc <- (from.z - meanX + 3.5*stdY)/.01
   upinc <- (to.z - meanX + 3.5*stdY)/0.01
   S.y  <- c(0, densities[lowinc:upinc],0)
   polygon(S.x,S.y, col="red")
  })

})
