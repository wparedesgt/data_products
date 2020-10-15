
shinyServer(function(input, output) {

    #Icons
    
    output$infoDias <- renderInfoBox({
        infoBox(
            "Days Covid19", Sys.Date() - as.Date('2020-03-14'),
            icon = icon("calendar", lib = "font-awesome"), 
            color = "blue"
        )
    })
    
    output$infoCuarentena <- renderInfoBox({
        
        total_cuarentena <- tail(datosgt$total_cases_per_million,1)
        
        infoBox(
            "Contagions X M",  prettyNum(total_cuarentena,big.mark=",",scientific=FALSE), 
            icon = icon("id-card", lib = "font-awesome"), 
            color = "purple"
        )
    })
    
    output$infoContagios <- renderInfoBox({
        
        total <- tail(datosgt$total_cases,1)
        
        infoBox(
            "Sum. Covid19", prettyNum(total,big.mark=",",scientific=FALSE), 
            icon = icon("hospital", lib = "font-awesome"), 
            color = "maroon"
        )
        
    })
    
    output$infoActivos <- renderInfoBox({
        
        total_muertos <- tail(datosgt$total_deaths, 1)
        
        infoBox(
            "Deaths", prettyNum(total_muertos,big.mark=",",scientific=FALSE),
            icon = icon("cross", lib = "font-awesome"), 
            color = "black"
        )
    })
    
    #Gauge
    
    output$gauge02 <- renderGvis({
        
        
        infoDES <- tail(datosgt$new_cases,1)
        
        df <- data.frame(Label = "Today", Value = infoDES)
        
        gvisGauge(df, 
                  options = list(min = 0, max = 1000, 
                                 greenFrom = 0, greenTo = 100, 
                                 yellowFrom = 101, yellowTo = 500,
                                 redFrom = 501, redTo = 1000))
    })

})
