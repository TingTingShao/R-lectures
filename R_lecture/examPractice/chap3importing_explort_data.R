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















