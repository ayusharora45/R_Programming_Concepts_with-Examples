#  28-05-2019   Day 19     


#  28-05-2019   Day 19     

library(ggplot2)
library(shiny)
View(mtcars)
#tabs creation

ui=fluidPage(titlePanel("creating the tabs"),
             sidebarLayout(sidebarPanel(
               radioButtons(
                 inputId = "characterstic",
                 label = "select the cagarecterstic for which you want the summary",
                 choices = c("Mileage"="mpg","Displacement"="disp","Horsepower"="hp",
                             "Real axle ratio"="drat","Weight"="wt"),
                 selected = "mpg"
               )
             ),
             mainPanel(tabsetPanel(
               tabPanel("Summary",verbatimTextOutput("mysummary")),
               tabPanel("Histplot",plotOutput("myplot")),
               tabPanel("Barplot",plotOutput("mybarplot"))
             ))))

server=function(input,output){
  output$mysummary=renderPrint(
    {
      summary(mtcars[,input$characterstic])
    }
  )
  output$myplot=renderPlot({
    hist(mtcars[,input$characterstics],main="hist plot")
  })
  output$mybarplot=renderPlot({
    barplot(mtcars[,input$characterstics],main="Bar plot")
  })
}
shinyApp(ui,server)







install.packages("DT")

library(DT)
library(shiny)
library(ggplot2)    #it includes dataset for diamonds

ui=basicPage(h1("The mt Cars data"),DT::dataTableOutput("mytable"))    #h2 is heading tag also it can h6 ,h1 
server=function(input,output){
  output$mytable=DT::renderDataTable({mtcars})
}
shinyApp(ui,server)


#another example of data tables
ui=fluidPage(
  title = "examples of data table",
  #triple equal shows pure equual
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(                
        'input.dataset==="diamonds"',            
        checkboxGroupInput("show_vars","columns in diamonds to show:",
                           names(diamonds),selected = names(diamonds))
      ),
      conditionalPanel(
        'input.dataset==="mtcars"',
        helpText("clcik the column header to sort a column")
      ),
      conditionalPanel(
        'input.dataset==="iris"',
        helpText("display 5 records by default")
      )
    ),
    mainPanel(
      tabsetPanel(
        
        id='dataset',
        tabPanel("diamonds",DT::dataTableOutput("mytable1")),
        tabPanel("mtcars",DT::dataTableOutput("mytable2")),
        tabPanel("iris",DT::dataTableOutput("mytable3"))
      )
    )
  )
)

server=function(input,output){
  #choose column to display
  diamonds2=diamonds[sample(nrow(diamonds),1000),]  #sample is used for random values
  output$mytable1=DT::renderDataTable({
    DT::datatable(diamonds2[,input$show_vars])
  })
  #sorted columns are coloured now because css are attached to them
  output$mytable2=DT::renderDataTable({
    DT::datatable(mtcars,options=list(orderClasses=T))
  })
  #customized the length drop down mwnu display 5 rows per page by default
  output$mytable3=DT::renderDataTable({
    DT::datatable(iris,options = list(lengthMenu=c(5,30,50),pageLength=5))
  })
}

shinyApp(ui,server)


####################################################################
########################class project###########################################
#############################################################


install.packages("plotly")
library(ggplot2)
library(plotly)
library(dplyr)
library(data.table)
setwd(choose.dir())
getwd()

census=read.csv("census.csv")
View(census)

#renaming first five columns
colnames(census)[2:6] = c("Age","Working_class","Citizen_score","Education","Education_Number")
View(census)

#renaminr column from 6 to 10
colnames(census)[7:11]=c("Maritial_Status","Occupation","Relationship","Race","Sex")
View(census)


#renaming column from 11 to 15
colnames(census)[12:16] =  c("Captain_gain","Capital_loss","Hrs/Week","Native","Avg_Salary")
View(census)
str(census)

#convertiing factor to character
census$Working_class=as.character(census$Working_class)
str(census)

#frequency distribution
table(census$Working_class)

#tapply function - mean age across working class 
tapply(census$Age,census$Working_class,mean)

#tapply function - min age across working class 
tapply(census$Age,census$Working_class,min)

#tapply function - max age across working class 
tapply(census$Age,census$Working_class,max)

str(census)
table(census$Education)

census$Education=as.character(census$Education)

#changing value of education observation 
census$Education[census$Education==" 1st-4th"]="Primary School"
census$Education[census$Education==" 5th-6th"]="Primary School"
census$Education[census$Education==" 7th-8th"]="Secondary School"
census$Education[census$Education==" 9th"]="Secondary School"
census$Education[census$Education==" 10th"]="Secondary School"
census$Education[census$Education==" 11th"]="Secondary School"
census$Education[census$Education==" 12th"]="Secondary School"

table(census$Education)
View(census)

#preprocessing maritial status

