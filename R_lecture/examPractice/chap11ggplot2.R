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
tapply(log(fish$hg), fish$lt, quant)
pl7<-pl2+stat_summary(fun="quant", color="red", size=0.5)
pl7+labs(title="use of own created function")
#animated graph
library(gganimate)
g1<-ggplot(fish, aes(elv, log(hg)))+geom_point(aes(color=factor(dam)), size=3)
g1
animo1<-g1+transition_states(factor(dam))
animo2<-animo1+enter_fade()+exit_shrink()
animo2

#7.1.1
names(tips)
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





 








