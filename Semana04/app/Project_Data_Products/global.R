#Global


library(tidyverse)
library(shiny)
library(shinydashboard)
library(highcharter)
library(googleVis)

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