# 우측 하단 working directory
list.files()
titanic <- read.csv("titanic_2.csv")
titanic

# 데이터의 앞부분을 확인, default- 6개
head(titanic, 8)   # 위에서부터 8개 

# 데이터의 앞부분을 확인
tail(titanic)

# 데이터 속성별 자료형태 출력**
str(titanic)

# 데이터 속성별 통계량 출력 **
# 사분위수가 출력됨. 
summary(titanic)


# 참고 설명: 데이터 보기: 산술통계: 평균, 최고점, 최저점, 중앙값, 분산&표준편차(분산된 정도)
# 정렬 통계: 4분위수, 오름차순 정렬한 데이터의 집합에서 첫 사분위 값 1st qu
# 영어에서는 이런 것을 five number summary 라고 부름.
abab <-c(80,70,90,100,50 )
mean(abab)

# 사분위수를 시각화한 그래프 : boxplot()
boxplot(titanic$Fare)

# 데이터의 개수를 계산
table(titanic$Embarked)

# 데이터의 차원을 출력 
dim(titanic)

# 패키지 설치, 로딩, 단어와 빈도수를 dataFrame으로 정리,  wordcloud에 입력

# wordcloud2 패키지 설치 및 적용
install.packages("devtools")
library(devtools)
devtools::install_github("lchiffon/wordcloud2")
library(wordcloud2)

# wordcloud2를 그리는 방법
# 단어와 해당되는 빈도수를 데이터 프레임으로 만들면 끝

word<-c("강성돔","굴찜","대방어", "고등어","해삼")
fre <-c(30, 40, 80, 80, 60)

food<- data.frame(word,fre)
food

# 패키지 안의 함수 속성 보는 법: ??wordcloud2
wordcloud2(food, size=0.5, fontFamily = '궁서체', color='random-dark')
# 벡터형태 색깔 설정 가능 

??wordcloud2

# 구단 순위별 시각화
list.files()

baseball <- read.csv("baseball.csv")
baseball
bb<-data.frame(baseball$구단,(baseball$승)^4)
bb
wordcloud2(bb,size=0.3)

bb2<-data.frame(baseball$구단,승=(baseball$승)^4)
bb2
wordcloud2(bb2,size=0.3)

edu <- read.csv("대학 계열별 학과수 및 학년별 재적학생수.csv")
edu

# 1. 학과별 학과수 시각화
# 2. 학과별 재적학생수 시각화

str(edu)

q1 <-data.frame(edu$소계열,edu$학과수)
q2 <-data.frame(edu$소계열,edu$재적학생수)

wordcloud2(q1,size=0.3)
wordcloud2(q2,size=0.3)

#letterCloud(data=q1, word="io", wordSize=1,fontFamily='나눔바른고딕')

# Text Data 시각화 하기
# 형태 에 따르 분류 ppt 참고


# ppt 복습



#java, rjava 설치
install.packages('remotes')
remotes::install_github("mrchypark/multilinguer")
library(multilinguer)

install.packages('multilinguer')
library(multilinguer)
install_jdk()

#의존성 패키지 설치
install.packages(c("hash", "tau", "Sejong", "RSQLite", "devtools", "bit", "rex", "lazyeval", "htmlwidgets", "crosstalk", "promises", "later", "sessioninfo", "xopen", "bit64", "blob", "DBI", "memoise", "plogr", "covr", "DT", "rcmdcheck", "rversions"), type = "binary")


# github 버전 설치
install.packages("remotes")
library(remotes)

# KoNLP 설치
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

# 패키지 로딩하기
library(KoNLP)
# Checking user defined dictionary! # 이 메시지가 뜨면 성공!

v1="반짝이는 별빛들
깜빡이는 불 켜진 건물
우린 빛나고 있네
각자의 방 각자의 별에서 (eh oh)
어떤 빛은 야망
어떤 빛은 방황
사람들의 불빛들
모두 소중한 하나
어두운 밤 (외로워 마)
별처럼 다 (우린 빛나)
사라지지 마
큰 존재니까
Let us shine
어쩜 이 밤의 표정이 이토록 또 아름다운 건
Oh 저 별들도 불빛도 아닌 우리 때문일 거야
You got me
난 너를 보며 꿈을 꿔
I got you
칠흑 같던 밤들 속
서로가 본 서로의 빛
같은 말을 하고 있었던 거야 우린
가장 깊은 밤에 더 빛나는 별빛 (oh oh oh oh, oh oh oh, oh oh oh oh)
가장 깊은 밤에 더 빛나는 별빛 (oh oh oh oh, oh oh oh, oh oh oh oh)
밤이 깊을수록 더 빛나는 별빛
한 사람에 하나의 역사
한 사람에 하나의 별
70억 개의 빛으로 빛나는
70억 가지의 world
70억 가지의 삶 도시의 야경은
어쩌면 또 다른 도시의 밤
각자만의 꿈 let us shine
넌 누구보다 밝게 빛나
One
어쩜 이 밤의 표정이 이토록 또 아름다운 건
Oh 저 어둠도 달빛도 아닌 우리 때문일 거야
You got me
난 너를 보며 꿈을 꿔
I got you
칠흑 같던 밤들 속
서로가 본 서로의 빛
같은 말을 하고 있었던 거야 우린
가장 깊은 밤에 더 빛나는 별빛 (oh oh oh oh, oh oh oh, oh oh oh oh)
가장 깊은 밤에 더 빛나는 별빛 (oh oh oh oh, oh oh oh, oh oh oh oh)
밤이 깊을수록 더 빛나는 별빛
도시의 불, 이 도시의 별
어릴 적 올려본 밤하늘을 난 떠올려
사람이란 불, 사람이란 별로 가득한 바로 이 곳에서
We shinin'
You got me
난 너를 보며 숨을 쉬어
I got you
칠흑 같던 밤들 속에
Shine, dream, smile (shine, yeah)
Oh let us light up the night
우린 우리대로 빛나 ((oh oh oh oh, oh oh oh)
Shine, dream, smile
Oh let us light up the night
우리 그 자체로 빛나
Tonight"

extractNoun(v1)

useNIADic()

list.files()

# 벡터 형태 또는 문장 한 줄 한 줄 가능, 
news <- readLines("2021_11_29_기준 인공지능 뉴스제목 500개.csv")
news

# 명사 추출
news_noun <- extractNoun(news)

head(news_noun)   # 확인 

# 리스트 함수를 벡터로 변환하는 함수
news_unlist<- unlist(news_noun)
news_unlist

# 빈도수 체크해주는 거 table
result1 <- table(news_unlist)

# 빈도수 기준으로 정렬하면 빈도 큰 게 가운대로 옴
result2<-sort(result1, decreasing = T)

library(wordcloud2)
wordcloud2(result2, size=0.5)
wordcloud2(result2)
result3 <-result2[-1]
wordcloud2(result3,size = 0.5)

rea