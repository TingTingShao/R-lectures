#path
getwd()

#data structure
#vector
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
y<-seq(from=0, to=10, by=2)
#[1]  0  2  4  6  8 10
rep(1:4, 2)
#[1] 1 2 3 4 1 2 3 4
rep(1:4, each=2)
#[1] 1 1 2 2 3 3 4 4
rep(1:4, each=2, length.out=4)
#[1] 1 1 2 2
rep(1:4, each=2, times=3)
# [1] 1 1 2 2 3 3 4 4 1 1 2 2 3 3 4 4 1 1 2 2 3 3 4 4
rep(1:4, 1:4)
# [1] 1 2 2 3 3 3 4 4 4 4
#give names to elements of a vector
y<-c(33, 55, 4)
names(y)<-c("No1", "No2", "No3")
y
#No1 No2 No3 
#33  55   4 
#sumfactor
y<-1:6
as.factor(y)
y
#[1] 1 2 3 4 5 6
#Levels: 1 2 3 4 5 6

#sumifelse
x<-c(9,10,8,5,9)
y<-ifelse(x>8, 1, 0)
#[1] 1 1 0 0 1
cut_new<-ifelse(diamond_small$cut=="Ideal"|diamond_small$cut=="Premium", "Above average",
                ifelse(diamond_small$cut=="Very Good", "Very Good", 
                       ifelse(diamond_small$cut=="Good"| diamond_small$cut=="Fair", "Below average", "Belwo average")))

sub1<-mutate(business, business_status=ifelse(business$business_status==4, NA, business$business_status))

#sumchar
paste(c("x","y","z"), c("height","width","weight"), sep=" ")
#[1] "x height" "y width"  "z weight"
#sumna
y<-c(1,2,3,NA)
sum(y, na.rm=T)
#[1] 6
library(ggplot2)
df<-remove_missing(sub2, na.rm=T)

#summatrices
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
#sumdataframe
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
#join
library(ggplot2)
data(diamonds)
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
#2.b subjoindataframe
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

#sort dataframe
library(doBy)
head(airquality)
sort.air<-orderBy(~Month+Temp, data=airquality)
head(sort.air)
#sumexportread
library(readxl)
titanic <- read_excel("~/Documents/univariate_data_and_modeling/Data/data_for_univariate_data_and_modeling/titanic.xlsx")
head(titanic, n=6)
#export a data frame into a xlsx file
library(datasets)
library(openxlsx)
write.xlsx(airquality, file="Airdata.xlsx")
chol<-read.table(file=file.choose(), header=TRUE)
names(chol)
#export a data frame into a .txt file
write.table(chol, file=file.choose(), quote = FALSE, sep=" ", row.names = FALSE, col.names = TRUE)
#sumfunction
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
n<-4
factorial(n)
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



#sumgraphics
library(datasets)
names(airquality)
plot(airquality$Temp, airquality$Ozone)
plot(airquality$Temp, airquality$Ozone, main="ozone-tempreture", 
     xlab="airquality", ylab="ozone", pch=1, col=5,cex=0.8, xlim=c(50, 100), ylim=c(0, 200))
