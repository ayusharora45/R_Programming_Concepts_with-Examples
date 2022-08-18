library(shiny)
library(ggplot2)
library(dplyr)

setwd(choose.dir())
getwd()
store=read.csv("store-data.csv",stringsAsFactors = F)
View(store)


ui<-fluidPage(
  titlePanel("Store Prices"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "priceInput",label = "Price",0,100,c(25,45),pre="$"),
      radioButtons(inputId = "typeInput",label = "Product type",choices = c("BEER","REFRESHMENTS","SPRITS","WINE"),
                   selected = "WINE"),
      uiOutput("countryOutput")    #input id ,label ,range are the default arguments if we does not provide there names in arguments 
    ),
    mainPanel(
      plotOutput("plot"),
      br(),br(),      #br() for new line
      tableOutput("results")
      )
  )
)

server=function(input,output){
  output$countryOutput=renderUI({
    selectInput("countryInput","Country",
                sort(unique(store$Country)),
                selected = "CANADA")
    
  })
  
  filtered=reactive({
    if(is.null(input$countryInput)) {
      return(NULL)                    #to exit function use return to exit loop uses break
    }
    
    store %>% filter(Price>=input$priceInput[1],
                     Price<=input$priceInput[2],
                     Type==input$typeInput,
                     Country==input$countryInput
       )
    })

  output$plot=renderPlot({
    if(is.null(filtered())) {
      return()
    }
    ggplot(filtered(),aes(Alcohol_Content))+geom_histogram()
  })
  
  output$results<-renderTable({filtered()})
  
}
shinyApp(ui=ui,server=server)





#another example
#===============================

library(shiny)
library(DT)
fields<-c("name","age","height","weight")
ui<-fluidPage(
  #application title
  titlePanel("Health Card"),
  
  #sidebar with reactive inputs
  sidebarLayout(
    sidebarPanel(
      textInput("name","Your Name"),
      selectInput("age","Age bracket",c("18-25","25-45","above 45")),
      textInput("weight","please enter your weight in kg"),
      textInput("height","please enter your height in cm"),
      actionButton("save","Add")
    ),
    #A TABLE OF REACTIVE OUTPUTS
    mainPanel(
      DT::dataTableOutput("responses",width = 500),tags$hr()    #hr() means horizontal row
    )
  )
)



#define server logic

server=function(input,output){
  
  #create a data frame called responses
  saveData=function(data){
    data <- as.data.frame(t(data))
    if(exists("responses")){
      responses <<- rbind(responses,data)      #<<- it is used for apppend the data on exixting  and <- it stores the data
    }else {
      responses <<- data
    }
  }

loadData <- function(){
  if(exists("responses")){
    responses
  }
}

#whenever a field is filled , aggregate all form data formdata is a reactive function
formData<- reactive({
  data<- sapply(fields,function(x){input[[x]]})
  data
})  

#when the save button is clicked save the form data 
observeEvent(input$save,{saveData(formData())})

#show the previous responses (update with current response when save is clicked )
output$responses <- DT::renderDataTable({
  input$save
  loadData()
})
}

shinyApp(ui,server)

