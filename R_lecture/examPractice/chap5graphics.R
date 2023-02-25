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








