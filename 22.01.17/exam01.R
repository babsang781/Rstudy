id <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
grade <- c(1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5)
mid <- c(20,23,26,11,22,29,34,37,15,14,26,15,24,24,33,19,11,27,34,21)
fin <- c(33,39,21,11,16,12,30,29,26,25,27,25,11,10,33,25,18,33,21,34)
install.packages("dplyr")
library(dplyr)

score <- data.frame(id, grade, mid,fin)
# 각 반별로 묶어 주는 방법 group_by()
# group_by()와 함께 summarise() 함수를 같이 사용

score %>% group_by(grade) %>% summarise(m_mid=mean(mid))

score %>% group_by(grade) %>% summarise(m_a=n(mid))

# dataframe 합치기
# 4 종류 inner/ full/ left/ right join

mid<-data.frame(id = c(101,102,103,104,105), mid=c(60,80,70,90,85))
fin<-data.frame(id = c(103,104,105,106,107), fin=c(70,83,65,50,75))

#inner_join : 기준 컬럼이 교집합인 것만
inner_join(mid,fin,by="id")

# full_join : 두 개의 데이터 프레임을 다 합하고 빈칸은 NA결측치
full_join(mid,fin,by="id")

# left_join : 왼쪽 기준 병합
left_join(mid,fin,by="id")

# right_join : 오른쪽 기준 병합
right_join(mid,fin,by="id")

# 데이터 합치기 bind_rows()
mid2 <-data.frame(id = c(106,107), mid=c(85,77))
mid
mid2

bind_rows(mid, mid2) # 기본함수 merge와 기능은 똑같음.


#실전, 항공데이터 분석하기!
install.packages("hflights")
library(hflights)
dim(hflights)
View(hflights)

# 비행기 번호판별 가장 오래걸린 출발시간 출력
head(hflights %>% group_by(TailNum) %>% 
  summarise(max(DepTime, na.rm=T)))

# 결항 많았던 날
hflights %>% group_by(CancellationCode)%>%
  summarise(n=n())

# 결항 사유가 날씨(B) 이거나 기류상황(C)인 데이터만 
hflights %>% filter(CancellationCode=='B' | CancellationCode=='C' )

#월별 데이터+ 내림차순
hflights %>% filter(CancellationCode=='B' | CancellationCode=='C' ) %>% group_by(Month)%>% summarise(n=n()) %>% arrange(desc(n))

hflights %>% filter(CancellationCode=='B' | CancellationCode=='C' ) %>% group_by(Month=2, DayofMonth)%>% summarise(n=n()) %>% arrange(desc(n))

hflights %>% filter(CancellationCode=='B' | CancellationCode=='C' ) %>% group_by(Month, DayofMonth)%>% summarise(n=n()) %>% arrange(desc(n))

#연습
hflights %>% group_by(UniqueCarrier) %>% summarise(n()) # 항공사별 수
hflights %>% group_by(DayOfWeek) %>% summarise(n()) # 요일별
hflights %>% group_by(Origin) %>% summarise(n()) # 출발지별
hflights %>% group_by(Dest) %>% summarise(n=n()) %>% arrange(desc(n)) # 도착지별 총 106곳+ 운항 제일 많은 순서(내림차순)
hflights %>% group_by(Dest) %>% summarise(mean(Distance))

# 
list.files()
library(readxl)
score2<-read_xlsx("score.xlsx")


# 결측치를 파악하는 함수
is.na(score2)

# 
table(is.na(score2))

# 속성(컬럼)별 na의 개수 출력  # 오...
summary(score2)
score2
# filter 를 활용하여 mid 안에 결측치가 없는 행만 출력
score2 %>% filter(mid != 'NA')
# score2 %>% filter(mid != NA)  에러
score2 %>% filter(!is.na(mid) & !is.na(fin) & !is.na(assign)& !is.na(att))

# 같은 거
score2 %>%na.omit()

median(score2$mid, na.rm=T)

# replace 실패 1000개 씩 나옴
# 힌트 mutate 할 때 썼던 거
score2<-score2 %>% mutate(mid2= ifelse(is.na(mid),median(score2$mid, na.rm=T), score$mid ))
score2

# 문제2 이상치> 중앙값으로 바꾸기
boxplot(score2)
score2 %>% mutate(mid3= ifelse(score2$mid2 > 100, 25, score$mid2 ))

score2 %>% mutate(fin2= ifelse(is.na(fin),25, score$fin ))
median(score2$fin, na.rm=T)

