install.packages("shiny")
library(shiny)
ui=fluidPage("this is shiny Application")
server=function(input,output){}
shinyApp(ui=ui,server=server)

#hoe to define inputs
stdin=sliderInput(inputId = "Slider1",label = "Marks",value =7,min = 0,max = 10)
shinyApp(ui=stdin,server=server)

#to create an action button
acb=actionButton(inputId = "b1",label = "press",width = 300,icon = icon("play-circle"))
shinyApp(ui=acb,server=server)


#to create an checkbox
chkbx=checkboxInput(inputId = "c1",label = "yes",value = F,width = 500)
shinyApp(ui=chkbx,server=server)

#to create checkboxgroupinput
chkbxin=checkboxGroupInput(inputId = "cg1",label = "select fruits",choices = c("apple","mango","banana","grapes"),selected = "apple")
shinyApp(ui=chkbxin,server=server)

#to select date
dip=dateInput(inputId = "d1",label = "input date", value="1990-10-19",min = "1989-01-02",max = "2019-10-10")
shinyApp(ui=dip,server=server)

#upload file user interface
fin=fileInput(inputId = "f1",label = "select file", buttonLabel = "open",placeholder = "upload file")
shinyApp(ui=fin,server=server)

#radio buttons
rb=radioButtons(inputId = "r1",label = "favroite game", choices = c("football","circket","hockey"),selected = "football")
shinyApp(ui=rb,server=server)



#output function
ui=fluidPage(plotOutput(outputId = "p1
                        "))
server=function(input,output){
  output$p1=renderPlot(plot(1:100))
}
shinyApp(ui=ui,server=server)

#histogram plot
ui=fluidPage(plotOutput(outputId = "p2"))
server=function(input,output){
  output$p2=renderPlot(hist(iris$Sepal.Length,col = "palegreen4"))
}
shinyApp(ui=ui,server=server)

#box plot
library(ggplot2)
ggplot(iris,aes(y=Sepal.Length,x=Species,fill=Species))+geom_boxplot()
ui=fluidPage(plotOutput(outputId = "p2"))
server=function(input,output){
  output$p2=renderPlot(ggplot(iris,aes(y=Sepal.Length,x=Species,fill=Species))+geom_boxplot())
}
shinyApp(ui=ui,server=server)


#combining input and output
ui=fluidPage(sliderInput(inputId = "Slide1",label="select value",min = 0,max=100,value = 50),plotOutput(outputId = "hist1"))
server=function(input,output){
  output$hist1=renderPlot(hist(rnorm(input$Slide1),col="cadetblue"))
}
shinyApp(ui=ui,server=server)


#day 18 27-05-2019


#end to end application using economics data
setwd(choose.dir())

econ=read.csv("economics.csv")
View(econ)  #select input is for drop down menu
ui=fluidPage(selectInput(inputId = "si1",label = "choose column",choices = c("personal saving rate"=2,
                                                                             "personal savving expenditure"=3,
                                                                             "number of employement"=4,
                                                                             "mean duration of unemployement in thousands"=5)),
             selectInput(inputId = "si2",label = "choose color",choices = c("palegreen4","darkmagenta","coral","cadetblue")),
             sliderInput(inputId = "slide1",label = "select bin value",min=10,max=100,value=11,animate = T),
             plotOutput(outputId = "hist2"))


server=function(input,output){
  output$hist2=renderPlot({option=as.numeric(input$si1)
  ggplot(econ,aes(x=econ[,option]))+geom_histogram(fill=input$si2,col="blue",bins=input$slide1)})
}
shinyApp(ui=ui,server=server)

#button changes the histogram

ui=fluidPage(actionButton(inputId = "click",label = "click"),
             numericInput(inputId = "n",label = "numeric inputtt",value = 50),
             plotOutput("plot"))
#eventReactive() creates a rective expression theat monitors a reactive value,
#which is a set in the first argument of eventReactive()
server=function(input,output){
  randomVals=eventReactive(input$click,{runif(input$n)})
                           output$plot=renderPlot({hist(randomVals())})
  
  }
shinyApp(ui=ui,server=server)



#example 1

ui=fluidPage(sidebarLayout(
  sidebarPanel(
    radioButtons(inputId = "month",label  ="in which month you are born ",
                 choices=list( "jan-march"=1,"april-june"=2,"jul-sept"=3,"oct-dec"=4),selected = 2),
  
    numericInput(inputId = "childrencount",label = "how many childre do yu have",value=2,min=0,max=10),
    
    selectInput(inputId = "smoke",label = "are you a smoker",choices = c("yes","no","i rarely smoke"),selected = "yes"),
  
    checkboxInput(inputId = "checkbox",label = "are you a human",value = F),
    
    checkboxGroupInput(inputId = "checkbox2",label="2+2= ?",choices = list(4,"four","IV","none")),
  
    actionButton(inputId = "act",label = "Go"),
  
    sliderInput(inputId = "slider1",label = "slider 1",min=5,max=100,value=50)),
  mainPanel()
))
server=function(input,output){}
shinyApp(ui=ui,server=server)





#example 2
ui=fluidPage(titlePanel("Viewing data"),
             sidebarLayout(sidebarPanel(
               selectInput(inputId = "species",label = "select the flower species",
                           choices = c("setosa","versicolor","virginica"),selected = "setosa")
             ),
             mainPanel(tableOutput(outputId = "data"))))
server=function(input,output){
  output$data=renderTable({
    iris[iris$Species==input$species,]
  })
}
shinyApp(ui=ui,server=server)



#exapmple 3
#UI part of iris data set
ui=fluidPage(titlePanel("creating the plots"),
             sidebarLayout(sidebarPanel(
               selectInput(inputId = "characterstic",label = "select the charcterstics for which you want the histogram",
                           choices = c("Sepal Length","Sepal Width","Petal Length","Petal Width"),selected = "Sepal Length")
             ),
             mainPanel(plotOutput("myplot"))))
#server part of iris dataset
server=function(input,output){
  char=reactive({
    switch(
      input$characterstic,
      "Sepal Length"= "Sepal.Length",
      "Sepal Width"= "Sepal.Width",
      "Petal Length"= "Petal.Length",
      "Petal Width"= "Petal.Width"
    )
  })
  output$myplot=renderPlot({
    hist(
      iris[,char()],
      xlab = input$characterstic,
      main = paste("histogram of ",input$characterstic)
    )
  })
}
shinyApp(ui=ui,server=server)



#homework
#operations on hflights data set of shiny
library(hflights)
library(shiny)
library(ggplot2)

View(hflights)
ui=fluidPage(selectInput(inputId = "s1",label = "choose column",choices=c("AirTime"=11,
                                                                          "DayOfWeek"=4,
                                                                          "TaxiIn"=13,
                                                                          "TaxiOut"=12)),
             selectInput(inputId = "s2",label = "choose color",choices = c("blue","red","green","yellow")),
             sliderInput(inputId = "s3",label = "slide it",value = 50,max = 100,min=0),
             plotOutput(outputId = "o1")
             
)
server=function(input,output){
  output$o1=renderPlot({option=as.numeric(input$s1)
  ggplot(hflights,aes(x=hflights[,option]))+geom_histogram(fill=input$s2,col="blue",bins=input$s3)})
  
}
shinyApp(ui=ui,server=server)



