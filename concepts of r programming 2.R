#relational operators

v1=c(23,54,60,89)
v2=c(34,56,60,81)
v1
v2
v1==v2       #check if two objects are equaal   #gives output in logical
v1<-v2         #assign values
v1
v2
v1==v2        
v1            
v2
v1>v2    #gives output in logical
v1<v2   #gives output in logical
v1>=v2
v1<=v2
class(v1)
class(v2)
class(v1==v2)
class(v1>v2)


#logical operators

#1. AND (&) operator

v1=T
v1
v2    
rm(v2)           #to remove the existing object    
v2               #it gives error 

v2=(2<4)         #assigns logical value
class(v2)
v2

v3=v1&v2
v3
class(v3)

v4=(4<3)
v4

v5=v3&v4
v5


#2. OR (|) operator

v1= F
v1
v2=(2<4)
v2

v3=v1|v2
v3
v4=(4>3)
v4
v5=v4|v3
v5

# 3.negate ! operator

v1<-(!(4>5)|!(F))
v1
v1<-(!(4>5)&(F))
v1


#condition and looping in r programming

#1 if condition

sub1=123
sub2=80
sub3=75
passmin=150
totalmarks=sub1+sub2+sub3
totalmarks
if(totalmarks>passmin)
{
  "you have passed exam"
}  


#2 with else condition
sub1=59
sub2=40
sub3=45
passmin=150
..totalmarks=sub1+sub2+sub3
.totalmarks
if(totalmarks>passmin)
{
  "you have passed exam"
}else
{
  additionalmarks=passmin-totalmarks
  v1='you have not passed the exam'
  v2= "additional marks required"
  print(v1)
  print(v2)
  print(additionalmarks)
}


#multiple level of if then else condition

totalmarks=65
if(totalmarks>80)
{
  "excellent"
}else if(totalmarks>70)
{
  "good"
}else if(totalmarks>60)
{
  "average"
}else
{
  "bad"
}

#while loop statement in R

money_for_shopping=60
i=1
while(money_for_shopping>0)
{
  v1=i
  v2="lets shop for "
  v3="th time"
  v4=paste(v2,v1,v3)    #alag alag ariable sko print karne ke liye
  print(v4)

  i=i+1
  money_for_shopping=money_for_shopping-20
  money_left=money_for_shopping
  v5="money left is = "
  v6= paste(v5,money_left)
  print(v6)                         # simple v6 print ni kar sakte isliye print function lgaynege
}


#for loop
v1=1:10               #seq() function bi lga skte hai
v1
for (e in v1)
{
  if(e==8)
  {
    break
  }
  if(e==4)
  {
    next
  }
  v2=print(e)
  v2
}



#repeated loops

i<-10
repeat
{
  v1="my value is "
  v2=paste(v1,i)
  print(v2)
  if(i>20)
    break
  i=i+1
}


View(mtcars)
?mtcars      #open help
nrow(mtcars)  #total row
ncol(mtcars) #total column
str(mtcars)   #to display total no. of obs with data type


#to get top 6  reocrds from the mt cars
head(mtcars)
View(head(mtcars))


headcount= head(mtcars,20)     
View(headcount)     

#to get last 6  reocrds from the mt cars
tail(mtcars)
View(tail(mtcars))

tailcount= tail(mtcars,2)     
tailcount
View(tailcount)     

sort(mtcars$mpg)                  #by default ascending order
sort(mtcars$mpg,decreasing = T)   #decreasing order


#frequency distribution

table(mtcars$cyl)
prop.table(table(mtcars$cyl))

mean(mtcars$mpg)
sum(mtcars$mpg)
max(mtcars$mpg)
min(mtcars$mpg)


#apply funcion with iris data
#appply function with column

View(iris)
?iris


# bich wala argument
#1. row wise
#2. column wise
apply(iris[1:3],2,mean)     #column wise 


mean(iris$Sepal.Length)
mean(iris$Sepal.Width)
mean(iris$Petal.Length)
mean(iris$Petal.Width)


apply(iris[1:4],1,mean)     

#tapply function (grouping as per species)

tapply(iris$Sepal.Length,iris$Species,mean)
tapply(iris$Sepal.Length,iris$Species,max)
tapply(iris$Sepal.Length,iris$Species,min)
tapply(iris$Sepal.Length,iris$Species,sum)

