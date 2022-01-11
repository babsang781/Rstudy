heart <- read.csv("heart_failure_clinical_records_dataset.csv")




boxplot(titanic$age)







a <- 1:7
b<-1:8
c<-1:9
d<-1:10
summary(a)
summary(b)
summary(c)
summary(d)

# 8개 
aaa <- c( 0,0,100,100,100,100,100,100)
summary(aaa)
# 9개 
aab <- c( 0,0,100,100, 100, 100,100,100,100)
summary(aab)
# 10개 
aac <- c( 0,0,100,100,100, 100,100,100,100,100)
summary(aac)
# 11개
aad <- c( 0,0,100,100,100, 100, 100,100,100,100,100)
summary(aad)

#0이 3개
# 8개 
aaaa <- c( 0,0,0,100,100,100,100,100)
summary(aaaa)
# 9개 
aaab <- c( 0,0,0,100, 100, 100,100,100,100)
summary(aaab)
# 10개 
aaac <- c( 0,0,0,100,100, 100,100,100,100,100)
summary(aaac)
# 11개
aaad <- c( 0,0,0,100,100, 100, 100,100,100,100,100)
summary(aaad)
boxplot(aaa,aab,aac,aad, aaaa,aaab,aaac,aaad)
