# 데이터 전처리할 때 사용하는 패키지 dplyr

# library 명령어 안 될 시, install.packages("dplyr")
library(dplyr)

# library 명령어 안 될 시, install.packages("readxl")
library(readxl)

list.files()

score<- read_excel("score_10차시.xlsx")
score

# dataframe 의 컬럼명을 바꾸는 함수 rename()
# 파이프 연산자 %>% ( 단축키 ctrl +shift +m)
score <- score %>% rename(id=학번, grade= 학년, mid = 중간고사, fin = 기말고사, assign = 과제제출, att = 출석점수)

score 

# 조건에 맞는 행만 추출하기 filter()
# dplyr 사용할 때는 대부분 '데이터 %>% ' 으로 시작
# 1. grade 가 1인 행만 출력하기
score %>% filter(grade==1)

# 1. grade 가 1이고, 중간고사가 25점 이상인 행만 출력
score %>% filter(grade ==1 & mid>25)
score %>% filter(grade ==1) %>% filter(mid>25)

# 원하는 컬럼만 추출하는 함수: select()
names(score)
score %>% select(grade)
summary(score %>% select(assign, mid, fin))

# 문제. 1학년 학생들의 중간점수와 기말점수만 출력하시오
score %>% filter(grade ==1) %>% select(id, grade,mid,fin)

score %>% select(assign, mid, fin) %>% summarise()

#정렬할 때 사용하는 함수 : arrange
score %>% arrange(desc(mid))
score %>% arrange(grade, mid, fin)

# 문제 2. 4학년 학생들의 기말고사 점수만 내림차순으로 출력력
score %>% filter(grade ==4) %>% arrange(desc(fin)) %>% select(fin)

score %>% filter(grade ==4) %>% arrange(desc(fin)) 

# 파생변수 만들기
score <-score %>% mutate(total = mid+fin+assign+att)
score %>% arrange(desc(grade, total))

score <-score %>% mutate(fp = ifelse(total>=60, "pass","fail"))
score






































