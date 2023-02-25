#tingtingshao
library(readxl)
boston <- read_excel("Documents/R_lecture/traiExam/boston2.xlsx")
names(boston)
head(boston)
library(dplyr)
#1.1
head(boston$roomfact)
summary1<-boston%>%group_by(roomfact)%>%
  summarise(
    n=n(),
    Avg=mean(international)
  )
summary1
write.table(summary1, file="/Users/shaotingting/Documents/R_lecture/examPractice/summary1.txt", sep=" ", 
            row.names = 1:3, col.names = c("roomfact", "n", "Avg"))
#1.2
n<-nrow(boston)
mean<-mean(boston$international)
Avg<-rep(mean, n)
diff<-boston$international-Avg
boston_new<-data.frame(Avg, diff, boston)
new<-select(boston_new, c("roomfact","Avg","international","diff", "crimcat"))
head(new)
boston_center2<-arrange(new, -(diff))
head(boston_center2)
#1.3
library(ggplot2)
ggplot(boston_center2, aes(y=diff, x= factor(roomfact)))+geom_boxplot()+
  geom_abline(yintercept = 0, color="green")
#1.4
regres.f<-function(resp, expl)
{
  res.lm<-lm({{resp}}~{{expl}})
  res<-summary(res.lm)
  list<-list(
    int=c(res$coefficients[1]),
    slope=c(res$coefficients[2]),
    r_square=c(res$r.squared)
  )
  list
}
regres.f(boston$dis, boston$zn)
#1.5
low<-boston[boston$roomfact=="low", ]$dis
head(low)
medium<-boston[boston$roomfact=="medium", ]$dis
head(medium)
high<-boston[boston$roomfact=="high", ]$dis
head(high)
l<-regres.f(low, boston[boston$roomfact=="low", ]$zn)
m<-regres.f(medium, boston[boston$roomfact=="medium", ]$zn)
h<-regres.f(high, boston[boston$roomfact=="high", ]$zn)
intercept<-c(l$int, m$int, h$int)
slope<-c(l$slope, m$slope, h$slope)
rsquare<-c(l$r_square, l$r_square, h$r_square)
df1<-data.frame(roomfact=unique(boston$roomfact))
df1<-cbind(df1, intercept, slope, rsquare)
df1





