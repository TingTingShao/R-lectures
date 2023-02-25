test1<-c(1.5, 0.7, 45.6)
test1
y1<-seq(from=1, to=10, by=1)
y1
##c
y1<-c(3,4,7,9)
y2<-y1>5
y2
##d
sum(y2)
##6.2a
x<-seq(from=1, to=100, by=1)
x
##6.2b
y<-seq(from=0, to=500, by=5)
y
##6.2c
y<-rep(1:50, each=3)
y
##6.2d
y<-rep(1:10,1:10)
y

##6.2e
y<-rep(1:50, rep(1:2,25))
y

##6.3a
vec<-rnorm(100)
vec
mat1<-matrix(vec, nrow=10,ncol=10)
mat1
mat2<-rbind(mat1,c(1:10))
mat2
mat3<- rbind(c(1:10), mat1)
mat3
mat4<-cbind(c(1:12),mat3)
mat4
tips<-data.frame(
  tips_in_dollars=I(c(10,12,1,2)),
  bills_in_dollars=(c(58,30,90,75)),
  sex=(c("F","M","F","M")),
  smokers=(c("Y","Y","N","N")),
  day_of_the_week=(c("wed","sat","sat","sun")),
  time_of_the_day=(c("eve","mor","aft","eve")),
  size_of_the_party=(c(3,4,2,7))
  
)

tips
head(tips)
names(tips)








