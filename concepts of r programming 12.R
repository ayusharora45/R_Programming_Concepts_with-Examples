library(markdown)
library(shiny)
installed.packages()  #to see the all installed packages in R system
cars=c(1,2,3,4,68,9,3,2)
View(mtcars)
View(cars)

ui= navbarPage("MTCars data set",
               tabPanel("Plot",
                           sidebarLayout(
                             sidebarPanel(
                               radioButtons(inputId = "plotType",label = "Plot Type",c("Scatter"="p","Line"="l")
                                            )
                             ),
                             mainPanel(
                               plotOutput("plot")
                             )
                           )
                           ),
               tabPanel("Summary",verbatimTextOutput("summary")),
               navbarMenu("More",tabPanel("Table",DT::dataTableOutput("table"))
                          ))
server=function(input,output){
  output$plot<-renderPlot({
  plot(cars,type = input$plotType)
})
  output$summary<-renderPrint({
    summary(cars)
    
  })
  output$table= DT::renderDataTable({
    DT::datatable(mtcars)
  })
}
shinyApp(ui,server)





#first install the rjson
install.packages("rjson")     #json stands java script object notation

#load the packages to read the JSOn files
library(rjson)

setwd(choose.dir())
getwd()

#read the JSON data 
result = fromJSON(file="my_data.json")


#to print the JSON data
print(result)

#convert JSON to a dara frame
json_frame <- as.data.frame(result)
print(json_frame)
View(json_frame)





##first install the xlsx
install.packages("xlsx")
library(xlsx)

#for checking the package is installed or not 
any(grepl("xlsx"),installed.packages())

setwd(choose.dir())

getwd()

#read the worksheet from the file Book1.xlsx
data<- read.xlsx("Book1.xlsx",sheetIndex = 1)
print(data)
my_data <-as.data.frame(data)
View(my_data)


##first install the xml
install.packages("XML")
library(XML)
library(methods)

setwd(choose.dir())
getwd()

#to read the XML file in R
data=xmlParse(file="my_data.xml")
print(data)

root<-xmlRoot(data)
size<-xmlSize(data)
print(size)

print(root[1])
print(root[2])

print(root)
#get the  first element of the first node
print(root[[1]][[1]])

#get the  fifth element of the first node
print(root[[1]][[5]])

#get the  second element of the third node
print(root[[3]][[2]])


#converting to dataframe
xml_data_frame=xmlToDataFrame("my_data.xml")
print(xml_data_frame)
View(xml_data_frame)
