setwd(choose.dir())   #to set the current working directory
getwd()   #to get the current working directory
house=read.csv("house.csv")    #reading the existing set datavalues
View(house,"House details")


  #working with histogram
hist(house$price)     #single me only numeric value wala column
hist(house$price,xlab="price of houses",ylab = "no.of houses")
hist(house$price,col="green",xlab="price of houses",ylab = "no.of houses")

#function for series of colors
colorRampPalette(c("yellow","blue"))->colfun
hist(house$price,col=colfun(10))         #5 denote kar raha hai ki yellow aur blue ko milakar yaha 5 color bnaye hai 
hist(house$price,xlab="price of houses",ylab = "no.of houses",main = "price distribution")
hist(house$price,xlab="price of houses",ylab = "no.of houses",breaks =8,col=colfun(8))



#working with scatter plots
#plot(y~x) start with y axis always
#y= house prices  x= house living area

plot(house$price~house$living_area)   

plot(house$price~house$living_area,col="red")
plot(house$price~house$living_area,col="red",xlab="living area",ylab = "price of houses")       
plot(house$price~house$living_area,col="red",xlab="living area",ylab = "price of houses",main="price distribution")       

#pch levels are from 0 to 25 (evey no define different shape)

plot(house$price~house$living_area,pch=22)
plot(house$price~house$living_area,pch=21)
plot(house$price~house$living_area,pch=15)
colorRampPalette(c("red","blue","green"))->colfun
plot(house$price~house$living_area,pch=21,col=colfun(600))


#working with the box plots
boxplot(house$price)          #single me only numeric value wala column
                              #dono numeric column bhi ho skte hai
                              #ak numeric or ak character bhi ho skta hai
boxplot(house$land_value)
boxplot(house$price~house$waterfront)
boxplot(house$price~house$living_area)
boxplot(house$price~house$waterfront,col=c("palegreen4","blue"))
colorRampPalette(c("red","blue","green"))->colfun
boxplot(house$price~house$living_area,col=colfun(7))

#another example of scatter plot
View(iris)
plot(iris$Petal.Length~iris$Sepal.Length)
plot(iris$Petal.Length~iris$Sepal.Length,col=c("palegreen4","blue","red","yellow"),pch=2)
plot(iris$Petal.Length~iris$Sepal.Length,col=iris$Species)

colorRampPalette(c("red","blue","green"))->colfun
plot(iris$Petal.Length~iris$Sepal.Length,col=colfun(9))


#working with pie chart
unique(house$air_cond)        #duplicates ko remove karne ke liye
unique(house$sewer)
unique(house$fireplaces)

#to find the frequency of yes or no
table(house$air_cond)             #konsa element kitni bar aaya hai btane ke liye
         
table(house$sewer)

table(house$fireplaces)

table(house$construction)


pie(table(house$air_cond))
pie(table(house$fireplaces),col=c("red","yellow","green","blue"))
pie(table(house$air_cond),col=c("red","yellow","green","blue"))    #last ke 2 color lega nai qkki kaam me nai aa rahe
pie(table(house$air_cond),col=c("red","blue"))
colorRampPalette(c("red","blue","green"))->colfun
pie(table(house$air_cond),col=colfun(9))

#working with ggplot2 (examples of aesthetics,scatterplot)     === group of matrix vaues ko design karta hai
#aes asign karta hai x aur y axis ko kispar ky plot kar rahe hai
install.packages("ggplot2")
library(ggplot2)

ggplot(iris,aes(x=Petal.Length,y=Sepal.Length)) + geom_point()

ggplot(iris,aes(x=Petal.Length,y=Sepal.Length,col=Species))+geom_point()
ggplot(iris,aes(x=Petal.Length,y=Sepal.Length,col=Species,shape=Species))+geom_point()

#to select different geomectry


ggplot(house,aes(x=price)) + geom_histogram()
# fill to color fill karne ke liye 
#col outline dene ke liye
ggplot(house,aes(x=price)) + geom_histogram(fill="palegreen4")
ggplot(house,aes(x=price)) + geom_histogram(fill="palegreen4",col="green")
ggplot(house,aes(x=price)) + geom_histogram(col="green")

