vec<-c(5,8,4.6,21)
vec
x<-rnorm(10)
x
order(x)
x[1]
x[2]
sort(x)
rev(sort(x))
sort(x, decreasing = TRUE)
y<-c(1,2,2,3,3,4)
y
unique(y)
diff(y, lag=2)
sum(y)
min(y)
max(y)
prod(y)
length(y)
sort(x,y)
sum(x, y)
max(x,y)
min(x,y)
#generate vector
y <- 1:8
y
x <- 20:1
x
z <- seq(from = -2, to = 5, by = 0.5)
z
rep(1:4, 2)
rep(1:4, each=2)
rep(1:4, c(2,2,2,2))
rep(1:4, c(2,1,2,1))
rep(1:4, each=2, length.out=4)
rep(1:4, each=2, length.out=10)
rep(1:4, each=2, times=3)
rep(1:4, 1:4)
sum(rep(1:4, 1:4))
#logical vectors
x<-c(9,10,8,5,9)
y<-x<8
y
y<-ifelse(x>8, 1, 0)
y
sum(y)
x<-rnorm(100)
y<-ifelse(x>0, 1, 0)
sum(y)
y<-x>0
sum(y)
#character vector operations
x<-c("start","student")
nchar(x)
#concatenate two vectors as string
paste(c("x","y","z"), c("height","width","weight"), sep=" ")
#coercing
vec<-c(TRUE, 6.05, "leuven")
vec
#missing values
y<-c(1,2,3,NA)
sum(y, na.rm=T)
is.na(y)
y[1]
y[c(!is.na(y))]
y[1:3]
z<-c(1, NA, 3, 5, 1, 2)
y<-c(sort(z))
y
#give names to elements of a vector
y<-c(33, 55, 4)
names(y)<-c("No1", "No2", "No3")
y
#factors
y<-1:6
as.factor(y)
y
status<-c("Medium", "Low", "High", "Medium", "Medium", "High")
status
as.factor(status)
as.array(status)
as.data.frame(status)
#matrices
x<-matrix(1:8,nrow = 2, ncol = 4)
x
attributes(x)
x<-rbind(1:4, 5:8)
x
x<-cbind(1:4, 5:8)
x
dimnames(x)<-list(paste("row", 1:4), paste("col", 1:2))
dimnames(x)<-list(1:4,c("name", "sex"))
x
nrow(x)
x<-list(1:5,2:3)
x[2]
x<-matrix(1:4, nrow = 2)
x*x
x/x
x%*%x
#data frame
employee<-c("John", "Peter", "Sylvie")
salary<-c(2100, 23400, 26800)
emp.df<-data.frame(employee, salary)
age<-c(24, 34, 32)
data.frame(emp.df, age)
emp1.df<-cbind(emp.df, age)
emp1.df
new<-c("Katrien", 25000, 30)
emp2.df<-rbind(emp1.df, new)
emp2.df
#create a dataframe
authors<-data.frame(
  surname=I(c("Tukey", "venables", "tierney")),
  nationality=c("US", "UK", "Belgium"),
  deceased=c("yes", rep("no", 2))
)
books<-data.frame(
  name=I(c("Tukey", "venables", "tierney")),
  title=c("database", "statistics", "linear algebra"),
  other.author=c(NA, "Riley", NA)
)
m1<-merge(authors, books, by.x = "surname", by.y="name")
m1
#taking a subset from a dataframe like a matrix
sub1<-authors[, 1:2]
sub1
#taking a subset from a datafram like a list
sub2<-authors$surname
sub2
library(doBy)
head(airquality)
sort.air<-orderBy(~Month+Temp, data=airquality)
head(sort.air)
#create a list
#a list can contain different data types
y<-letters[1:5]
z<-1:3
list1<-list(emp.df, y, z)
#named list
mislist<-list(
  logica = c(T, T, F),
  plant=c("tree", "grass", "flower"),
  comment="this is not relavant"
)
attributes(mislist)
mislist
mislist$logica
mislist[[1]]
mislist[1]
#6.1 vector
#6.1.a
test1<-c(1.5, 0.7, 45.6)
test1
#6.1.b
y1<-1:10
y1
#6.1.c
y2<-y1>5
y2
#6.1.d
sum(y2)
#6.2.a
x<-1:100
#6.2.b
y<-seq(from=0, to=500, by=5)
y<-seq(from=0, to=10, by=2)
y
#6.2.c
z1<-rep(1:50, each=3)
z1
#6.2.d
z2<-rep(1:10, 1:10)
z2
#6.2.e
z3<-rep(1:50, rep(1:2, 25))
z3
#6.3 matrix
#6.3.a
vec<-rnorm(100)
mat<-matrix(vec, nrow=10)
#6.3.b
mat1<-rbind(mat, 1:10)
mat1
mat2<-rbind(1:10, mat1)
mat2
#6.3.c
mat3<-cbind(mat2, 1:12)
mat3
#data frame
library(reshape)
attributes(tips)
nrow(tips)
ncol(tips)
names(tips)
tips[1:20, c("sex", "day")]














