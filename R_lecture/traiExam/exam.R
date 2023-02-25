#Tingting Shao
library(ggplot2)
data(diamonds)
names(diamonds)
head(diamonds)
#1.a
diamond_small<-diamonds[1:5000, ]
#1.b
cut<-unique(diamond_small$cut)
cut_new<-ifelse(diamond_small$cut=="Ideal"|diamond_small$cut=="Premium", "Above average",
                ifelse(diamond_small$cut=="Very Good", "Very Good", 
                       ifelse(diamond_small$cut=="Good"| diamond_small$cut=="Fair", "Below average", "Belwo average")))
cut_new
#1.c
diamonds_2<-select(diamond_small, c("carat", "color", "clarity", "price"))
diamonds_2<-cbind(diamonds_2, cut_new)
head(diamonds_2)
#1.d
pwd()
write.table(diamonds_2, file="/Users/shaotingting/Documents/R_lecture/examPractice/diamonds.txt", sep=" ")
#2.a
result<-diamonds_2%>%group_by(color, cut_new)%>%
  summarise(
    price.m=mean(price)
  )
tapply(diamonds_2$price, list(diamonds_2$color, diamonds_2$cut_new), mean)
result
#2.b
combined_data <- diamonds_2 %>% left_join(result, by = c("color","cut_new"))
combine<-select(combined_data, c("color", "cut_new", "price", "price.m"))
head(combine, n=50)
#2.c
pl1<-ggplot(result, aes(y=price.m, x=factor(color)))+geom_boxplot(color="green", fill="green", alpha=0.5)
pl2<-pl1+stat_summary(fun.data="mean_cl_normal", color="red", size=0.3)
pl2
#3
fun1<-function(n)
{
  ifelse(n<0, "Negative number", "Non-negative number")
}
fun1(9)
fun1(-13)







