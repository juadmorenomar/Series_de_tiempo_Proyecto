library(shiny)
library(forecast)
library(datasets)
library(graphics)
function(input, output) {
  data_l<-reactive({
    inFile <- input$archivo
    if (is.null(inFile))
      return(NULL)
    data<-ts(scan(inFile$datapath,skip=input$skipper),start=c(input$year,input$month),
             frequency = input$frequency)
    return(data)
  })

  output$contents1 <- renderPlot({
    datosts <-data_l()
    #M2=auto.arima(datosts)
    #M2F=forecast(M2,h=12)   # cantidad a pronosticar
    plot(datosts,main="Serie")

}

  )

  output$contents2 <- renderPlot({
    datas<-data_l()
    dec<-decompose(datas)
    plot(dec)
    #Tt=decompose(datas)$trend
    #plot(Tt,ylim=c(min(datas),max(datas)))

}


)

  output$contents3 <- renderPlot({
    datas<-data_l()
    boxplot(datas~cycle(datas),main="Boxplot para estacionalidad")


  }

  )

  output$contents4 <- renderPlot({
    data<-data_l()
    acfd<-acf(data)
    plot(acfd, main="ACF")

  }

  )

  output$contents5 <- renderPlot({
    data<-data_l()
    pacfd<-pacf(data)
    plot(pacfd, main="PACF")

  }

  )

  output$contents6 <- renderPlot({
    data<-data_l()
    histg<-hist(data)
    plot(histg, main="data")
    
  }
  
  )
  
  

}