table(census$Maritial_Status)
census$Maritial_Status=as.character(census$Maritial_Status)

census$Maritial_Status[census$Maritial_Status==" Married-AF-spouse"]="Married"
census$Maritial_Status[census$Maritial_Status==" Married-civ-spouse"]="Married"
census$Maritial_Status[census$Maritial_Status==" Married-spouse-absent"]="Married"
census$Maritial_Status[census$Maritial_Status==" Divorced"]="Single"
census$Maritial_Status[census$Maritial_Status==" Never-married"]="Single"
census$Maritial_Status[census$Maritial_Status==" Seprated"]="Single"
census$Maritial_Status[census$Maritial_Status==" Widowed"]="Single"

table(census$Maritial_Status)


# day 20  29-05-2019


#changing into occupation variable
table(census$Occupation)
census$Occupation=as.character(census$Occupation)

census$Occupation[census$Occupation== " Craft-repair"]<-"Blue Collar"
census$Occupation[census$Occupation== " Farming-fishing"]<-"Blue Collar"
census$Occupation[census$Occupation== " Handlers-cleaners"]<-"Blue Collar"
census$Occupation[census$Occupation== " Machine-op-inspct"]<-"Blue Collar"
census$Occupation[census$Occupation== " Transport-moving"]<-"Blue Collar"
census$Occupation[census$Occupation== " Protective-serv"]<-"Service"
census$Occupation[census$Occupation== " Priv-house-serv"]<-"Service"
census$Occupation[census$Occupation== " Other-service"]<-"Service"
census$Occupation[census$Occupation== " ?"]<-NA
census$Occupation[census$Occupation== " Exec-managerial"]<-"Executive"
census$Occupation[census$Occupation== " Tech-support"]<-"Executive"
census$Occupation[census$Occupation== " Prof-specialty"]<-"Executive"
census$Occupation[census$Occupation== " Adm-clerical"]<-"Executive"

table(census$Occupation)


table(census$Native)
#pre processing native column
census$Native=as.character(census$Native)

census$Native[census$Native== " Japan"]<-"Asia"
census$Native[census$Native== " Iran"]<-"Asia"
census$Native[census$Native== " India"]<-"Asia"
census$Native[census$Native== " China"]<-"Asia"
census$Native[census$Native== " Taiwan"]<-"Asia"
census$Native[census$Native== " Vietnam"]<-"Asia"
census$Native[census$Native== " Cambodia"]<-"Asia"
census$Native[census$Native== " Canada"]<-"Asia"
census$Native[census$Native== " Thailand"]<-"Asia"

census$Native[census$Native== " Portugal"]<-"Europe"
census$Native[census$Native== " England"]<-"Europe"
census$Native[census$Native== " France"]<-"Europe"
census$Native[census$Native== " Germany"]<-"Europe"
census$Native[census$Native== " Greece"]<-"Europe"
census$Native[census$Native== " Scotland"]<-"Europe"
census$Native[census$Native== " Poland"]<-"Europe"
census$Native[census$Native== " Ireland"]<-"Europe"
census$Native[census$Native== " Hungary"]<-"Europe"
census$Native[census$Native== " Yugoslavia"]<-"Europe"

table(census$Native)
View(census)


#preprocessing of data complete

#dplyr package and function

#filtration operation

census %>% filter(Native==" United-States")-> census_US
table(census_US$Native)


#filering records

temp=census_US %>% filter(Age>50 & Sex == " Female") %>% select(Age,Sex)
View(temp)


#summarising

census_US %>% filter(Race == " White" & Avg_Salary==" >50K") %>% summarise(Total_count=n())
census_US %>% filter(Race == " Black" & Avg_Salary==" >50K") %>% summarise(Total_count=n())


#mutate function

census_US %>% mutate(Birth_year = 2019-Age) -> census_US
View(census_US)

#manipulation with data.table
as.data.table(census)->census.dt
census.dt[Education== " Masters"]-> Census_Master
View(Census_Master)
table(Census_Master$Education)

#manipulating rows and columns in data table
Census_Master[(Age>25 & Sex == " Female"),.(Age,Sex,Maritial_Status)]    #datatble me ",." operator use hua data frame me select() use hojata hai

#summmarising

Census_Master[(Age>25 & Working_class == " Self-emp-not-inc"),.(mean_age=mean(Age))]
Census_Master[(Age>25 & Working_class == " Self-emp-not-inc"),.(median_age=median(Age))]

#data visualisation
ggplot(data=census_US,aes(x=Age))+geom_histogram(bins=40,fill="darkmagenta",col="mintcream")

#bar plot
ggplot(data=census_US,aes(x=Maritial_Status))+geom_bar(fill="turquoise")

#box plot
ggplot(data=census_US,aes(y=Age,x=Maritial_Status))+geom_boxplot(fill="seagreen")
ggplot(data=census_US,aes(y=Age,x=Maritial_Status))+geom_boxplot()

       