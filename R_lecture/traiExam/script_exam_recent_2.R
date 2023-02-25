#extra2
# import boston2 data 
# 1. compute averages of international by roomfact
# use dplyr
library(dplyr)
library(ggplot2)
names(boston2)
summary1 <- boston2 %>%
  group_by(roomfact) %>%
  summarise(n=n(), Avg = mean(international, na.rm = T)) 
summary1
names(summary1)
# 2. merge with the orginal boston2 data frame, so that you have one extra 
# column with the average
# compute per roomfact, the difference
boston3 <- inner_join(boston2, summary1, by = c("roomfact" = "roomfact"))
head(boston3[,c(13,18,21)])
names(boston3)
length(boston2$crim)
length(boston3$crim)
boston4 <- mutate(boston3, diff = international - Avg)
boston_center <- select(boston4, c(13,18,21,17,22))
boston_center2 <- arrange(boston_center, diff)
names(boston_center)
head(boston_center2)
# 3. make a box plot  of the differences
names(boston_center)
plot4 <- ggplot(boston_center, aes(roomfact,diff)) +geom_boxplot()
plot4
#summary2 <- boston_center %>%
#  group_by(roomfact) %>%
#  summarise(n=n(), AvgDiff = mean(diff, na.rm = T)) 
#summary2
# add a horizontal reference line with value diff=0
plot5 <- plot4 + geom_hline(yintercept=0, color='green', size= 1)+theme_bw()
plot5

# 4. Create a function for performing linear regression 
# and gives as output 
# the intercept, slope + R² value
# a.check the body of the function 
names(boston2)
result.lm <- lm(boston2$dis ~boston2$zn)
summary(result.lm)
names(summary(result.lm))

coef <- coefficients(result.lm)
int <- coef[[1]]
slope <- coef[[2]]
r_square <- summary(result.lm)$r.squared
list(int=int, slope=slope, r_square=r_square)

# b.create a function 
regres.f <- function(resp, expl)
{
  result.lm <- lm(resp ~ expl)
  coef <- coefficients(result.lm)
  int <- coef[[1]]
  slope <- coef[[2]]
  r_square <- summary(result.lm)$r.squared
  list(int=int, slope=slope, r_square=r_square)
}
regres.f(boston2$dis ,boston2$zn)


# 5.apply this function now for every level of roomfact. 

tab <- table(boston2$roomfact)
names(tab)[1]

df1 <- data.frame(roomfact = rep("low", 3), intercept = rep(0,3), slope=rep(0,3), rsquare=rep(0,3))
i <- 1
for (i in (1:3))
{
  level <- names(tab[i])
  sub1 <- boston2[boston2$roomfact==level,] 
  result <- regres.f(sub1$dis ,sub1$zn)
  df1[i,1]<- level
  df1[i,2]<- result[[1]]
  df1[i,3]<- result[[2]]
  df1[i,4]<- result[[3]]
}
df1
boston2[boston2$roomfact==level,] 
