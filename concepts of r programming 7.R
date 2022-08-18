v1="data science in r programing"
v2='data science in r programming'
v1
v2
class(v1)
class(v2)

v1="data science class's about R"
v1
v2="data science class\"s about R"
v2

v3= 'data science "s session about \'r\' is very intresting'
v3

#number into string conversion
x=7.89768653
x
class(x)

v=as.character(x)    #variable ko character me convert karne ke liye
v
class(v)


#use of format function to change the look
x=7.89768653
x
class(x)

format(x,digits=1,scientific=T)   #e ki power me le jayga     1 digit ke sath point inncluded
format(x,digits=1,scientific=F)
format(x,digits=2,scientific = T)
format(x,digits=2,scientific=F)
format(x,digits=5,scientific=T)


#formatc    (point ke bad se digit count karta hai)
formatC(x,format="f",digits=3)    # f means fixed
formatC(x,format="e",digits=2)    # e means scientific

formatC(x,format="g",digits=2)    # g short form of float and g is fixed unless scientific saves space aur g me point include karke count karta hai


#use of paste function
distance_covered=c(70,75,88,80)
day_of_week=c("mon","fri","sat","sun")
expense_raised=c(45,67,89,34)
distance_covered1=paste(distance_covered,"km")
distance_covered1

distance_covered1=paste(distance_covered,"km",sep="")
distance_covered1

#sep tab hi lagega jab 2 variable honge paste function 
day_of_week1=paste(day_of_week,"+",sep="")
day_of_week1

expense_raised1=paste("$",expense_raised,sep="")
expense_raised1

final_vector1=paste(distance_covered1,day_of_week1,expense_raised1)
final_vector1
final_vector1=paste(distance_covered1,day_of_week1,expense_raised1,sep="-")
final_vector1



#working with stringr
install.packages("stringr")
library(stringr)
v1=c(NA,"Abcdef",NA,"ghjkls")
v2=c("89ssds","99ayjd","68765sd","daas55")
v1
v2
v3=paste(v1,v2)   #isme NA ke sath wali value bi aaygi
v4=str_c(v1,v2)   #isme NA ke sath wali value store nai hogi
v3
v4

#another example of string package
v1=c(NA,"india",NA,"america")
v2=c("manhattan","delhi","arizon","newyork")
v1
v2
paste(v1,v2)     #paste function khud space dedeta hai
str_c(v1,v2)      #str_c function space remove ni krta
str_c(v1,"/",v2)

#extract text string
str_sub(v2,1,5)
str_sub(v2,-3,-1)

#pattern in a text string
string_v=c("manhattan","delhi","arizon","newyork")
string_v
str_detect(string_v,pattern = fixed("hi"))    #fixed lgao to bi same nai lgao to bi same output aayga
str_detect(string_v,pattern = "hi")

str_count(string_v,pattern="hi")
str_count(string_v,pattern=fixed("hi"))


#str spilit function 
string_v=c("gu;itar;voilin","samba;salsa;ballet;tango")
string_v
a=str_split(string_v,pattern = ";")       #list bna dega
a
b=str_split(string_v,pattern = ";",simplify = T)    #matrix bna dega
b
class(string_v)
class(a)
class(b)


#string replace
str_replace(string_v,pattern=";",replacement = "&")
str_replace_all(string_v,pattern=";",replacement = " & ")


#working with Tweets.csv file
install.packages("tm")
library(tm)
setwd(choose.dir())
getwd()
tweets_v=read.csv("Tweets4.csv",stringsAsFactors = F)
tweets_v
View(tweets_v)
str(tweets_v)
nrow(tweets_v)
ncol(tweets_v)
class(tweets_v)

#seprating out field that requires text mining
tweets_v2=tweets_v$Tweets
tweets_v2


#vector source will take vector as argument

tweets_for_mining=VectorSource(tweets_v2)
tweets_for_mining
class(tweets_for_mining)
tweets_for_mining[1]


tweets_corpus=VCorpus(tweets_for_mining)

#to convert vector source to plain text
print(tweets_corpus)
class(tweets_corpus)

#cleaning functiion with tm packages
v=tm_map(tweets_corpus,tolower)
v[[5]][1]
v=tm_map(tweets_corpus,removePunctuation)
v=tm_map(v,removePunctuation)

v[[5]][1]

tweets_v3<-read.csv("Tweets4.csv",stringsAsFactors = F)
str(tweets_v3)
tweets_v4=tweets_v3$Tweets

tweets_for_mining=VectorSource(tweets_v4)
tweets_corpus2=VCorpus(tweets_for_mining)
v=tm_map(tweets_corpus2,removePunctuation)
v[[1]][1]

#word stemming and stem completion
v7=c("additional","additive","addition")
install.packages("SnowballC")
library(SnowballC)

#perform word stemming:stem_doc

stem_doc=stemDocument(v7)
stem_doc

#create cmpletion dictionary : comp_dict
comp_dict="addition"

#perfrom step completeion : complete_text
complete_text=stemCompletion(stem_doc,comp_dict)

#print complete text
complete_text

v8=c("complicated","complication","complicatedly")
stem_doc=stemDocument(v8)
stem_doc
comp_dict="complicate"
complete_text=stemCompletion(stem_doc,comp_dict)
complete_text

tweets_corpus2[[1]]$content
v1=DocumentTermMatrix(tweets_corpus2)     #document in row term in column
v1

v2=as.matrix(v1)
#checkin the dimension of matrix
dim(v2)
View(v2)
#review a portion of matrix in rows we have documents adn in col its terms or words
v2[13:4,9:5]

v3=TermDocumentMatrix(tweets_corpus2)    #document in column term in row
v3
v4=as.matrix(v3)
#chaeking the dimension of matrix
dim(v4)
v4

#revie a portion of matrix in rows we have documents and in col its terms or words
v4[4:13,5:9]
v4[,9:5]

