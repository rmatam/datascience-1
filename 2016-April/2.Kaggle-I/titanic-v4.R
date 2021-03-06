setwd("C:\\Users\\Thimma Reddy\\Documents\\GitHub\\datascience\\2014\\kaggle\\titanic\\data")

titanic_train = read.csv("train.csv")
dim(titanic_train)
str(titanic_train)
titanic_train$Pclass = as.factor(titanic_train$Pclass)
titanic_train$Name = as.character(titanic_train$Name)
titanic_train$Survived = as.factor(titanic_train$Survived)
summary(titanic_train)


titanic_test = read.csv("test.csv")
dim(titanic_test)
str(titanic_test)

titanic_test$Pclass = as.factor(titanic_test$Pclass)
titanic_test$Name = as.character(titanic_test$Name)

tmp = numeric(nrow(titanic_test))
# for(i in 1:nrow(titanic_test)) {
#   if(titanic_test[i,"Pclass"]== "1" && titanic_test[i,"Sex"]== "female")
#     tmp[i] = 1
# }

titanic_test$Survived = 0
titanic_test$Survived[titanic_test$Sex == 'female'] = 1
titanic_test$Survived[titanic_test$Sex == 'female' & titanic_test$Pclass=='3'] = 0

result = titanic_test[,c("PassengerId","Survived")]
write.csv(result,"submission.csv",row.names = F, col.names = T )
