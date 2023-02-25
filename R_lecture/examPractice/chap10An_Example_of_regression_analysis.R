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










