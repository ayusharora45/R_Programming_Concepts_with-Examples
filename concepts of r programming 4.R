install.packages("dplyr")
library(dplyr)
#View(dplyr)    isko dekh nai sakte iska koi dataframe ni hai
install.packages("hflights")
library(hflights)
View(hflights)

#selecting daata using column name
hflightsubsetdatawithcolname=select(hflights,Year,Month,FlightNum)
View(hflightsubsetdatawithcolname)

#selecting data using column no
hflightsubsetdatawithcolno=select(hflights,1,6,8)
View(hflightsubsetdatawithcolno)

#selecting variable with a defined text string
h1=select(hflights,contains("Time"))
View(h1)

h2=select(hflights,contains("im"))
View(h2)

#selecting variable with a series of column no.
h3=select(hflights,2:7)
View(h3)

#selecting variable with a series of column name
h4=select(hflights,Month:FlightNum)
View(h4)


#selecting variable with starting of column name
h5=select(hflights,starts_with("Day"))
View(h5)

#selecting variable with ending of column name
h5=select(hflights,ends_with("Time"))
View(h5)

#selecting variable with starting and ending of column name
h5=select(hflights,starts_with("Day"),ends_with("Time"),1:2,3,15,FlightNum)
View(h5)


#functions in R for data manipulation

marks=read.csv("C:\\Users\\user\\Desktop\\data science training\\R language files\\csv files\\marks.csv")
marks
View(marks)

markstotal=mutate(marks,totalmarks=Maths+Physics+Chemistry)
View(markstotal)

markspercentage=mutate(markstotal,percentage=totalmarks/3)
View(markspercentage)

passingstatus=mutate(markspercentage,result=ifelse(percentage>40,"pass","fail"))
View(passingstatus)

#filtering out records in a table

View(mtcars)
mtcarswithgt4cyl=filter(mtcars,cyl>4)
View(mtcarswithgt4cyl)

mtcarswitheq4cyl=filter(mtcars,cyl==4)
View(mtcarswitheq4cyl)

mtcarswithgt24mpg=filter(mtcars,mpg>24)
View(mtcarswithgt24mpg)

#filterring out records from multiple condition
m1=filter(mtcars,hp>150&gear==5)
View(m1)
m2=filter(mtcars,hp>150 | gear>5)
View(m2)

m3=filter(mtcars,hp>150 & gear==5 &carb>4)
View(m3)


#arrange functions
#to arrange function in ascending or descending , by default it arranging in ascending

milagepercar=arrange(mtcars,mpg)
View(milagepercar)

m2=arrange(mtcars,desc(mpg))
View(m2)

#summarise function
house=read.csv("C:\\Users\\user\\Desktop\\data science training\\R language files\\csv files\\house.csv")
View(house)
install.packages("plyr")   #to use summarise function install plyr package
library('plyr')
minp=summarise(house,min_price=min(price))
View(minp)


summarise(house,max_price=max(price))
summarise(house,sum_price=sum(price))


#piping in R  programming
library(dplyr)
library(hflights)
View(hflights)

#to work with multiple function in R using piping
View(hflights %>% select(contains("Time")) %>% filter(AirTime>100))
hflightssubset=hflights %>% filter(UniqueCarrier == "WN") %>% summarise(max(AirTime,na.rm = T))
View(hflightssubset)

hflightsfiltered=hflights %>% select(8,11,16) %>% mutate(Avg.speed=Distance/AirTime*60) %>% filter(Avg.speed>500)
View(hflightsfiltered)

hf=hflights%>% select(8,11,16)%>% mutate(Avg.speed=Distance/AirTime*60)%>% summarise(min.speed=min(Avg.speed,na.rm = T))
View(hf)
hflights%>%filter(UniqueCarrier == "WN")%>% summarise(min.Time=min(AirTime,na.rm = T))

hflights%>%filter(UniqueCarrier == "WN")%>% summarise(max.Time=max(AirTime,na.rm = T))
