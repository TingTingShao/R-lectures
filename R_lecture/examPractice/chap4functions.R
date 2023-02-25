#step1 make and check the body of your function
a<-3
b<-4
c<-sqrt(a^2+b^2)
c
#step2 if the body of the function is ok, generalie it
pythagoras<-function(a, b)
{
  c<-sqrt(a^2+b^2)
  print(a)
  print(b)
  c
}
pythagoras(3, 4)
#apply
floor(-3.526)
ceiling(-3.526)
floor(4.2)
ceiling(4.2)
pmax(c(1,7,3), c(3,4,5))
sd(c(1,7,3))
#3.1
description<-function(vec)
{
  list(vec=vec, max=max(vec), min=min(vec), median=median(vec), 
       mean=mean(vec), sd=sd(vec), length=length(vec))
}
description(25:80)
#3.2
fun1<-function(x)
{
  ifelse(x<0, "negative number", "Non-negative number")
}
fun1(9)
fun1(-13)
#3.3
fun2<-function(a,b,c)
{
  D=b^2-4*a*c
  if(D<0){
    print("no results")
  }else{
  d=sqrt(D)
  print(d)
  x1=(-b+d)/(2*a)
  x2=(-b-d)/(2*a)
  print(x1)
  print(x2)
  }
}
fun2(8, 6, 4)













