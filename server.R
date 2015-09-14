# Here is the server part of Shiny 
library('shiny')
library('dygraphs')
library('xts')
library('digest')

m_PARAM <- 0



function(input, output) {
  


  output$plot1 <- renderDygraph({

    m_PARAM$d1 <- input$dates[1]
    m_PARAM$d2 <- input$dates[2]

    ## To do that, two things : 
    
    ## The dates we use usually are in the ISOdatetime format
    ## In Shiny, input$date is "yyyy-mm-dd". We gotta adapt it first
    date1<-as.character(m_PARAM$d1)
    strdate1 <- strsplit(date1,"-")
    tsBegin <- ISOdatetime(strdate1[[1]][1],strdate1[[1]][2],strdate1[[1]][3],00,00,00)
    date2<-as.character(m_PARAM$d2)
    strdate2 <- strsplit(date2,"-")
    tsEnd <- ISOdatetime(strdate2[[1]][1],strdate2[[1]][2],strdate2[[1]][3],00,00,00)
    tsPlot <- seq(from = tsBegin, to = tsEnd, by =60*15)
    
    data <- 100*runif(length(tsPlot))
    
    dataPlot <- data.frame(tsPlot,data)
    
    # We add some more data
    data2 <- 100*runif(length(tsPlot))
    
    dataPlot <- data.frame(dataPlot,data2)

      
      dataPlot <- xts(dataPlot,order.by=as.POSIXct(dataPlot$tsPlot))
      dygraph(dataPlot)
      

    
  })
  

  
  
  
  
}

