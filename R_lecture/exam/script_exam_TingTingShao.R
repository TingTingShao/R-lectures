#TingTing Shao
library(dplyr)
library(readxl)
animals <- read_excel("Documents/R_lecture/exam/animals.xlsx")
head(animals)
names(animals)
#1.1
Max_age<-ifelse(animals$Max_age==-999, NA, animals$Max_age)
head(Max_age)
gestation<-ifelse(animals$gestation==-999, NA, animals$gestation)
animals2<-animals%>%select(1:6)%>%mutate(Max_age, gestation)
head(animals2)
#1.2
nrow(animals)
model1<-lm(animals$gestation~animals$Max_age)
cof<-coefficients(model1)
cof
original<-c(cof[[1]], cof[[2]])
original
#1.3
sub1<-sample_n(animals2, 30)
model2<-lm(sub1$gestation~sub1$Max_age)
cof1<-coefficients(model2)
cof1
regres_coeff<-data.frame(a=cof1[[1]], b=cof1[[2]])
regres_coeff
#1.4
mat<-matrix(rep(0, 100), ncol=2)
for(i in 1:50)
{
  sub<-sample_n(animals2, 30)
  model<-lm(sub$gestation~sub$Max_age)
  cof<-coefficients(model)
  a<-cof[[1]]
  b<-cof[[2]]
  mat[i, ]<-c(a, b)
  i=i+1
}
head(mat)
regres_coeff<-data.frame(mat)
dimnames(regres_coeff)<-list(1:50, c("a","b"))
head(regres_coeff)
#1.5.a
library(ggplot2)
pla<-ggplot(regres_coeff, aes(a))+geom_histogram(color="black", fill="green")
pla
plb<-ggplot(regres_coeff, aes(b))+geom_histogram(color="black", fill="green")
plb
library(ggpubr)
ggarrange(pla, plb, ncol=2, nrow=1)
#1.5.b
pla1<-pla+geom_vline(xintercept = original[1], color="red")
plb1<-plb+geom_vline(xintercept = original[2], color="red")
ggarrange(pla1, plb1, ncol=2, nrow=1)
#1.6
regres.f<-function(n, it)
{
  mat<-matrix(rep(0, it*2), ncol=2)
  for(i in 1:it)
  {
    sub<-sample_n(animals2, n)
    model<-lm(sub$gestation~sub$Max_age)
    cof<-coefficients(model)
    a<-cof[[1]]
    b<-cof[[2]]
    mat[i, ]<-c(a, b)
    i=i+1
  }
  regres_coeff<-data.frame(mat)
  regres_coeff<-data.frame(mat)
  dimnames(regres_coeff)<-list(1:it, c("a","b"))
  pla<-ggplot(regres_coeff, aes(a))+geom_histogram(color="black", fill="green")+
    geom_vline(xintercept = original[1], color="red")
  plb<-ggplot(regres_coeff, aes(b))+geom_histogram(color="black", fill="green")+
    geom_vline(xintercept = original[2], color="red")
  ggarrange(pla, plb, ncol=2, nrow=1)
}
regres.f(40, 500)
#1.7
#1.7.a
pl1<-ggplot(animals, aes(x=Max_age, y=gestation))+geom_point(color="blue")+ theme_bw()+
  xlim(0,100)+ylim(0, 600)
pl1
#1.7.b
pl2<-pl1+geom_smooth(method = "lm", se=F, color="red")
pl2
#1.7.a
for(i in 1:50) {
  a <- regres_coeff[i, 1]
  b <- regres_coeff[i, 2]
  pl2 <- pl2 + geom_abline(intercept = a, slope = b, color = "black", size = 0.5)
  i=i+1
}
pl2