mean_ozone<-mean(airquality$Ozone, na.rm = T)
abline(h=mean_ozone, col=3, lwd=2)
points(airquality$Wind, pch=2)
lm.res<-lm(airquality$Ozone~airquality$Temp)
lm.res2<-lm(airquality$Wind~airquality$Temp)
abline(lm.res, col=1)
abline(lm.res2, col=2)
head(airquality$Wind, n=10)
#points(65, 100, pch=1, cex=1.5)
#text(65,110, "new point")
#text(locator(1), "hi", cex=1)
#lm.res<-lm(airquality$Ozone~airquality$Temp)
#abline(lm.res, lwd=2, col=2)
par(mfrow=c(1,2))
plot(airquality$Temp, airquality$Ozone)
lm.res1<-lm(airquality$Ozone~airquality$Temp)
abline(lm.res1)
plot(airquality$Temp, airquality$Wind)
lm.res2<-lm(airquality$Wind~airquality$Temp)
abline(lm.res2)
#histogram
x<-rnorm(50)
y<-rexp(50, rate=2)
y
range(y)
z<-rchisq(50,10)
z
range(z)
par(mfrow=c(1,3))
hist(x)
hist(y)
hist(z, probability = T)
x<-rnorm(150)
hist(x, prob=T)
den<-density(x)
lines(density(x))
#boxplot
library(UsingR)
head(babies)
boxplot(babies$wt)
f<-fivenum(babies$wt)
f
text(rep(1.3, 5), f, labels=c("min", "Q1", "median", "Q3", "max"))
#getting the otliers, 1.5* IQR(interquartile range)
IQR<-f[4]-f[2]
outliers<-babies$id[babies$wt>f[4]+1.5*IQR | babies$wt<f[2]-1.5*IQR]
outliers
outlier_wt<-babies$wt[babies$wt>f[4]+1.5*IQR | babies$wt<f[2]-1.5*IQR]
outlier_wt
#group
boxplot(babies$wt~babies$smoke)
smoke.names<-c("never","yes","up","la","na")
boxplot(babies$wt~babies$smoke, names=smoke.names)
#6.1
library(reshape)
tip<-tips$tip
bill<-tips$total_bill
plot(bill, tip)
lm.res<-lm(tip~bill)
mean_tip<-mean(tip)
abline(lm.res, lty=3)
abline(h=mean_tip, lty=2)
legend(locator(1), lty=c(3, 2), c("regerssion line", "regression tip"))
#6.2
day<-tips$day
boxplot(tip~day)
#6.3
x<-seq(from=-2*pi, to=2*pi, by=0.1)
plot(sin(x)~x, lty=1)
lines(cos(x)~x, lty=2)
lines(tan(x)~x, lty=3)
legend("topright", lty=c(1,2,3), c("sin", "cos", "tan"))
#7.3
#7.3.1
vec<-seq(from=-2*pi, to=2*pi, by=0.01)
#7.3.2
sin<-sin(vec)
cos<-cos(vec)
tan<-tan(vec)
#7.3.3
df<-data.frame(vec, sin, cos, tan)
head(df)
#7.3.4
ggplot(df, aes(x=vec))+geom_line(aes(y=sin, color="sin_x"))+geom_line(aes(y=cos, color="cos_x"))+
  geom_line(aes(y=tan, color="tan_x"))+
  labs(title="Geometric curves", x="x", y=" ")+ylim(-2, 2)


#sumdplyr
#sumfilter
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
    count=n(!is.na(arr_delay))
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
sort2<-arrange(sub3, time, -(size))
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
#remove missing values
air_complete<-airquality[complete.cases(airquality), ]
air_complete
#6.3.4
nrow(air_complete)
#summoreprogramming
#sumapply
#apply function apply(df, Margin(1,2), function)
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
tapply(tips$tip, list(tips$day, tips$time), mean, na.rm=T)
vector<-tips$tip
index<-factor(tips$day)
tapply(vector, index, mean)
#tapply function
library(reshape) #tapply(vector, factor, function)
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
#sumloop
#sumwhile
#loop
head(tips)
sum_even<-0
for(val in tips$size){
  if (val%%2 == 0) 
    sum_even=sum_even+1
  sum_even
}
sum_even
#use this one
total<-tips$total_bill+tips$tip
total
cbind(tips, total)
tips$total<-o
for(i in 1:length(tips$total_bill)){
  tips$total[i] <- tips$total_bill[i] + tips$tip[i]
}
head(tips)

#while loop
i<-1 #important
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

#sumstatcon

library(UsingR)
names(normtemp)
head(normtemp)
data("normtemp")
#descriptive statistics
library(rstatix)
summary_result<-normtemp%>%
  get_summary_stats(temperature, hr, show = c("n", "mean", "sd", "median"))
summary_result

#one sample t-test
temp<-normtemp$temperature
t1<-t.test(temp, mu=100, conf.level = 0.95, alternative = "less")
t2<-t.test(temp, mu=100, conf.level = 0.95, alternative = "two.sided")
t2[[3]] #the output returns p-value < 2.2e-16 hence the null hypothesis H0 is rejected and the average temperature is significantly different from 100
t1[[3]]>t2[[3]]

#non parametric test
shapiro.test(temp)
wilcox.test(temp, mu=100, conf.level = 0.95)

#one sample t-test
normtemp%>%t_test(temperature~1, mu=100)
normtemp%>%wilcox_test(temperature~1, mu=100)

#two sample test
mentemp<-normtemp[normtemp$gender==1, "temperature"]
womentemp<-normtemp[normtemp$gender==2, "temperature"]
length(mentemp)
length(womentemp)
#descriptive statistics
normtemp%>%group_by(gender)%>%get_summary_stats(temperature, show = c("n", "mean", "sd", "median"))

#the sample size both bigger than 25, which implies normality in both groups, no need to use shapiro-test
#test variance
var.test(mentemp, womentemp) #p-value = 0.6211, which is bigger than 0.05, accept H0, variance from both groups is equal
var.test(normtemp$temperature~normtemp$gender)

