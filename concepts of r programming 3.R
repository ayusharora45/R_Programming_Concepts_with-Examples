install.packages("R6")
library(R6)


#object generator in R
fruit= R6Class("fruit",private = list(name="apple",cost=100))
class(fruit)


apple1=fruit$new()    
apple1

#object genertor Assigning function as a  R object

employee_generator <- R6Class("employee",
                              private=list(name=NA,designation=NA),
                              public=list(set_name=function(x){private$name=x},
                                set_designation=function(x){private$designation=x}
                              )
                              )

class(employee_generator)
employee1=employee_generator$new()
employee1

employee1$set_name("ayush")
employee1$set_designation("student")
employee1

class(employee1)
employee2=employee_generator$new()
employee2

employee2$set_name("kritika")
employee2$set_designation("leader of pagal")
employee2


fruit_generator=R6Class("fruit",
                        private=list(name=NA,cost=NA),
                        public = list(set_name=function(x){private$name=x },
                                      set_cost=function(x){private$cost=x}
                                      ))

apple<-fruit_generator$new()
apple
apple$set_cost(100)
apple$set_name("seb")
apple

banana<-fruit_generator$new()
banana
banana$set_cost(20)
banana$set_name("kela")
banana


#working with initialize() function in R programing
#initialize function

food=R6Class("food",
             private=list(name=NA,cost=NA),
             public=list(
               initialize=function(x,y){
                 private$name=x
                 private$cost=y}
             ))

pizza=food$new("pizza",500)
pizza
salad=food$new("salad",200)
salad


#initialize multiple values

marks_generator<-R6Class("marks",
                         private = list(name=NA,marks=NA),
                         public = list(
                           initialize=function(x,y){
                             private$name=x
                             private$marks=y
                           }
                         ))
marks_generator
marks=marks_generator$new(c("ayush","kritka","shorya","gaurav","prateek"),c(70,89,32,45,18))
marks


#initialize multiple values more than 2 (variable)

student_generator=R6Class("student",
                          private = list(name=NA,branch=NA,CGPA=NA,placement=NA),
                          public = list(initialize=function(w,x,y,z)
                            {
                            private$name=w
                            private$branch=x
                            private$CGPA=y
                            private$placement=z
                            
                          }))


student<- student_generator$new(c("ayush","kritka","shorya","gaurav","prateek"),c("me","ee","ec","cse","ce"),c(70,89,32,45,18),c(T,F,T,T,F))
student



#active binding in R

fruit_generator=R6Class("fruit",
                        private = list(..name=NA,..cost=NA),
                        active=list(name=function(x){private$..name=x},
                                    cost=function(x){private$..cost=x}
                                    ))
fruit_generator

fruit1=fruit_generator$new()
fruit1
fruit1$name="apple"
fruit1$cost=100
fruit1


fruit2=fruit_generator$new()
fruit2
fruit2$name="banana"
fruit2$cost=10
fruit2
class(fruit2)

class(fruit)



#inheritance..........!!!!!

#parentclass vehicle generator


vehicle_generator <-  R6Class("vehicle",private = list(hp=NA,mpg=NA),
                              public = list(set_hp=function(x){private$hp=x},
                                            set_mpg=function(x){private$mpg=x}
                                            ))
vehicle_generator
v1=vehicle_generator$new()
v1$set_hp(100)
v1$set_mpg(20)
v1
class(v1)

car_generator<-R6Class("car",inherit = vehicle_generator,
                       private = list(tyres=NA,colors=NA),
                       public = list(set_tyres=function(x){private$tyres=x},
                                     set_colors=function(x){private$colors=x}
                                     ))
vehicle_generator
car_generator

c1=car_generator$new()
c1
c1$set_colors("blue")
c1$set_hp(11000)
c1$set_mpg(30)
c1$set_tyres(4)
c1
class(c1)


#grand child

ferari_generator<-R6Class("ferari",inherit=car_generator,
            private = list(cost=NA),
            public = list(set_cost=function(x){private$cost=x}))
ferari_generator
f1=ferari_generator$new()
f1
f1$set_colors("red")
f1$set_cost(15000)
f1$set_hp(140)
f1$set_mpg(20)
f1$set_tyres(5)
f1
