
# Here is the UI part of Shiny 

library('shiny')
library(dygraphs)

m_PARAM <- 0


list_models <- c(1,2,3)

## We get the date of last week, to give default values to the "date"

date1<-as.character(Sys.Date())
strdate1 <- strsplit(date1,"-")
defaultdateEnd <- ISOdatetime(strdate1[[1]][1],strdate1[[1]][2],strdate1[[1]][3],00,00,00)
defaultdateBegin <- defaultdateEnd-60*60*24*3

shinyUI(fluidPage(
  column(3),
  titlePanel("test"),
  
  sidebarLayout(
    sidebarPanel(
      

        
        column(8,
               dateRangeInput("dates", 
                              label = h3("Dates"),
                              start = defaultdateBegin,
                              end = defaultdateEnd
               )
        )
      ),
      
      fluidRow( 
        
        #checkboxGroupInput
        column((5), 
               checkboxGroupInput("model", 
                                  label = h3("Choix du modele"), 
                                  choices = list_models,
                                  selected = 8)
        )
        
        
        
      )
      
    ),
    
    mainPanel
    (
    dygraphOutput("plot1")
    )
  )
)
