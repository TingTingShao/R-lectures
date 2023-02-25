ls() #list all objects in the current workspace
vec <- c(5, 8, 4.6, 21) #vector creation: c
vec #see the content of that vector
(vec <-c(5,8,4.6,21)) #see the content of that vector
length(vec)
sum(vec)

vec<-c(5, 8, 4.6, 21)
vec
x<-rnorm(10)N
x
z<-order(x)
z
m<-sort(x) #####sequals to sort(x, decreasing = FALSE)
m
rev(m)

y<-c(1, 3, 8, 3, 7, 21)
unique(y)

diff(y, lag=2)
diff(y, lag=3)

##create vectors
y<-1:8
y
y<-seq(from=1, to=50, by= 2)
y
u<-rep(1:3, 2)
u

z<-rep(1:3, 1:3)
z

##logical vectors

x<-c(9, 10, 8, 5, 9)
y<-unique(x)
z<-y<9
z

##character vectors

test<-c('leuven statistic research centre', '2021-2022')
test
x<-nchar(test)
x
y<-paste(c('x','y'), (1:5), sep=(' '))
y
substring(test, 1, 5)

##missing values

y<-c(1, 2, 3, NA)
is.na(y)

x<-c(5, 3, 8, NA, 6)
y<-x>5
y
is.na(y)
##subset of a vector
y<-c(33, 55, 4, 22, 89)
y[c(2,3)]
y[-5]
y[y>30]
x<-c(5, 9, NA)
x[!is.na(x)]

y<-c(33, 55, 2, 44, 89)
attributes(y)
names(y)<-1:5
y

##factors

directions<-c('north', 'east', 'south','south')
directions.f<-as.factor(directions)
directions.f

##create a factor with labels

status<-factor(c('medium', 'low','high','medium','medium','high'),
               levels=c('low','medium','high'),
               labels=c('lo', 'me','hi')
               )
status
##crate a matrix
x<-matrix(1:25, nrow=5, ncol=5, byrow=FALSE)

attributes(tips)

attributes(x)

##rbind 
############################??????????
x<-rbind(1:4, 5:9)
x

y<-cbind(1:3, 5:7)
y

x<-rbind(1:5, 5:10)
attributes(x)
dimnames(x)<-list(paste(1:2), paste(LETTERS[1:6]))
x
x<-matrix(1:4, nrow=2)
x
nrow(x)
ncol(x)
x+x
x*x
x/x
x^2
x%*%x
employee<-c('john', 'peter', 'sylvie')
salary<-c(2100, 23400, 26800)
employ.df<-data.frame(employee, salary)
employ.df
new.df<-data.frame(employee='katrien', salary=2500)
employ2<-rbind(employ.df, new.df)
employ2

age<-c(40, 23, 31, NA)
employ3<-cbind(employ2, age)
employ3






####################
prod(vec) 
max(vec)
min(vec)
sort(vec)
rev(vec)
diff(vec,lag=2)
unique(vec)
order(vec)
##generating vectors
y <- 1:8
y
x <-1:20
x
z<- seq(from = -2, to = 5, by = 0.5)
z
u <- rep(2:5, 2)
u
x <- c(9, 10, 8, 5, 9) # numerical vector 
y <- x<9 # logical vector 
y

r<-rnorm(100)
y<-r>0
y
sum (y)
##character vectors
test <- c("leuven statictis research centre", "2022-2023")
test
x<-c("tingting","chengping")
nchar(x)

paste(c("x","y"), 1:4, sep="")
##missing values
y <- c(1,2,3, NA) 
is.na(y)
##subset of  vector
y <- c(33, 55, 4, 22, 89) 
y[c(2,3)]
y[-5]
y[y>50]

