#Analisis

library(tidyverse)
library(leaflet)
library(Hmisc)

datos <-  read_csv("Semana02/data/mascarilla.csv")

datos <- datos %>% select(numero_mascarillas, fecha_nacimiento, id_sexo, id_estado_civil, id_departamento, 
                          id_municipio, nacionalidad, latitud, longitud, fh_ingreso)


lattemp <- "14.634799"
longtemp <- "-90.514506"

datos$latitud <- impute(datos$latitud, lattemp)
datos$longitud <- impute(datos$longitud, longtemp)

datos_tl <- datos

summary(datos_tl)

datos_tl <- datos_tl[order(as.Date(datos_tl$fh_ingreso, format = "%Y/%m/%d")),]

saveRDS(datos_tl, file = "mascarilla_gt.rds")


#Mapa leaflet

resumen_mapa <- datos_tl %>% group_by(longitud, latitud) %>% summarise(total = sum(numero_mascarillas))


resumen_mapa$longitud <- as.numeric(resumen_mapa$longitud)
resumen_mapa$latitud <- as.numeric(resumen_mapa$latitud)



resumen_mapa %>% 
  leaflet() %>%
  addTiles() %>%
  setView(lng = -90.2500000, lat = 15.5000000, zoom = 7) %>% 
  addCircles(lng = ~longitud, lat = ~latitud, weight = 1, radius = ~total * 2)
