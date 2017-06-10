
library(shiny)

crimes<-readRDS(file="./data/Crime.Rds")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
  output$crimesMap <- renderPlot({
    
    
    df<-crimes%>%filter(between(Year, input$year[1], input$year[2]) & 
                          Primary.Type==input$type)%>%
      group_by(Location.Description)%>%
      summarise(NumberOfCrimes=n())%>%top_n(10,NumberOfCrimes)%>%
      arrange(desc(NumberOfCrimes))
    
    ggplot(df,aes(x=Location.Description,y=NumberOfCrimes))+
      geom_col()+theme(axis.text.x = element_text(angle = 90, hjust = 1))
    
    
  })
  
})
