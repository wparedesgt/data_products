#Global


library(tidyverse)
library(shiny)
library(shinydashboard)
library(highcharter)

#Carga datos Covid19

CargaDatosWeb01 <- function() {
  
  data <- read.csv("https://covid.ourworldindata.org/data/owid-covid-data.csv", na.strings = "", fileEncoding = "UTF-8-BOM" )
  
  return(data)
}


datos <- CargaDatosWeb01()

datos$total_tests <- NULL
datosgt$new_tests <- NULL
datosgt$total_tests_per_thousand <- NULL
datosgt$new_tests_per_thousand <- NULL
datosgt$new_tests_smoothed <- NULL
datosgt$new_tests_smoothed_per_thousand <- NULL
datosgt$tests_units <- NULL
datosgt$male_smokers <- NULL
datosgt$female_smokers <- NULL

datos_ca$total_tests <- NULL
datos_ca$new_tests <- NULL
datos_ca$total_tests_per_thousand <- NULL
datos_ca$new_tests_per_thousand <- NULL
datos_ca$new_tests_smoothed <- NULL
datos_ca$new_tests_smoothed_per_thousand <- NULL
datos_ca$tests_units <- NULL
datos_ca$male_smokers <- NULL
datos_ca$female_smokers <- NULL

datosgt <- datos %>% filter(iso_code == "GTM")
datos_ca <- datos %>% filter(iso_code %in% c("GTM","SLV","HND","NIC","CRI"))