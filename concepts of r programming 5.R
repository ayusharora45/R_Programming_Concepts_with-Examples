

#prepairing tables

employee_designation=data.frame(name=c("john","sam","raj","amy","anne"),
                               designation=c("CEO","CTI","analyst","manager","worker"))
View(employee_designation)



employee_salary=data.frame(name=c("john","sam","anand","manish","anne"),
                                salary=c(92871,5761,16578,68,4566))
View(employee_salary , "EMPLOYEE SALARY")

#left join =select all the records from the left table and match all the record from the right table
left=left_join(employee_designation,employee_salary,by="name")
str(employee_designation)
str(employee_salary)
View(left)


#right join =select all the records from the right table and match all the record from the left table
right=right_join(employee_designation,employee_salary,by="name")
str(employee_designation)
str(employee_salary)
View(right)


#inner join = only those records in both tables
inner=inner_join(employee_designation,employee_salary,by="name")
View(inner)



#full join= getting all those records in both table
full=full_join(employee_designation,employee_salary,by="name")
View(full)


#datatable in R programming
install.packages("data.table")
library(data.table)
class(iris)
View(iris)
str(iris)

#to convert the iris dataframe into datatable
as.data.table(iris)->iris.dt
#data table iris.dt me store`` hoga yaha convert karte time revrse hota hai

View(iris.dt)
class(iris.dt)
class(iris)
str(iris.dt)

#selecting rows
iris.dt[2:7] #to extract rows from 2 to 7
iris.dt[c(1,3,5,2)]

#to extract rows with relational operators

iris.dt[Species=="setosa"]    
iris.dt[Sepal.Length>6]
View(iris.dt[Sepal.Length>5 & Petal.Length>5])
View(iris.dt[Sepal.Length>5 | Petal.Length>5])

#selecting columns
View(iris.dt[,2:5])
View(iris.dt[,c(1,3,5)])
View(iris.dt[,Sepal.Length:Species])

#to filter out rows and column as well
library(hflights)
View(hflights)
class(hflights)
as.data.table(hflights)->hflights.dt
class(hflights.dt)

View(hflights.dt[AirTime>100,c("DepTime","ArrTime","AirTime")])
iris.dt[,mean(Sepal.Length),by=Species]      #is used to group by



#graphing or ploting of data
library(dplyr)

cars=c(1,3,6,7,9)
plot(cars)
cars=c(1,3,6,7,9)
plot(cars,type="o",col="green")
title(main="Autos",col.main="blue",font.main=89)



#customized (user defined function in R)

#step 1 Builded Function

fun1=function(){print(4)}
#step2 2 execute function
fun1()
fun2=function(x){print(x)}
fun2("ayush")
fun2(2100)

fun2(c(1:100))

fun2(c("ayush","kritika","shorya","gaurav"))
fun2(c(T,F,F,F,T))
fun2(list(c(T,T,F,F,F),c(1,3),c("a","b")))

#it is converted into numeric vector
power2=function(x){x^2}
power2(5)
power2(7)

add=function(x,y){x+y}
add(5,2)
add(5,power2(2))

#integrate loops and functions (loops functions)
mean_of_all_cols=function(x)
{for (i in x)
{
  print(mean(i))
}
}
mean_of_all_cols(iris[-5])      #negative unsign why?

#OR function
mean(iris$Sepal.Length)
mean(iris$Sepal.Width)
mean(iris$Petal.Length)
mean(iris$Petal.Width)

#local variable concept in R
x
rm(x)
x
y
rm(y)
y

func1=function()
  {x=20   #x and y are local variable definedd under function
  y=10
  x+y
  }
func1()

x
y

#gives error x and y are local variable in function so it is not available outside function

#global variable
x=20
func2=function()
{
  y=20
  x+y
}


func2()
x
y

x=20
y=20
func3=function()
{
  x=10
  y=10
  x+y
}
func3()
x
y
x+y


#another way of finding mean
a=((iris$Sepal.Length)-min(iris$Sepal.Length))/(max(iris$Sepal.Length)-min(iris$Sepal.Length))
View(a)
b=((iris$Sepal.Width)-min(iris$Sepal.Width))/(max(iris$Sepal.Width)-min(iris$Sepal.Width))
View(b)
c=((iris$Petal.Length)-min(iris$Petal.Length))/(max(iris$Petal.Length)-min(iris$Petal.Length))
View(c)
d=((iris$Petal.Width)-min(iris$Petal.Width))/(max(iris$Petal.Width)-min(iris$Petal.Width))
View(d)





#normalize function in R


normalize=function(x)
{
  (x-range(x)[1])/(max(x)-min(x))
}                                              
q=normalize(iris$Sepal.Length)
View(q)

range(iris$Sepal.Length) # it gives min and max value of sepal length
max(iris$Sepal.Length)
min(iris$Sepal.Length)
range(iris$Sepal.Length)[1] 
range(iris$Sepal.Length)[2] 

install.packages("purrr")
#map_dbl function in R language
View(mtcars)
install.packages("tidyverse") #no need to install purrr if you install tidyverse package tidyverse having dependency of purrr

library(purrr)
map_dbl(mtcars,mean)
map_dbl(mtcars,max)
map_dbl(mtcars,min)
map_dbl(mtcars,sum)
map_dbl(mtcars,sd)

#invoke map
invoke_map(list(min_Sepal_Length="min",max_Sepal_width="max"),list(iris$Sepal.Length,iris$Sepal.Width))