ggplot(house,aes(x=price,fill=air_cond))+geom_histogram()
ggplot(house,aes(x=price,fill=air_cond))+geom_histogram(col="yellow")

ggplot(house,aes(x=price,fill=air_cond))+geom_histogram(position = "identity")

#identity ke sath col kam ni karta 
#col gives border color
ggplot(house,aes(x=price,fill=air_cond))+geom_histogram(position = "fill")
ggplot(house,aes(x=price,fill=air_cond))+geom_histogram(position = "fill",col="yellow")
ggplot(house,aes(x=price,fill=air_cond))+geom_histogram(position = "fill",col="yellow",fill="green")

ggplot(house,aes(x=waterfront))+geom_bar(fill="cadetblue")      #geom_bar only used for 1 variable
ggplot(house,aes(x=construction))+geom_bar(fill="cadetblue")
ggplot(house,aes(x=fuel))+geom_bar(fill="cadetblue")
ggplot(house,aes(x=sewer))+geom_bar(fill="cadetblue",col="yellow")

ggplot(house,aes(x=living_area,y=price))+geom_point(col="yellow")   #geom bar will not work here
ggplot(house,aes(x=living_area,y=price,col=rooms))+geom_point() 


#working with density plots
ggplot(house,aes(x=price))+geom_density()        # used for 1 variable

#adding colors
ggplot(house,aes(x=price))+geom_density(fill="blue")
ggplot(house,aes(x=price,fill=air_cond))+geom_density()


#to define the transparency level
ggplot(house,aes(x=price,fill=air_cond))+geom_density(alpha=0.25)    #alpha lies between 0 to 1


#smooth curve
ggplot(house,aes(x=price,y=living_area))+geom_smooth()
ggplot(house,aes(x=price,y=living_area))+geom_smooth(se=F)   #se meansstandard error

#split by waterfront variable

ggplot(house,aes(x=price,y=living_area,col=waterfront))+geom_smooth()       #both x and y should numeric 

ggplot(house,aes(x=price,y=living_area,col=waterfront))+geom_smooth(se=F) 


ggplot(house,aes(x=price,y=living_area))+geom_smooth(se=F) +geom_point() 
ggplot(house,aes(x=price,y=living_area,col=heat))+geom_smooth(se=F) +geom_point() 
ggplot(house,aes(x=price,y=living_area,col=heat))+geom_smooth(method = "lm") +geom_point() 


##voilin plot

ggplot(house,aes(x=living_area,y=price))+geom_violin()
ggplot(house,aes(x=sewer,y=price))+geom_violin()
ggplot(house,aes(x=waterfront,y=price,fill=air_cond))+geom_violin()
ggplot(house,aes(x=waterfront,y=price,fill=sewer))+geom_violin() 


#faceting
ggplot(house,aes(y=price,x=living_area,col=fuel))+geom_point()
ggplot(house,aes(y=price,x=living_area,col=fuel))+geom_point() + facet_grid(.~fuel)


#facet histogram
ggplot(house,aes(x=price,fill=heat))+geom_histogram()
ggplot(house,aes(x=price,fill=heat))+geom_histogram()
ggplot(house,aes(x=price,fill=heat))+geom_histogram(col="yellow")

ggplot(house,aes(x=price,fill=heat))+geom_histogram(col="yellow") +facet_grid(.~sewer)


#faceting a box plot
ggplot(house,aes(y=price,x=fuel,fill=air_cond))+geom_boxplot()
ggplot(house,aes(y=price,x=fuel,fill=air_cond))+geom_boxplot() +facet_grid(.~air_cond)

#themelayer

ggplot(house,aes(y=price,x=living_area,col=heat))+ geom_point() +theme(panel.background = element_rect("yellow"))

ggplot(house,aes(y=price,x=living_area,col=heat))+ geom_point() +theme(panel.background = element_rect("yellow"))+geom_smooth()


#assigning the color to the back ground

ggplot(house,aes(y=price,x=living_area,col=heat))+ geom_point() +geom_smooth() +theme(panel.background = element_rect("yellow"),plot.background = element_rect("coral"))



#working with workcloud2
install.packages("wordcloud2")
library(wordcloud2)
View(demoFreq)
wordcloud2(demoFreq)
wordcloud2(demoFreq,shape="star",size=1)