#two sample t.test
t.test(mentemp, womentemp, var.equal = T) #p-value =0.02393, <0.05, reject H0, the means from both groups are not equal
t.test(normtemp$temperature~normtemp$gender, var.equal=T)
#non-parametric test
wilcox.test(normtemp$temperature~normtemp$gender)
#functions of rstatic package
#test normality
normtemp%>%group_by(gender)%>%shapiro_test(temperature)
#test homogeneity
normtemp%>%levene_test(temperature~as.factor(gender))
#correlation test
#parametric
normtemp%>%cor_test(temperature, hr)
#non-parametric
normtemp%>%cor_test(temperature, hr, method="spearman")


#3.1.a
chol<-read.table(file=file.choose(), header = T)
head(chol)
group<-ifelse(chol$SMOKE=="nonsmo", "nonsmoke", "smoke")
chol_new<-cbind(chol, group)
head(chol_new)
#3.1.b
par(mfrow=c(1,2))
boxplot(chol_new$CHOL~chol_new$group)
#3.2
hist(chol_new$CHOL)
#3.3
chol_new%>%group_by(group)%>%get_summary_stats(CHOL, show = c("n", "mean", "sd"))
#n>25, no need for normality test
var.test(chol_new$CHOL~chol_new$group)
#p value = 0.008655 < 0.05, reject H0, variance is not equal between two groups
t.test(chol_new$CHOL~chol_new$group, var.equal=F)
#p value = 0.096, can not reject H0, the means between smoke and nonsmoke are equal

#sumstatdis
chol<-read.table(file=file.choose(), header = T)
head(chol)
tab.chol<-table(chol$SMOKE, chol$MORT)
tab.chol
chisq.test(tab.chol)
seatbelts<-read.table(file = file.choose(), header=T)
head(seatbelts)
table<-xtabs(seatbelts$n~seatbelts$seatbelts+seatbelts$fatal)
table
chisq.test(table)
#p value >0.05, do not reject H0, wearing a seatbelt and having fatal accident is independent
#in case of very few observations
#test for two proportions
trail.mort<-c(121, 145)
trail.siz<-c(1548, 1998)
prop.test(trail.mort, trail.siz)
#binom.test
#hypothesis
#H0: p=0.08 versus H1: p!=0.08
binom.test(121, 1584, p=0.08)

#3.1
operation<-read.table(file = file.choose(), header=T)
head(operation)
table<-xtabs(operation$n~operation$operation+operation$side_effect)
table
#hypothesis
#H0: operation choice and side effects are independent
#H2: operation choice and side effects are dependent
chisq.test(table)
#3.2
library(reshape)
head(tips)
table<-table(tips$sex, tips$day)
table
#hypothesis
#week of the day and gender are independent
#there is a association between day of the week and gender
chisq.test(table)
#p value = 0.00418<0.05, reject H0, there is a asscocaition between day of the week and gender

#sumlinear
library(datasets)
head(airquality)
plot(airquality$Ozone~airquality$Temp)
#linear regression
res.lm<-lm(airquality$Ozone~airquality$Temp)
summary(res.lm)
names(res.lm)
abline(res.lm) #rs<-rstandard(res.lm) shapiro.test(rs) plot(cooks.distance(res.lm))
res.lm2<-lm(Ozone~Temp+I(Temp^2), data=airquality)
summary(res.lm2)
plot(Ozone~Temp, data=airquality)
abline(res.lm, lty=5)
curve(305.5-9.55*x+0.078*x*x, add=T)
legend("topleft", legend = c("linear", "quadratic"), lty=c(5, 1))
#2
library(reshape)
res.lm3<-lm(tips$tip~tips$total_bill)
plot(tips$tip~tips$total_bill)
abline(res.lm3)
text(7.5, 5.8, "173")
text(48, 10, "171")

#sumggplot
library(ggplot2)
fish<-read.table(file=file.choose(), header=T, sep=)
head(fish)
names(fish)
ggplot(fish, aes(elv, log(hg))) + geom_point() + stat_smooth()
ggplot(fish, aes(elv, log(hg), colour=factor(dam)))+ geom_point() 
ggplot(fish, aes(log(hg))) + geom_histogram(color="black", fill="green")
ggplot(fish, aes(lt)) + geom_bar(color="black", fill="green")
ggplot(fish, aes(factor(dam), log(hg))) + geom_boxplot(color="black", fill="green")
ggplot(fish, aes(elv, log(hg))) + geom_point()+geom_line()
ggplot(fish, aes(elv, log(hg))) + geom_point()+geom_smooth()
ggplot(fish, aes(elv, log(hg))) + geom_point()+geom_smooth(method = "lm")
#prediction interval
m.lm<-lm(log(hg)~elv, data=fish)
res.pred<-predict(m.lm, interval="predict")
head(res.pred)
fish.pred<-cbind(fish, res.pred)
names(fish.pred)
ggplot(fish.pred, aes(x=elv))+geom_point(aes(y=log(hg))) + 
  geom_line(aes(y=fit), color = "blue", size=1)
