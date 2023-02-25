#tingting shao
#1.a
x1<-pi/6
series_sin<-c(x1)
series_sin
#1.b
x2<-x1-x^3/(3*2*1)
x2
x3<-x2+x^5/(5*4*3*2) 
x3
series_sin<-c(x1, x2, x3)
series_sin
#1.c
fun_sin <- function(n, x) {
  result <- 0
  for(i in 1:n){
    if(n==1){
      result <- x
    }else{
      vec <- 1:(2*i-1)
      res <- prod(vec)
      y <- (x^(2*i-1))/res 
      result <- result + ((-1)^(i+1))*y
    }
  }
  result
}
fun_sin(3, x1)
#
fun_sin(3, pi/6)
fun_sin(6, pi/4)

#2
library(readxl)
business<- read_excel("Documents/R_lecture/traiExam/business(1).xlsx")
names(business)
head(business)
#2.a
sum(is.na(business$business_status))
sum(is.na(business$sex))
#2.b
library(dplyr)
#business_status<-ifelse(business$business_status==4, NA, business$business_status)
sub1<-mutate(business, business_status=ifelse(business$business_status==4, NA, business$business_status))
sum(is.na(sub1$business_status))
#2.c
sub2<-filter(sub1, neoconsc>30)
sub2
sum(sub2$neoconsc<=30)
#2.d
library(ggplot2)
ggplot(sub2, aes(x=neoopen, y=neoconsc, color=factor(business_status)))+geom_point()
#2.e
result<-business%>%mutate(business_status=ifelse(business$business_status==4, NA, business$business_status))%>%
  filter(neoconsc>30)%>%
  ggplot(aes(x=neoopen, y=neoconsc, color=factor(business_status)))+geom_point()
result
#2.f
df<-remove_missing(sub2, na.rm=T)
plot1<-ggplot(df, aes(x=neoopen, y=neoconsc, color=factor(business_status)))+geom_point()
plot1
#2.g
install.packages("ggExtra")
library(ggExtra)
ggMarginal(plot1, type="boxplot")































