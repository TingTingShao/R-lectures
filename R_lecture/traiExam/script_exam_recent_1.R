# script exam recent 1
# Question 1: compute sine series by using series expansion;
# points: 4.5
# a. pi is known constant: 0.5
x <- pi/6
sin(x)
series_sin <- rep(0, 3)
series_sin[1] <- x

# b.use expansion for first 3 terms ; points: 0.5
series_sin <- rep(0, 3)
series_sin[1] <- x
series_sin[2] <- series_sin[1] - (x**3)/factorial(3)
series_sin[3] <- series_sin[2] + (x**5)/factorial(5)


#c.  write a function which creates a vector ; points: 3
# with defaults for n and x
fun_sin_an <- function(x=pi/2,n=5){
  series_sin <- rep(0, n)
  series_sin[1] <- x
  teken <- -1 
  for(k in 2:n)
  {
  series_sin[k] <- series_sin[k-1] + teken *(x**(2*k-1))/factorial(2*k-1)
    teken <- -teken
  }
  list(n=n, x=x, th_nth_approximation_of_sin_in_x_is = series_sin[n])
}

# d. apply the function; Points: 0.5
fun_sin_an(x=pi/6,3)
fun_sin_an(x=pi/4,6)
sin(pi/4)




# question2 use the business data (excel file): Points: 5.5
names(business)
library(ggplot2)
library(dplyr)
# a. count the number of missing values in 
#business_status, sex : 0.5
sum(is.na(business$business_status) )
sum(is.na(business$sex))
table(business$business_status)
# b. there are a few records with a business status of 4
# replace these values with a NA : 0.5
sub1 <- mutate(business, business_status=ifelse(business_status == 4, NA,business_status))

#another way 
#business$business_status <-na_if(business$business_status, 4)
#sub1 <- business

table(sub1$business_status)
names(sub1)
# c. selecteer enkel deze observaties 
# met waarden op neoconsc > 30 : 0.5
sub2 <- filter(sub1, neoconsc> 30)
# d. maak in ggplot2  een scatterplot van neoopen 
# versus neoconsc en geef 
# een verschillend kleur voor verschillende waarden 
# van business status : 0.75
plot1 <- ggplot(sub2,aes(x=neoopen, y=neoconsc, colour=factor(business_status)))+geom_point()
plot1
# e. make now use of pipe operator to perform b, c en d in 
# one step: 1.25
plot  <- business %>%
  mutate( business_status=ifelse(business_status == 4, NA,business_status))%>%
 filter( neoconsc> 30)%>%
ggplot(aes(x=neoopen, y=neoconsc, colour=factor(business_status)))+geom_point()
plot
# f. adapt the syntax of point d to remove : 1
# the missing values for NA
##use the function remove_missing (in package ggplot2) to remove the NA so 
# that they are not visible anymore in your plot. Give this name plot1
plot1 <- ggplot(remove_missing(sub2),aes(x=neoopen, y=neoconsc, colour=factor(business_status)))+geom_point()
plot1
# g. use now plot1 which was produced in step f. : 1
# make use of the function ggMarginal of package ggExtra

library(ggExtra)
ggMarginal(plot1, type = "boxplot", fill="transparent")