ggplot(fish.pred, aes(elv, log(hg))) + geom_point() + 
  geom_line(aes(y=fit), color="blue", size=1) + geom_ribbon(aes(ymin=lwr, ymax=upr), fill="blue", alpha = 0.1)
pred_fish<-cbind(elv=fish$elv, data.frame(res.pred))
head(pred_fish)
names(pred_fish)
plot1<- ggplot()+geom_point(data=fish, aes(x=elv, y=log(hg))) 
plot2<- plot1+ geom_line(data=pred_fish, aes(x=elv, y=fit))
plot3<-plot2+geom_ribbon(data=pred_fish, aes(x=elv, ymin=lwr, ymax=upr), fill="blue", alpha=0.4)
plot3
ggplot()+geom_point(data=fish, aes(x=elv, y=log(hg))) + geom_line(data=pred_fish, aes(x=elv, y=fit))+geom_ribbon(data=pred_fish, aes(x=elv, ymin=lwr, ymax=upr), fill="blue", alpha=0.4)
ggplot(fish, aes(x=elv, y=log(hg))) + geom_point() + geom_smooth(formula = y~x+I(x^2), method="lm")
#stat
ggplot(fish, aes(x=elv, y=log(hg))) + geom_point() + stat_smooth(method="lm")
ggplot(fish, aes(x=factor(dam), y=log(hg))) + geom_point() + stat_boxplot()
#layer facet
fac1<-ggplot(fish, aes(elv, log(hg))) + geom_point() + geom_smooth(method="lm")
fac1
fac2<-fac1+facet_grid(.~dam) 
fac2
fac3<-fac1+facet_grid(lt~.)
fac3
fac4<-fac1+facet_grid(lt~dam)
fac4
fac4<-fac1+facet_grid(lt~dam, margin=T)
fac4
fac5<-fac1+facet_wrap(~lt+dam)
fac5
#examples of grouping
ggplot(fish, aes(elv, log(hg), color=factor(dam), shape=factor(lt)))+geom_point()+geom_smooth(method="lm")
#method1: grouping by continous variable color points by value of continuous variable
ggplot(fish, aes(elv, log(hg), color=z))+geom_point()+geom_smooth(method = "lm", se=F)
#method2: categorize your continues variable
#step1 convert the continuous variable into a variable with a discrete categories
fish$z_cat1<-cut_interval(fish$z, n=3)
xtabs(~fish$z_cat1)
#step2 use this variable for faceting
fac1<-ggplot(fish, aes(elv, log(hg)))+geom_point()+geom_smooth(color="red", method="lm")
fac2<-fac1+facet_wrap(~z_cat1)+labs(title="by z_cat1")
fac2
#extras
#themes
#multiple plots on the same page
plot1<-ggplot(fish, aes(elv, log(hg)))+geom_point()
plot2<-ggplot(fish, aes(log(hg)))+geom_histogram()
plot3<-ggplot(fish, aes(factor(lt), log(hg)))+geom_boxplot()
#use rectanglear grids: use grid.layout()
library(grid)
grid.newpage()
pushViewport(viewport(layout=grid.layout(2,2)))
vplayout<-function(x,y){
  viewport(layout.pos.row=x, layout.pos.col=y)
}
print(plot1, vp=vplayout(1, 1:2))
print(plot2, vp=vplayout(2,1))
print(plot3, vp=vplayout(2,2))
#or use ggarrange
library(ggpubr)
ggarrange(plot1, plot2, plot3, ncol=2, nrow=2)
#save your output
plot<-ggplot(fish, aes(elv, log(hg)))+geom_point()+geom_smooth(method="lm")
plot
ggsave(file="/Users/shaotingting/Documents/R_lecture/examPractice/output1.pdf", plot=plot)
#applications
#profile plots for visualizing longitudinal data
library(nlme)
library(mgcv)
head(Oxboys)
head(economics)
data(economics)
ts1<-ggplot(economics, aes(date))
ts1
ts2<-ts1+geom_line(aes(y=psavert, color="psavert"))+geom_line(aes(y=uempmed, color="uempmed"))
ts2
ts3<-ts2+ylab(" ")
ts3
ts4<-ts3+scale_color_manual(name="variable", values=c("green", "blue"))
ts4
#adding statistical summaries
#adding statistical summaries
library(Hmisc)
pl1<-ggplot(fish, aes(x=factor(lt), y=log(hg)))
pl2<-pl1+geom_point()
pl2
pl3<-pl2+stat_summary(fun="mean", geom = "point", size=5, color="red")
pl4<-pl3+labs(title = "use of mean function")
pl4
quant<-function(x)
{
  q1<-quantile(x, 0.25)
  q2<-quantile(x, 0.50)
  q3<-quantile(x, 0.75)
  qs<-c(q1, q2, q3)
}
x<-1:5
quantile(x, 0.25)
quantile(x, 0.5)
tapply(log(fish$hg), fish$lt, quant)
pl7<-pl2+stat_summary(fun="quant", color="red", size=0.5)
pl7+labs(title="use of own created function")

