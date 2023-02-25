fun1<-function(x)
{
  ifelse(x>0, "Non-negative number", "Negative number")
}
  
fun1(1)
fun1(-2)
  
fun2<-function(a,b,c)
{
  D=b^2 - 4*a*c
  x1<-(-b+sqrt(D))/(2*a)
  x2<-(-b-sqrt(D))/(2*a)
  list(root1=x1,root2=x2)
  ifelse(D>=0, list(x1,x2),"no results avaible")
}
fun2(-8,6,4)  
fun2(1,1,1)

fun3<-function(x)
{
  a=min(x)
  b=median(x)
  c=max(x)
  d=mean(x)
  e=sd(x)
  f=length(x)
  result = list(a,b,c,d,e,f)
  return

}
c=(25:80)
fun3(c)

##equat<-function(a,b,c)
#{
 # delta<-b^2-4*a*c
  #x1<-(-b+sqrt(delta))/(2*a)
  #x2<-(-b-sqrt(delta))/(2*a)
  #print(x1)
  #print(x2)
  #x<-seq(x1,x2,0.01)
  #y<-a*x^2+b*x+c
  #plot(x,y,type="1",axes=FALSE)
  #axis(1,pos=(0,0))
  #axis(2,pos=c(0,0))
  
#}
##
?plot

setwd("~/Documents/R lecture")

