library(shiny);
shinyServer(
  function(input, output) {
    v_dist <- reactive({
       switch(input$dist,
          "Uniform" = temp_dist <- runif(input$observations),
          "Exponential" = temp_dist <- rexp(input$observations),
          "Poisson" = temp_dist <- rpois(input$observations,input$lambdaPois),
          "Normal" = temp_dist <- rnorm(input$observations)
    )
    })
    output$newDist <- renderPlot({
      switch(input$dist,
             "Uniform" = plot(v_dist(), main="Plot for uniform distribution"),
             "Exponential" = plot(v_dist(), main="Plot for exponential distribution"),
             "Poisson" = plot(v_dist(), main="Plot for Poisson distribution"),
             "Normal" = plot(v_dist(), main="Plot for normal distribution")
      )
    })  
    output$newHist <- renderPlot({
      switch(input$dist,
             "Uniform" = hist(v_dist(), freq=FALSE, main="Histogram for uniform distribution", xlab="value", ylab="Density"),
             "Exponential" = hist(v_dist(), freq=FALSE, main="Histogram for exponential distribution", xlab="value", ylab="Density"),
             "Poisson" = hist(v_dist(), freq=FALSE, main="Histogram for Poisson distribution", xlab="value", ylab="Density"),
             "Normal" = hist(v_dist(), freq=FALSE, main="Histogram for normal distribution", xlab="value", ylab="Density")
      )
    })
    v_samp <- reactive ({
      v_s <- vector()
      for (i in 1:input$samples){
        v_s[i] <- mean(sample(v_dist(),size=input$sampleSize, replace=FALSE))
      }
      v_tmp <- v_s
    })
    
    output$newStdSampHist <- renderPlot({
      sampmean_mean <- mean(v_samp())
      sampmean_sd <- sd(v_samp())
      v_std <- (v_samp()- sampmean_mean)/sampmean_sd
      hist(v_std, freq=FALSE, breaks=20, main="Standard sample mean histogram", xlab="Value", ylab="Density")
      curve(dnorm(x), add=TRUE, col="darkblue", lwd=2)
    })
    output$newSampHist <- renderPlot({
      pop_mean <- mean(v_dist())
      pop_sd <- sd(v_dist())
      sampmean_mean <- mean(v_samp())
      hist(v_samp(), freq=FALSE, breaks=20, main="Sample mean histogram", xlab="Value", ylab="Density")
      x <- seq(from=min(v_samp()), to=max(v_samp()), by=(max(v_samp())-min(v_samp()))/100)
      lines(x,dnorm(x, mean=pop_mean, sd=pop_sd/sqrt(input$sampleSize)), col="blue", lwd=2)
      abline(v=pop_mean, col="red")
      abline(v=sampmean_mean, col="green")
      legend("topright", c("Mean of population", "Mean of sample mean"), col=c("red", "green"), lwd=2)
    })
    output$pop_mean <- renderPrint({mean(v_dist())})
    output$sampmean_mean <- renderPrint({mean(v_samp())})
  }
);

