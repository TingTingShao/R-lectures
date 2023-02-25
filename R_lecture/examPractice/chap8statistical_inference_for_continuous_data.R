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










