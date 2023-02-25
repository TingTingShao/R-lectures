library(qcc)
data(boiler)
head(boiler)
#apply function
nrow(boiler)
ln_boiler<-apply(boiler, 1, log)
head(ln_boiler) 
ln<-apply(boiler, c(1,2), log)
ln
mean_per_row<-apply(boiler, 1, mean)
mean_per_col<-apply(boiler, 2, mean)
#tapply function
library(reshape)
tapply(tips$tip, tips$day, mean)
list(tips$day, tips$time)
library(ggplot2)
tips<-remove_missing(tips, na.rm=T)
head(tips)
sum(is.na(tips$tip))
tapply(tips$tip, list(tips$day, tips$time), mean)
vector<-tips$tip
index<-factor(tips$day)
tapply(vector, index, mean)
#lapply
#work on list
list_tip<-split(tips$tip, tips$day)
list_tip
lapply(list_tip, mean)
#loop
head(tips)
sum_even<-0
for(val in tips$size){
  if (val%%2 == 0) 
    sum_even=sum_even+1
  sum_even
}
sum_even
total<-tips$total_bill+tips$tip
total
cbind(tips, total)
tips$total<-o
for(i in 1:length(tips$total_bill)){
  tips$total[i] <- tips$total_bill[i] + tips$tip[i]
}
head(tips)
#while loop
i<-1
while (i<6) {
  i=i+1
  print(i)
}
i<-1
while (i<6) {
  i=i+1
  if (i==4) break
  print(i)
}
i<-1
while (i<6) {
  i=i+1
  if (i==4) next
  print(i)
}
#repeat
i<-1
repeat{
  print(i)
  i=i+1
  if(i==6){break}
}
#if else statement
#functions
fn<-function(vec)
{
  for(i in 3:length(vec))
  {
    x[i] <- (vec[i-2]+vec[i-1]+vec[i])/3
    print(x[i])
  }
}
v<-1:10
c(1:5)
fn(v)
#step1
vec1<-rexp(30, 3)
#step2
mat<-matrix(rep(0, 150), nrow = 5)
for (i in 1:5){
  mat[i,]<-rexp(30,3)
  i=i+1
}
#step3
all.sample.mean<-apply(mat, 1, mean)
#step4
par(mfrow=c(1,2))
hist(vec)
hist(all.sample.mean, probability = T)
lines(density(all.sample.mean))
#step5
fn<-function(n, rpt)
{
  m<-n*rpt
  mat<-matrix(1:m, nrow = rpt)
  for (i in 1:rpt){
    mat[i, ]<-rexp(n, 3)
  }
  avg<-apply(mat, 1, mean)
  hist(avg, prob = T)
  lines(density(avg))
}
fn(n=30, rpt=500)
#reuse tidyverse code
library(rlang)
group_mean<-function(data, var, by){
  data %>%
    group_by({{by}})%>%
    summarise(
      avg=mean({{var}}, na.rm=T)
    )%>%
    arrange(avg)
}
group_mean(tips, tip, day)
#dates
library(lubridate)
library(nycflights13)
library(ggplot2)
today()
flights_date<-flights%>%
  select(year, month, day)%>%
  mutate(dep_date=make_date(year, month, day))
head(flights_date)
#spreading gathering
#pivot longer
head(table4a)
table_long<-pivot_longer(table4a, 2:3, names_to = "year", values_to = "cases")
table_long
#pivot wider
head(table2)
table_wider<-pivot_wider(table2, id_cols=1, names_from = c(year, type), values_from = count)
head(table_wider)

#7.1
fn<-function(n){
  i<-1
  while (i <= n) {
    join=paste("nr", i, sep = " ")
    print(join)
    i=i+1
  }
}
fn(5)
#7.2
fn=function(n){
  i<-1
  sum<-0
  while (i<=n) {
    sum=sum+i
    i=i+1
  }
  print(sum)
}
fn(5)
#7.3
i<-1
while (i<=5) {
  m = rep(i, i)
  print(m)
  i=i+1
}
#7.4
library(tidyr)
head(billboard)
names(billboard)
nrow(billboard)
#7.4.1.a
billboard_date<-billboard%>%
  mutate(Year=year(date.entered), Month=month(date.entered), Day_nr=mday(date.entered))%>%
  select(artist, wk1, wk2, wk3, wk4, Year, Month, Day_nr)
head(billboard_date)
#7.4.1.b
b_billboard<-pivot_longer(billboard_date, 2:5, names_to = "Week", values_to = "Rank" )
head(b_billboard)
#7.4.2
library(tidyr)
head(us_rent_income)
new<-pivot_wider(us_rent_income, id_cols = NULL, names_from = "variable", 
                 values_from = c("estimate", "moe"))
head(new)
names(new)
#7.5
library(qcc)
names(boiler)
head(boiler)
boiler
#7.5.a
x<-boiler$t1
n<-length(x)
n
mr<-rep(NA, n)
mr
for (i in 2:n)
{
  mr[i]<-abs(x[i]-x[i-1])
}
time<-1:nrow(boiler)
time
total<-data.frame(time, x, mr)
head(total)
#7.5.b
avgmr<-mean(total[1:20, ]$mr, na.rm=T)
avgmr
avgx<-mean(total[1:20, ]$x, na.rm = T)
avgx
#7.5.c
LCL0<-0
UCL0<-avgmr*3.267
LCL<-avgx-2.66*avgmr
UCL<-avgx+2.66*avgmr
LCL
UCL
#7.5.d
par(mfrow=c(1,2))
x<-total[2:nrow(total), ]$time
y<-total[2:nrow(total), ]$mr
plot(x, y, type="b", xlab="time", ylab="mr", main="moving range chart")
abline(h=avgmr, col=2)
abline(h=0, col=2)
abline(h=UCL0, col=2)
y1<-total$x
x1<-total$time
plot(x1, y1, type="b", xlab="time", ylab="x", main="individual chart", ylim=c(500,550))
abline(h=avgx, col=2)
abline(h=LCL, col=2)
abline(h=UCL, col=2)
#7.6.1
y<-seq(from=1, to=3, by=(3-1)/99)
y<-jitter(y)
n<-length(y)
y
#7.6.2
for(i in 5:n)
{
  roll.mean[i]=(y[i-4]+y[i-3]+y[i-2]+y[i-1]+y[i])/5
  i=i+1
}
roll.mean<-roll.mean[-(1:4)]
roll.mean
#7.6.3
plot(roll.mean)
#7.6.4
fn<-function(consec, y)
{
  for(i in consec:n)
  {
    roll.mean[i]=(y[i-4]+y[i-3]+y[i-2]+y[i-1]+y[i])/5
    i=i+1
  }
  roll.mean<-roll.mean[-(1:(consec-1))]
  plot(roll.mean)
}
#7.6.5
fn(5, y)








