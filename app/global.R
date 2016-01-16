library(caret)
library(dplyr)

SetFlag <- function(x,n){
  return(as.numeric(any(x == n)))
}

temp <- read.csv("../data/nj_cash_5.csv")
features <- select(temp,drawdate,n1,n2,n3,n4,n5)
prizes <- select(temp,drawdate,prize_3)

for(i in 1:43){
  ft = paste('f', as.character(i), sep = '')
  features[[ft]] = apply(features[,2:6],1,function(x) SetFlag(x,i))
}

features <- select(features,drawdate:f41)
model.data <- inner_join(features,prizes,by="drawdate") %>%
              select(n1:prize_3)
rm(temp,features,prizes,i,ft)

modelfit <- lm(prize_3 ~ ., data = model.data)