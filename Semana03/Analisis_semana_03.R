#Analisis semana 03

library(tidyverse)
library(plotly)


datos <- read_rds("Semana03/mascarilla_gt.rds")


plot_ly() %>% add_data(datos) %>% add_trace(x = ~fh_ingreso, y = ~fecha_nacimiento)

plot_ly() %>% add_data(datos) %>% add_histogram(y = ~fh_ingreso, x = ~numero_mascarillas) %>% add_text(x = "Prueba", y = "Nada")


f1 <- list(
  family = "Arial, sans-serif",
  size = 18,
  color = "darkblue"
)
f2 <- list(
  family = "Old Standard TT, serif",
  size = 14,
  color = "black"
)
a <- list(
  title = "No. Mask x Day",
  titlefont = f1,
  showticklabels = TRUE,
  tickangle = 45,
  tickfont = f2
  #exponentformat = "E"
)

b <- list(
  title = "Date",
  titlefont = f1,
  showticklabels = TRUE,
  tickangle = 45,
  tickfont = f2
  #exponentformat = "E"
)

c <- list(
  title = "Birthday",
  titlefont = f1,
  showticklabels = TRUE,
  tickangle = 45,
  tickfont = f2
  #exponentformat = "E"
)

plot_ly(datos, y = ~fh_ingreso, x = ~numero_mascarillas) %>% add_histogram() %>% layout(title = "Covid19 Face Masks GT",xaxis = a, yaxis = b)


plot_ly(datos, x = ~fh_ingreso, y = ~fecha_nacimiento) %>% add_trace() %>% layout(title = "Covid19 Face Masks GT",xaxis = b, yaxis = c)



