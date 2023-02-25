library(nycflights13)
library(tidyverse)
library(dplyr)
head(flights)
#filter function is to subset a data frame, retaining all rows that satisfy your condition
oct<-filter(flights, month==10, day==1)
nrow(oct)
first<-filter(flights, month==10|day==1)
nrow(first)
filter2<-filter(flights, xor(month==10, day==1))
filter2
nrow(filter2)
#select function, select variables(columns)
select1<-select(flights, year:day, dest)
names(select(flights, c(1:2, 5:6)))
#arrange, missing values are always sorted at the end for logical, numerical, and character variables
sort1<-arrange(select1, year, month, day, desc(dest))
sort1
#mutate
names(flights)
flights_sml<-select(flights, dep_delay, arr_delay, distance, air_time)
flights_sml.extra<-mutate(flights_sml, extra=arr_delay-dep_delay, hours=air_time/60)
flights_sml.extra
#transmute
flights_new2<-transmute(flights_sml, extra=arr_delay-dep_delay, hours=air_time/60)
flights_new2
#summarise
summarise(flights, Avg=mean(dep_delay, na.rm=TRUE))
test<-c(1:10, rep(NA, 2))
test
mean(test)
mean(test, na.rm=TRUE)
sum(is.na(flights$sched_arr_time))
#grouping variable is present
by_date<-group_by(flights, year, month)
head(by_date)
nrow(by_date)
nrow(flights)
by_date1<-group_by(flights, year, month, day)
nrow(by_date1)
summarise(by_date, avgDelay=mean(dep_delay, na.rm=TRUE))
summarise(by_date, flightsNum=n())
fl_group<-flights %>%
  group_by(dest) %>%
  summarise(
    avg=mean(arr_delay, na.rm=TRUE),
    ad=sd(arr_delay, na.rm=TRUE),
    max=max(arr_delay, na.rm=TRUE), 
    count=sum(!is.na(arr_delay))
  )
fl_group
fl_group1<-flights%>%
  group_by(dest)%>%
  summarise(
    count=n(!is.na(arr_delay)),
    prop_long_delay=sum(arr_delay>60, na.rm=TRUE)/count, 
  )
fl_group1
sub1<-filter(fl_group1, count>100)
arrange(sub1, prop_long_delay)
sum_dest_sub1<-flights%>%
  group_by(dest)%>%
  summarise(
    count=n(),
    avgDist=mean(distance, na.rm=TRUE),
    avgDelay=mean(arr_delay, na.rm=TRUE)
  )%>%
  filter(count>20, avgDist<3000)
ggplot(data=sum_dest_sub1, aes(x=avgDist, y=avgDelay))+
  geom_point(size=3)+geom_smooth(se=FALSE, method = "lm")
#6.1.1
library(reshape)
tips.tbl<-as_tibble(tips)
#6.1.2
head(tips.tbl)
sub1<-filter(tips.tbl, sex == "Male" & size>=3)
head(sub1)
#6.1.3.a
sub2<-filter(tips.tbl, sex == "Male" | size>=3 )
sub2
#6.1.3.b
sub3<-filter(sub2, smoker == "No")
sub3
#6.1.3.c
sort1<-arrange(sub3, time, desc(size))
sort1
#6.1.3.d
avgTip<-sort1%>%
  group_by(sex)%>%
  summarise(
    avg=mean(tip)
  )
avgTip
#6.1.3.e
results<-as_tibble(tips)%>%
  filter(sex == "Male" | size>=3 )%>%
  filter(smoker == "No")%>%
  arrange(time, desc(size))%>%
  group_by(sex)%>%
  summarise(
    avg=mean(tip)
  )
results
#6.1.4
head(tips.tbl)
result4<-tips.tbl%>%
  group_by(day)%>%
  summarise(
    mean(tip)
  )
result4
#6.1.5
head(tips.tbl)
result4<-tips.tbl%>%
  group_by(sex, day)%>%
  summarise(
    mean(tip)
  )
result4
#6.2.1
head(tips)
result1<-tips%>%
  group_by(sex)%>%
  summarise(
    avg=mean(total_bill),
    median=median(total_bill),
    count=n(),
    sd=sd(total_bill)
  )
result1
#6.2.2
f<-fivenum(tips$total_bill, sex=="Male")
iqr=f[4]-f[2]
male<-tips%>%
  filter(sex=="Male")%>%
  select(total_bill)
head(male)
male$total_bill[male$total_bill>f[4]+1.5*iqr]
#6.2.4
par(mfrow=c(1,2))
boxplot(tips$total_bill~tips$sex)
#6.2.3
hist(tips$total_bill, probability = T)
density<-density(tips$total_bill)
lines(density)
#6.2.5
descriptivePlot<-function(DFR, CONT, CAT, COL1)
{
  par(mfrow=c(1,2))
  boxplot(CONT~CAT)
  hist(CONT, probability=T, col=COL1)
  lines(denstiy(CONT))
}
descriptivePlot(tips,tips$tip, tips$day, 2)
#6.3.1
library(datasets)
summary(airquality)
#6.3.2
nrow(airquality)
#6.3.3
sum(is.na(airquality$Ozone))
#6.3.4
air_complete<-airquality[complete.cases(airquality), ]
air_complete
#6.3.4
nrow(air_complete)











