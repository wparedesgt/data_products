#Covid Gt and CA analisis

library(tidyverse)
library(forecast)
library(highcharter)
library(ggfortify)

#Carga datos Covid19

CargaDatosWeb01 <- function() {
  
  data <- read.csv("https://covid.ourworldindata.org/data/owid-covid-data.csv", na.strings = "", fileEncoding = "UTF-8-BOM" )
  
  return(data)
}


datos <- CargaDatosWeb01()

datos$total_tests <- NULL
datos$new_tests <- NULL
datos$total_tests_per_thousand <- NULL
datos$new_tests_per_thousand <- NULL
datos$new_tests_smoothed <- NULL
datos$new_tests_smoothed_per_thousand <- NULL
datos$tests_units <- NULL
datos$male_smokers <- NULL
datos$female_smokers <- NULL


datosgt <- datos %>% filter(iso_code == "GTM")
datos_ca <- datos %>% filter(iso_code %in% c("GTM","SLV","HND","NIC","CRI"))


#output$HC_fore_01 <- renderHighchart({
  
#  withProgress(message = "Espere por favor", value = 0, {
    
#    incProgress(1/3, detail = "Paso 1 de 2")
#    Sys.sleep(0.5)
    
    t_arima_datosgt <- auto.arima(datosgt$total_cases)
    datosgt_forecast <- forecast(t_arima_datosgt, level = c(95,80))
    df_datosgt <- fortify(datosgt_forecast)
    
#    incProgress(1/3, detail = "Predictivo Total")
#    Sys.sleep(0.5)

    
    inicio <- head(datosgt$date, 1)
    
    
    fecha_pred <- seq(as.Date(inicio), (Sys.Date() + 10), by = "day")
    
    
    
    
    
    df_datosgt$date <- fecha_pred
    
#    incProgress(1/3, detail = "A paso 2")
#    Sys.sleep(0.5) })
  
  
  
  
  highchart(type = "stock") %>% 
    hc_add_series(df_datosgt, "line", hcaes(date, Data), name = "Original") %>% 
    hc_add_series(df_datosgt, "line", hcaes(date, Fitted), name = "Ajustado") %>%
    hc_add_series(df_datosgt, "line", hcaes(date, `Point Forecast`), name = "Prediccion") %>% 
    hc_add_series(df_datosgt, "arearange", hcaes(date, low = `Lo 80`, high = `Hi 80`), name = "Intervalo") 
  
  
#  %>% hc_title(text = "Ministerio de Gobernación") %>% hc_subtitle(text = "Pronostico: Promedio móvil integrado regresivo automático (ARIMA)") %>% hc_yAxis(title = list(text = "Contagios Confirmados Totales")) %>% hc_xAxis(title = list(text = "Fecha"))  %>% hc_credits(enabled = TRUE, text = "Origen: ourworldindata", href = "https://covid.ourworldindata.org",style = list(fontSize = "12px"))
  
#})




