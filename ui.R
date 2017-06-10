library(leaflet)
library(shiny)
library(ggmap)
library(dplyr)

# Choices for drop-down

vars<-c("HOMICIDE","SEX OFFENSE","BATTERY","DECEPTIVE PRACTICE","CRIM SEXUAL ASSAULT","THEFT",
        "MOTOR VEHICLE THEFT","CRIMINAL DAMAGE","NARCOTICS","OTHER OFFENSE",
        "PROSTITUTION","BURGLARY","OFFENSE INVOLVING CHILDREN","ROBBERY","ASSAULT",
        "CRIMINAL TRESPASS","PUBLIC PEACE VIOLATION","WEAPONS VIOLATION","KIDNAPPING","GAMBLING",
        "LIQUOR LAW VIOLATION","INTERFERENCE WITH PUBLIC OFFICER","ARSON","STALKING",
        "INTIMIDATION","OBSCENITY","NON-CRIMINAL","PUBLIC INDECENCY","OTHER NARCOTIC VIOLATION")


shinyUI(fluidPage(theme = "styless.css",
  
  sidebarLayout(
    
    
    sidebarPanel(
      
      h2("Chicago Crimes On Map"),
      
      selectInput("type", "Type of crime", vars),
      
      sliderInput("year",
                  "Year:",
                  min = 2012,
                  max = 2017,
                  value = c(2012,2017),
                  sep=""
                  )
      
      
    ),
    
    mainPanel(plotOutput("crimesMap"))
  
  
  
  )           
  
  )
)

