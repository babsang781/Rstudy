#ggplot2 패키지 설치
install.packages("ggplot1")
패키지 로딩
library(ggplot2)
#ggplot2 패키지는 시각화를 손쉽게 해주는 전용 패키지

#
library(dplyr)
# ggplot2 내부 연습용 데이터 : mpg 
# 미국 1999~2008년 사이 미국에서 출시된 자동차 234종의 연비관련 정보

mpg

# manufacture : 제조사 / dispel : 배기량 / cyl : 실린더수 / trans : 수동자동 / drv : 전륜,4륜 / cty, hwy: 도시연비, 고속도ㅗ로연비 / fl :... ppt에 있음
View(mpg)
str(mpg)
# tibble 형태(최신버전의 데이터 구조)를 dataframe 형태로
# 버전이 낮은 경우, tibble 에 있는 주석으로 인해 데이터 처리, 분석에 분석 값이 다르게 나올 수 있음 
mpg <-data.frame(mpg)

# ggplot 3단계 구조 
# 1. 축 설정 2. 그래프 설정, 3. 추가 설정

# 1) 산점도(산포도) 
ggplot(mpg, aes(x=displ, y =hwy))+geom_point(size=3, color="#4169e1")+xlim(3,6)+ylim(10,30)+labs(x="배기량",y="고속도로 연비")+theme(axis.title.x = element_text(size = 30), axis.title.y =element_text(size = 30))
# 연속형 데이터의 관계를 살펴볼 때 유용: 
#두 점 사이의 비례 반비례 관계를 직관적으로 보기 좋음
# 음의 상관관계 - 정확하게는 피어슨의 상관계수를 확인할 수 있음.



# 구동방식(drv)과 따른 배기량에 따른 고속도로 연비 시각화
# (1) 변수 위치에 color 값을 통해 범주형 변수는 각각 다른 색상으로 표현됨 
ggplot(mpg, aes(x=displ,y=hwy, color=drv))+geom_point(size=4)


# color 안의 기준점이 수치형인 경우, 그라데이션으로 표현됨
ggplot(mpg, aes(x=displ,y=hwy, color=cyl))+geom_point(size=4)

# 추세선 그리기: geom_smooth()
ggplot(mpg, aes(x=displ,y=hwy, color=cyl))+geom_point(size=4)+geom_smooth()
ggplot(mpg, aes(x=displ,y=hwy, color=cyl))+geom_col()
ggplot(mpg, aes(x=displ,y=hwy, color=cyl))+geom_line()

ggplot(mpg, aes(x=displ,y=hwy, color=cyl))+geom_point()

# 실습 제조사별 평균연비 출력
manu_hwy<-mpg %>% group_by(manufacturer) %>% summarise(mean_hwy=mean(hwy))

# x축 가나다 순을 reorder 재정렬 y 값 기준으로 -> 기본은 오름차순
ggplot(manu_hwy, aes(x=reorder(manufacturer,mean_hwy) ,y=mean_hwy)) + geom_col()
# 내림차순은 마이너스 
ggplot(manu_hwy, aes(x=reorder(manufacturer, -mean_hwy) ,y=mean_hwy)) + geom_col()       
# 제조회사별 구동방식별 시각화
# 데이터 생성
manu_hwy_drv <-mpg %>% group_by(manufacturer, drv) %>% summarise(mean_hwy=mean(hwy) ) 

# geom_col(aes(fill=drv), position ="dodge") 형태로 
ggplot(manu_hwy_drv, aes(x=manufacturer ,y=mean_hwy))+geom_col(aes(fill=drv), position ="dodge")


# 구동방식별 빈도수 그래프
# 빈도 그래프를 그릴 때는 y 축 지정하지 않음
ggplot(mpg, aes(x=drv))+geom_bar()


# 제조사별차종별 빈도 그래프 (알록달록 구성 구분 바)
ggplot(mpg, aes(x=manufacturer))+geom_bar(aes(fill=class))

# 탐색적 데이터 분석 (EDA: Exploratory Data Analysis)
# 데이터 분석 과정에 대한 용어 
# 

list.files()

titanic <-read.csv("titanic_2.csv", stringsAsFactors =T)
dim(titanic)
str(titanic)
summary(titanic)
names(titanic)

# 특정 컬럼을 범주형 데이터로 변환
titanic$Survived <-factor(titanic$Survived)

# 나머지 범주형 데이터 변환하기
titanic$Pclass <-factor(titanic$Pclass)
titanic$Sex <-factor(titanic$Sex)
titanic$Embarked <-factor(titanic$Embarked)

titanic$SibSp <-factor(titanic$SibSp)
titanic$Parch <-factor(titanic$Parch)
titanic$Ticket <-factor(titanic$Ticket)
titanic$Cabin <-factor(titanic$Cabin)


#table(is.na(titanic$Name))
#titanic$Cabin <-ifelse(titanic$Cabin =="",NA, titanic$Cabin)
#table(is.na(titanic$Cabin))

table(is.na(titanic$Age))
titanic$Age <-ifelse(is.na(titanic$Age), mean(titanic$Age, na.rm=T), titanic$Age)
# 금액 0 원 평균
titanic$Fare <- ifelse(titanic$Fare ==0, mean(titanic$Fare, na.rm=T), titanic$Fare)
# Embarked 없는 행 걸러주기
titanic <- titanic %>% filter(Embarked != "")

#
titanic2<-titanic
titanic<-titanic2
table(titanic$Cabin)

summary(titanic)
titanic$Cabin <-ifelse(titanic$Cabin =="","z", titanic$Cabin)
titanic$Cabin <-substr(titanic$Cabin,1,1)

titanic$Cabin

titanic<-titanic %>% mutate(FamilySize= SibSp +Parch +1)
titanic <- titanic %>% mutate(FamilyLevel = ifelse(FamilySize == 1, "Single", ifelse(FamilySize <= 4, "Small", "Large")))


# 현 세이titanic3 <- titanic  


titanic <- titanic %>% filter(Cabin != "")

ggplot(data = titanic, aes(x = Cabin)) +geom_bar(aes(fill=Survived), position ="dodge")

titanic$Cabin <- as.character(titanic$Cabin)

titanic$Cabin


  
  
  
  
  
  
