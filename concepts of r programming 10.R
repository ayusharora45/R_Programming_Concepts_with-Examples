install.packages("shinydashboard")
library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)

setwd(choose.dir())
getwd()

recommendation=read.csv("recommendation.csv",stringsAsFactors = F,header = F)
recommendation
View(recommendation)

head(recommendation)

ui=dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

server=function(input,output){}


shinyApp(ui,server)

#dashboard header carrying the tittle of the dashboard
header<-dashboardHeader(title= "Basic Dashboard")

#side bar content of the dashboard
sidebar=dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard",tabName = "dashboard",icon=icon("dashboard")),
    menuItem("Visit us ",icon = icon("send",lib = 'glyphicon'),href="http://www.cdac.in")
  )
)

frow1=fluidRow(valueBoxOutput("value1"),valueBoxOutput("value2"),valueBoxOutput("value3"))

frow2=fluidRow(
  box(
    title="Revenue per account",
    status = "primary",
    solidHeader = T,
    collapsible = T,
    plotOutput("revenuebyPrd",height = "300px")
  ),
  box(
    title="Revenue per product",
    status = "primary",
    solidHeader = T,
    collapsible = T,
    plotOutput("revenuebyRegion",height = "300px")
  )
)

#combine the two fluid rows to make the body

body  = dashboardBody(frow1,frow2)

#completing the ui part with dashboard page 
ui <- dashboardPage(title = 'this is my page title',header,sidebar,body,skin = 'red')

#create the sever function for the dashboard 

server=function(input,output){
  #some data manipuation to derive the values of KPI boxes(knowledge performance indicator)
  total.revenue=sum(recommendation$Revenue)
  sales.account<-recommendation %>% group_by(Account) %>% summarise(value=sum(Revenue)) %>% filter(value==max(value))
  prof.prod<-recommendation %>% group_by(Product) %>% summarise(value=sum(Revenue)) %>% filter(value==max(value))
  
  #creating the value box output content

  output$value1 =renderValueBox({
    valueBox(
      formatC(sales.account$value,format = "d",big.mark = ','),
      paste("Top Account:",sales.account$Account ),
      icon = icon("stats",lib = "glyphicon"),
      color = "purple")
  })
  
  
  output$value2 =renderValueBox({
    valueBox(
      formatC(total.revenue,format = "d",big.mark = ','),
      'Total Expected Revenue',
      icon = icon("gbp",lib = "glyphicon"),
      color = "green")
  })
  
  
  output$value3 =renderValueBox({
    valueBox(
      formatC(prof.prod$value,format = "d",big.mark = ','),
      paste("Top Product:",prof.prod$Product),
      icon = icon("menu-hamburger",lib = "glyphicon"),
      color = "yellow")
  })
  
  
  #creating the plotOutput content
  
  output$revenuebyPrd = renderPlot({
    ggplot(data=recommendation,aes(x=Product,y=Revenue,fill=factor(Region)))+
      geom_bar(position = "dodge",stat = "identity")+ylab("Revenue (in Euros)")+
      xlab("Product")+theme(legend.position = "bottom",plot.title = element_text(size=15,face = "bold"))+
       ggtitle("Revenue by product")+labs(fill="Region")
  }
  )
  
  
  output$revenuebyRegion = renderPlot({
    ggplot(data=recommendation,aes(x=Account,y=Revenue,fill=factor(Region)))+
      geom_bar(position = "dodge",stat = "identity")+ylab("Revenue (in Euros)")+
      xlab("Account")+theme(legend.position = "bottom",plot.title = element_text(size=15,face = "bold"))+
      ggtitle("Revenue by Region")+labs(fill="Region")
  }
  )
  
}


#run/call the shiny app

shinyApp(ui,server)


#implement with hflights

