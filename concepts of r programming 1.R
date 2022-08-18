
#tutorial 1 basics of R language



a=1  #numeric object
a
x=1
x

y=5*10
y
          #  <- or = is same thing is R for assigning values
a<-10
b<-20
a
b
c=a+b
c

sum=10
SUM=20
SUM  
#r is case sensitive language
sum
  

# to create a character object
nameofemployee="lalit"
nameofemployee
nameofemployee<-"ayush"
nameofemployee
t="kritika"
t
#class of an object
class(nameofemployee)
class(a)
class(x)
class(b)
class(y)
class(X)    
#it gives error because there is a no capital X is defined


#list all objects available in R session
ls()         #show all variables


#arithmetic operation in R 
3+4   #add   
5/4   #float divide

5-4   #subtratction
2^5   #power
15%%4  #remainder
# 15%4   #gives error in this



c="ayush arora"
c
class(c)


#logical class
logicalobject=true      #gives error
logicalobject=T
logicalobject
logicalobject=TRUE
logicalobject
class(logicalobject)


#numerical object
a=1
a
class(a)


#character object
a="ayush"
a
class(a)

#logical object
a=T
b=FALSE
a
b
class(a)
class(b)



#multple valueses into an object concatination function - c
a=c(1,2,4,3,5,3,7,5,8,4,9,55)
a
class(a)

#vector in R in one dimensional

nameofemployee=c("mohti","rohit","manish","munesh","ramesh","rajan")
nameofemployee
class(nameofemployee)

answer=c(TRUE,T,F,F,FALSE,TRUE)
answer
class(answer)

#numerical vector
temperature=c(23,54,82,65)
temperature
class(temperature)



#character vector
fruit=c("apple","banana","orange","grapes")
fruit
class(fruit)


#creating list in R
climate=list(c(72,73,69,45),c("Y","N","N","Y"))
climate
class(climate)
names(climate)
names(climate)=c("temperature","rain")
climate




#merging two vectors of different class
fruit= c("apple","banana","orange")
fruit
class(fruit)
cost=c(34,26,25)
cost
class(cost)

fruit_details=list(fruit,cost)
fruit_details
class(fruit_details)
names(fruit_details)=c("fruitnames","cost")
fruit_details



#merge two lists
city=list("newyork","tokyo","mumbai")
country=list("us","japan","india")
city
country
merge_list=list(city,country)
merge_list
class(merge_list)


#creating a matrix
temperature=c(72,73,69,70,87,76)
perception=c(100,110,190,60,34,67)
temperature
perception

climate_matrix=matrix(c(temperature,perception))
climate_matrix
climate_matrix=matrix(c(temperature,perception),nrow=2,ncol=6,byrow=T)
climate_matrix

climate_matrix=matrix(c(temperature,perception),nrow=3,ncol=5,byrow=F)    #bycol kuch nai hota
climate_matrix





#giving names to rows and columns
rownames=c("temperature","perception")
colnames=c("mon","tue","wed","thu","fri","sat")
climate_matrix=matrix(c(temperature,perception),nrow=2,ncol=6,
                      byrow=T,dimname=list(rownames,colnames))
climate_matrix

#creating matrix with values straight away
M1=matrix(c(12,23,56,78,98,73),nrow=2,byrow=T)
M1
M2=matrix(c(13,78,88,75,65,22),nrow=2,ncol=3,byrow=F)
M2
M3=matrix(c(23,78,98,36,74,77),nrow=2,ncol=3,byrow=T)
M3
result=M1+M3
result
result=M1-M3
result
result=M1*M3
result
result=M1/M3
result

#creating dataframe in R for 5 days
climate_data=data.frame(daysofweek=c(1,2,3,4,5),
                        days=c("sunday","monday","tuesday","weddnesday","thursday"),
                        temperature=c(23,45,78,98,55),
                        perception=c(40,98,78,66,120),
                        rain=c("Y","N","N","Y","N"),
                        date=as.Date(c("2018-04-17","2019-12-12","2017-7-14","2019-8-17","2016-3-14")),
                        stringsAsFactors = F)
climate_data
class(climate_data)
str(climate_data)
View(climate_data)


#indexing data frame extracting rowss only
result=climate_data[1:4,]
result
View(result)
result=climate_data[2:4,]
result
View(result)
result=climate_data[c(2,4),]
result
View(result)



#indexing data frame extracting columns only
result=climate_data[,1:4]
result
View(result)
result=climate_data[,2:4]
result
View(result)
result=climate_data[,c(2,4)]
result
View(result)


#extracting rows and column
filter=climate_data[2:4,c(2,3,4)]
filter
View(filter)


#creating dataframe in R for 2 days more
climate_data_new=data.frame(daysofweek=c(6,7),days=c("friday","saturday"),temperature=c(23,78),perception=c(98,12),rain=c("Y","N"),date=as.Date(c("2002-07-24","2019-05-18")),stringsAsFactors = FALSE)
climate_data   #for 5 days
climate_data_new   #for 2 days

climate_final=rbind(climate_data,climate_data_new)
#rbind means row wise binding
climate_final
View(climate_final)



#tutorial 2 based on subscripting and subsetting




#subsetting vector

two= seq(2,22,2)
two
two[1]
two[5]
two[10]
two[14]
two[1:5]
two[2:6]
two[c(2,5,9)]
two[-1]           #to getting element except first element
two[-c(2,4)]      #to getting element except 2 and 4th element


#subsetting list

cars=list(name=c("toyota","nissan","honda"),cost=c(1500,600,1500),color=c("blue","red","black"))
cars

class(cars)
cars$name
class(cars$name)
cars$cost
class(cars$cost)
cars$color

class(cars$color)

cars
cars[1]
cars[[1]]
cars[[1]][1]
cars[[1]][2]

cars[[3]][2]


#View a table in R
View(mtcars)
class(mtcars)


#to extract the first five rows 
mtcarssubset=mtcars[1:5,]
View(mtcarssubset)

#to extract all the rows and first 7 columns 
mtcarssubset=mtcars[,1:7]
View(mtcarssubset)

#to extract first 5 rows and first 2 columns 
mtcarssubset=mtcars[1:5,1:2]
View(mtcarssubset)


#to get the values of mpg columns
mpgonly=mtcars$mpg
View(mpgonly)


#to View the iris dataset
View(iris)
View(iris3)

#concept of packages in R (around 10 k packages inside CRAN.R-PROJECT.org)
#step 1 = to install MASS package for BOSTON
#step 1 = to install the MASS package tab
#step 2 = configure the project

install.packages("MASS")
library(MASS)
library(help=MASS)
View(Boston)

#another example

install.packages("hflights")
library(hflights)
library(help=hflights)














