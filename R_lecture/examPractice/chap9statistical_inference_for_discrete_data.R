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