#7.1.1
names(tips)
library(grid)
plot1<-ggplot(tips, aes(y=tip, x=factor(sex)))+geom_boxplot(color="blue", fill="blue", alpha=0.5)
#7.1.2
plot2<-plot1+facet_grid(.~day)
plot2
#7.1.3 & 7.1.4
names(tips)
head(tips)
ggplot(tips, aes(x=total_bill, y=tip, color=factor(smoker)))+
  geom_point()+geom_smooth(method="lm")
#7.1.5.a
hist1<-ggplot(tips, aes(tip))+geom_histogram(color="black", fill="green")
hist1
#7.1.5.b
boxplot1<-ggplot(tips, aes(x=factor(sex), y=tip))+geom_boxplot(color="black", fill="green", alpha=0.5)
#7.1.5.c
scatter1<-ggplot(tips, aes(x=total_bill, y=tip, color=factor(smoker)))+geom_point()
library(grid)
grid.newpage()
pushViewport(viewport(layout=grid.layout(2,2)))
vplayout<-function(x,y){
  viewport(layout.pos.row=x, layout.pos.col=y)
}
print(hist1, vp=vplayout(1, 1:2))
print(scatter1, vp=vplayout(2,1))
print(boxplot1, vp=vplayout(2,2))
#7.1.6.a
result<-function(x)
{
  m<-mean(x)
  cil<-t.test(x)$conf.int[1]
  ciu<-t.test(x)$conf.int[2]
  res<-c(cil, m, ciu)
  names(res)<-c("ymin", "y", "ymax")
  res
}
t.test(new$tip)$conf.int
pl1<-ggplot(tips, aes(x=day, y=tip))+geom_point(size=1)
pl2<-pl1+stat_summary(fun.data = "result", size=0.8, color="blue")
pl3<-pl2+labs(title="Use of mean and corresponding confidence interval") + theme_bw()
pl3
#7.2
library(UsingR)
data(galileo)
head(galileo)
#7.2.1
pl1<-ggplot(galileo, aes(x=init.h, y=h.d))+geom_point()
#7.2.2
pl2<-pl1+geom_smooth(aes(color="linear"), method="lm", se=F)
pl2
#7.2.3
pl3<-pl2+geom_smooth(aes(color="quadratic"), formula =y~ x+I(x^2), method="lm", se=F)
pl3
#7.2.4
pl4<-pl3+labs(title="Galileo data", x="initial height", y="horizontal distance")+scale_color_manual(name="Method", values=c("green","blue"))
pl4
#7.3
#7.3.1
vec<-seq(from=-2*pi, to=2*pi, by=0.01)
#7.3.2
sin<-sin(vec)
cos<-cos(vec)
tan<-tan(vec)
#7.3.3
df<-data.frame(vec, sin, cos, tan)
head(df)
#7.3.4
ggplot(df, aes(x=vec))+geom_line(aes(y=sin, color="sin_x"))+geom_line(aes(y=cos, color="cos_x"))+
  geom_line(aes(y=tan, color="tan_x"))+
  labs(title="Geometric curves", x="x", y=" ")+ylim(-2, 2)



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

#TingTing Shao
#sumlib
library(ggplot2)
library(grid) #arrange plots
library(ggpubr) #ggarrange
library(Hmisc) #stat_summary, add statistical summaries
library(tidyverse) #include dplyr filter, select, arrange, mutate, 
                   #transmutate, summarise, group_by
library(dplyr)
library(tidyr) #pivo_longer pivot_wider
library(rstatix) #get_summary_stats


































































