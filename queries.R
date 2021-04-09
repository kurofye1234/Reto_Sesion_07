install.packages("DBI")
install.packages("RMySQL")
install.packages("dplyr")
install.packages("ggplot2")

library(DBI)
library(RMySQL)
library(ggplot2)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)


DataCountryLangDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
#DataDB <- dbGetQuery(MyDataBase, "select * from City")
View DataCountryLangDB

head(DataCountryLangDB)

library(dplyr)

Hispanic <-  DataCountryLangDB %>% filter(Language == "Spanish")
Hispanic

ggplot(data=Hispanic, aes(x=Percentage, y=CountryCode, colour=IsOfficial, group =1)) +
  geom_line()+
  geom_point() +
  xlab("Porcentaje") + ylab("Pais")

