#Examen Español

#Pregunta No. 1

#¿Cuáles de las siguientes opciones son absolutamente necesarias para crear una aplicación shiny que funcione? (Marque todo lo que corresponda)

#A server.R file containing a call to shinyServer() ##  RESPUESTA
#A ui.R file that contains information about the CSS and styling of the App
#A ui.R file containing a call to shinyUI() ## RESPUESTA
#A shiny.R file containing calls to shinyServer() and shinyUI()
#A server.R file that sets configuration options for hosting the App


#Pregunta 2

#¿Qué hay de incorrecto en la siguiente sintaxis en ui.R?

library(shiny)
shinyUI(pageWithSidebar(  
  headerPanel("Data science FTW!"),  
  sidebarPanel(    
    h2('Big text')    
    h3('Sidebar')  
  ),  
  mainPanel(      
    h3('Main Panel text')  
  )
))


#The h2 command does not take text arguments
#Missing comma after the h3 command  
#The h3 command should be an h2 command
#Missing a comma in the sidebar panel  ##  RESPUESTA 



#Pregunta 3
#Considere el siguiente codigo en ui.R


shinyUI(pageWithSidebar(  
  headerPanel("Example plot"),  
  sidebarPanel(    
    sliderInput('mu', 'Guess at the mu',value = 70, min = 60, max = 80, step = 0.05,)  ), 
  mainPanel(    
    plotOutput('newHist')  
  )
))


#Y el siguiente en el server.R

library(UsingR)
data(galton)

shinyServer(  
  function(input, output) {    
    output$myHist <- renderPlot({      
      hist(galton$child, xlab='child height', col='lightblue',main='Histogram')      
      mu <- input$mu      
      lines(c(mu, mu), c(0, 200),col="red",lwd=5)      
      mse <- mean((galton$child - mu)^2)      
      text(63, 150, paste("mu = ", mu))      
      text(63, 140, paste("MSE = ", round(mse, 2)))      
    })      }
)


#¿Por qué no está haciendo lo que queremos? (Marque todo lo que corresponda.)


#Los límites del control deslizante están configurados incorrectamente y dan un error.

#El nombre de salida server.R no es el mismo que el comando plotOutput usado en ui.R. #RESPUESTA

#Debería ser

mu <- input$mean

###in server.R

#La frase "Adivina el valor mu" debe decir "mean" en lugar de "mu"


#4. ¿Cuáles son las principales diferencias entre crear un gadget Shiny y crear una aplicación Shiny normal? (Marque todo lo que corresponda)


#Shiny Gadgets son programas más pequeños y, por lo tanto, se ejecutan más rápido que Shiny Apps.##NO

#Los gadgets shiny están diseñados para que los utilicen usuarios de R en medio de un análisis de datos. ### RESPUESTA

#Shiny Gadgets está especialmente diseñado para su uso en teléfonos móviles y tabletas.

#Shiny Gadgets está diseñado para tener pequeñas interfaces de usuario que caben en una página. ##RESPUESTA

#Shiny Gadgets se puede ejecutar en la computadora personal de un usuario, a diferencia de una aplicación Shiny normal que debe alojarse en línea. ##NNO 


#Pregunta No. 5

#Considere el siguiente scritp


library(shiny)
library(miniUI)

pickXY <- function() {
  ui <- miniPage(
    gadgetTitleBar("Select Points by Dragging your Mouse"),
    miniContentPanel(
      plotOutput("plot", height = "100%", brush = "brush")
    )
  )
  
  server <- function(input, output, session) {
    output$plot <- renderPlot({
      plot(data_frame$X, data_frame$Y, main = "Plot of Y versus X",
           xlab = "X", ylab = "Y")
    })
    observeEvent(input$done, {
      stopApp(brushedPoints(data_frame, input$brush,
                            xvar = "X", yvar = "Y"))
    })
  }
  
  runGadget(ui, server)
}

my_data <- data.frame(X = rnorm(100), Y = rnorm(100))

pickXY(my_data)

pickXY()

#¿Por qué no está haciendo lo que queremos?
  
#Los nombres de columna incorrectos se pasan a brushedPoints ()
#La llamada a plot () hace referencia a los nombres de columna del marco de datos en el orden incorrecto.
#No se definen argumentos para pickXY ()  ###Respuesta
#Los datos de entrada están definidos de tal manera que no son compatibles con pickXY ()



