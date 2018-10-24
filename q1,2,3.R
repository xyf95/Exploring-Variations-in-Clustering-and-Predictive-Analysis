library(igraph)
library(ggplot2)
library(ggthemes)
library(psych)
library(cluster)
library(gmodels)
library(class)
library(fpc)
setwd("D:\\download")
data <- read.table("./adult.data",header=FALSE, sep = ",")
names(data) <- c("age","workclass","fnlwgt","education","education-num",
                 "marital","occupation","relationship","race","sex","capital-gain",
                 "capital-loss","hours-per-week","native-country","salary")
age <- data[[1]]
workclass <- data[[2]]
fnlwgt <- data[[3]]
education <- data[[4]]
education_num <- data[[5]]
marital <- data[[6]]
occupation <- data[[7]]
relationship <- data[[8]]
race <- data[[9]]
sex <- data[[10]]
capital_gain <- data[[11]]
capital_loss <- data[[12]]
hours_per_week <- data[[13]]
native_country <- data[[14]]
salary <- data[[15]]

data1<-as.data.frame(data)
tran1=sample(nrow(data1),0.7*nrow(data1))
tran1.df=data[tran1,]
test1.df=data[-tran1,]
tran2=sample(nrow(data1),0.6*nrow(data1))
tran2.df=data[tran2,]
test2.df=data[-tran2,]
tran3=sample(nrow(data),0.5*nrow(data))
tran3.df=data[tran3,]
test3.df=data[-tran3,]

pairs(data)
plot(data$`capital-gain`, data$`hours-per-week`)
pairs(age ~ workclass+ fnlwgt + occupation, data=data)
ggplot(data, aes(sex)) + geom_bar(aes(fill= salary), alpha=0.8)
plot3d(as.numeric(native_country),as.numeric(race),hours_per_week)

data$marital
marital.s <- function(marriage) {
  marriage <- as.character(marriage)
  if (marriage == "Divorced"|marriage =="Separated" | marriage =="Widowed" ) {
    return("Not-Married")
  } else if (marriage == "Married-AF-spouse" | marriage == "Married-civ-spouse" 
             | marriage == "Married-spouse-absent") {
    return("Married")
  } else {
    return(marriage)
  }
}
data$marital <- sapply(data$marital, marital.s)
data$marital

for(i in 1:ncol(tran1.df)){
  if(class(tran1.df[,i])=="factor")
    tran1.df[,i]=as.numeric(tran1.df[,i])
}
for(i in 1:ncol(test1.df)){
  if(class(test1.df[,i])=="factor")
    test1.df[,i]=as.numeric(test1.df[,i])
}
for(i in 1:ncol(tran2.df)){
  if(class(tran2.df[,i])=="factor")
    tran2.df[,i]=as.numeric(tran2.df[,i])
}
for(i in 1:ncol(test2.df)){
  if(class(test2.df[,i])=="factor")
    test2.df[,i]=as.numeric(test2.df[,i])
}
for(i in 1:ncol(tran3.df)){
  if(class(tran3.df[,i])=="factor")
    tran3.df[,i]=as.numeric(tran3.df[,i])
}
for(i in 1:ncol(test3.df)){
  if(class(test3.df[,i])=="factor")
    test3.df[,i]=as.numeric(test3.df[,i])
}
tran1.df
a=kmeans(test1.df,7)

plotcluster(test1.df,a$cluster)
clusplot(test1.df,a$cluster)
table(a$cluster)

b=iclust(test1.df, 7)
b
table(b$clusters)

data.knn <- data
for(i in 1:ncol(data.knn)){
  if(class(data.knn[,i])=="factor")
    data.knn[,i]=as.numeric(data.knn[,i])
}
data.knn[,6] <- as.numeric(as.factor(data.knn[,6]))
data.knn <- as.data.frame(data.knn)
idxs <- sample(nrow(data.knn),0.5*nrow(data.knn))
train <- data.knn[idxs,]
test <- data.knn[-idxs,]
result <- knn(train= train[,-ncol(train)],test=test[,-ncol(test)],cl=train[,ncol(train)],7)
Freq <- table(result,test[,ncol(test)])
print(1-sum(diag(Freq))/sum(Freq))
CrossTable(x=test[,ncol(test)],y=result)
