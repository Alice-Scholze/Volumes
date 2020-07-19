install.packages('caret')
install.packages('e1071')
install.packages('randomForest')
install.packages("kernlab")
library('caret')
library('kernlab')
library('randomForest')

dataset <- read.csv2(file = 'http://www.razer.net.br/datasets/Volumes.csv')
head(dataset)

set.seed(42)

dataset$NR <- NULL

index <- createDataPartition(x_train$VOL, p = 0.80, list = FALSE)

x_train <- x_train[index,]
x_test <- x_train[-index,]

rf <- train(VOL~., data = x_train, method = 'rf')
svm <- train(VOL~., data = x_train, method = 'svmRadial')
rna <- train(VOL~., data = x_train, method = 'neuralnet')
alom <- nls(VOL ~ b0 + b1*DAP*DAP*HT, data = x_train, start=list(b0=0.5, b1=0.5))

predict.rf <- predict(rf, x_test)
predict.svm <- predict(svm, x_test)
predict.rna <- predict(rna, x_test)
predict.alom <- predict(alom, x_test)

predict.rf
# 15        22        79        80        87       100 
# 0.8164071 1.4202660 1.9998177 1.3365004 0.9303110 1.5253914
predict.svm
# [1] 0.8444031 1.3756238 1.8652179 1.2611692 0.9187624 1.5387818
predict.rna
# 15        22        79        80        87       100 
# 0.8521726 1.4309305 1.8934374 1.3281319 0.8656795 1.5738597 
predict.alom
# [1] 0.8841815 1.4278244 1.8417411 1.3173191 0.8586578 1.5510745

cor_rf = cor(predict.rf, x_test$VOL) # 0.9947002
cor_svm = cor(predict.svm, x_test$VOL) # 0.9857407
cor_rna = cor(predict.rna, x_test$VOL) # 0.9844254
cor_alom = cor(predict.alom, x_test$VOL) # 0.9784588

# Realizadas as predições com os quatro modelos, o que mostrou melhor resultado por meio da métrica 
# de correlação foi o Random Forest, com valor de 0.9947002
