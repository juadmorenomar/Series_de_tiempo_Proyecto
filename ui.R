library(shiny)
fluidPage(
  titlePanel("Series de Tiempo"), ##Titulo panel
  sidebarLayout(
    sidebarPanel(

      fileInput('archivo', 'Cargar el archivo',   ###nombre del archivo
                accept = c(
               #   'text/csv',
                #  'text/comma-separated-values,text/plain',
                 # 'text/tab-separated-values',
                  #'text/plain',
              #   ".csv",
                  '.xlsx'
                )
      ),
      tags$hr(),
      #radioButtons('skipper', 'Número de lineas para saltar antes de leer los datos del archivo',
                   #c(Cero=0,
                     #Una=1
                   #)),
      selectizeInput('skipper','¿Los datos de entrada tienen encabezado?',
                     choices=c("Sí"=1, "No"=0)),

      tags$hr(),
      numericInput('year','Ingrese el año de inicio',value =2017 ),
      tags$hr(),  
      numericInput('month','Ingrese el mes/periodo de inicio',value=01),
      tags$hr(),
      numericInput('frequency','Ingrese la frecuencia',value=12)
    ),

    mainPanel(    ##van las salidas
      tabsetPanel(
        tabPanel("Serie de tiempo",
      tags$style(type="text/css",
                 ".shiny-output-error { visibility: hidden; }",
                 ".shiny-output-error:before { visibility: ; }"
      ),

                 plotOutput("contents1" )


      ),
      
      tabPanel("a1", #boxplot, histograma, media, desviacion estandar, 
              
               
               plotOutput("contents3" ),  #Boxplot
               

               plotOutput("contents6")  #Histograma
      ),
      
      tabPanel("a2",
               
               plotOutput("contents2" ), #descomposicion de la serie
               

               splitLayout(   #ACF y PACF
                 plotOutput("contents4" ),
                 
                 
                 plotOutput("contents5" )
                 
                 
               )
               
           )
      
      ),
      
   
    position = c("right")   ##Ubicación del panel de control
  )
)
)