x<-c(5,8,NA)
y<-x[!is.na(x)]
y
y<-c(33,12,43,64)
names(y)<- 1:4
y
##factors
directions <- c("North", "East", "South", "South") # This is a character vector
directions.f<-s.factor(directions) #this is a factor
##matrix
x <- matrix(1:8, nrow = 2, ncol = 4, byrow = FALSE) 
x
x <- matrix(1:8, nrow = 2, ncol = 4, byrow=TRUE) 
x
x <- matrix(1:4, nrow = 2)
x+x
x*x
x%*%x
##data frame columns of different data types
employee <- c("John", "Peter", "Sylvie")
salary <- c(21000, 23400, 26800)
(employ.df<-data.frame(employee,salary))

##adding a new row by rbind function
new.df<-data.frame(employee="tingting", salary = 5000)
employ2.df <-rbind(employ.df, new.df)
employ2.df
##adding a new column by cbind function
age<-c(40, 23, 31, NA)
employ3<-cbind(employ2.df, age)
employ3
##create a data frame by using merge function
authors<-data.frame(
  surname = I(c("Turkey", "Venables", "Tierney", "Ripley", "Mcneil")),
  nationality =c("US", "Australia", "US", "UK", "Australia"),
  deceased=c("yes", rep("NO", 4))
)
authors

books<-data.frame(
  name = I(c("Tukey", "Venables", "Tierney", "Ripley","Ripley", "Mcneil", "R Core")),
  title=c("exploratory data analysis",
          "modern applied statistics",
          "lisp-stat",
          "spatial statistics",
          "stochastic simulation",
          "interactive data analysis",
          "an introduction to R"),
  other.authors = c("NA", "ripley", rep("NA", 4), "Venable & smith")
)
books

m1<-merge(authors, books, by.x= "surname", by.y="name")
m1

m2<-merge(books, authors, by.x="name", by.y="surname")
m2

##taking a subset from a data frame
sub1<- authors[1:3, 1:2]
sub1
##taking a subset from a data frame like a list
sub2<-authors$nationality
sub2


##airquality data
library(doBy)
head(airquality)
sort_air <- orderBy(~Month+Temp, data=airquality)
head(sort_air)
sort_air <- orderBy(~ -Month+Temp, data=airquality)
head(sort_air)
sort_air <- orderBy(~ -Month-Temp, data=airquality)
head(sort_air)

##list can contain elements of different data types
employee<-c("John", "Peter", "Sylvie")
salary<- c(21000, 23400, 26800)
employ.df<-data.frame(employee, salary)
y<-LETTERS[1:5]
z<-1:3
list1<- list(employ.df, y, z)
list1
list1[[1]]
attributes(list1)


mixlist <- list(logia = c(T, T, T, F),
                plant = c("tree", "bush", "grass"),
                coment = "these components are not related"
)

mixlist
attributes(mixlist)
mixlist$plant




mixlist <- list(logica = c(T, T, T, F),
                plant = c("tree", "bush", "grass"),
                comment = "these components are unrelated")
mixlist
mixlist$plant

##exercise 6.1
test1<-c(1.5, 0.7, 45.6)
y1<-seq(from=1, to=10, by=1)
y1
y2<-c(y1>5)
y2
sum(y2)

x<-seq(from=1, to=100, by=1)
y<-seq(from=0, to=500, by=5)
z1<-rep(1:50, times=1, each = 3)
z1
z3<-rep(1:50, c(1:50))
z3

mat1<- matrix(data=rnorm(100), nrow=10, ncol=10)
mat1

mat2<- rbind(1:10, mat1)
mat2

mat3<- rbind(mat2, 10:1)
mat3

mat4<-cbind(1:12, mat3)
mat4

##6.4
library(reshape)
library(dplyr)
head(tips)
attributes(tips)
names(tips)

subset_tips<-tips[1:20, c("tip", "day", "sex")]
subset_tips


sort(x,decreasing = FALSE)
x
names(airquality)
head(airquality)
sort_air<-orderBy(~Month + Temp, data = airquality)
head(sort_air)

Pythagoras<-function(a,b)
{
  c<-sqrt(a^2 + b^2)
  print(a)
  print(b)
  c
}

Pythagoras(1,4)


