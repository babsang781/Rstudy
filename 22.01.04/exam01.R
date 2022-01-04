# 동일한 자료 가 일차원으로 나열되 ㄴ것
vec1 <- c(10,20,30,40,50)

vec2 <-c("사과", 100,T)
vec2  # 문자가 하나라도 있으면 문자로 통일시킴

vec3 <-c(100.3, 33, T,F)
vec3  # T, F 가 1 과 0 으로 변환, 숫자로 통일시킴

# 데이터 프레임 
#: 다양한 데이터 타입을 저장할 수 있는 2 차원의 자료구조 
# 행을 기준으로 보면 들어간 데이터 타입이 다를 수 있음.
# 하지면 열을 기준으로 들어간 데이터 타입은 동일함. 
# 세로형태의 Vector 가 붙어있는 것이라고 보면 됨.
# 열(column) 과 행 (row) 로 구분되어 있음.

#실습 벡터 만드렁서 붙이기

v_no <-seq(1,7)
v_name <-c("Apple","Peach","Banana","Grape","Kiwi","Orange","Mango")
v_price <-c( 500,200,100,300,150,250,450)
v_stock <-c(5,2,4,7,5,3,8)

#데이터프레임 만드는 방법: data.frame( v_, v_, ...) 
sales <- data.frame(v_no, v_name, v_price, v_stock)
sales

# 자료구조를 좀 더 괜찮게 보는 방법: View
View(sales)

# DataFrame 에서 원하는 데이터만 조횟핫기
# sales 데이터프레임에서 v_name 값만 뽑아서 보기
sales$v_name

#df[c,r] : 형태로 특정 위치 출력 가능
sales[3,2]

sales[3,] # 행 전체가 출력  : 데이터 프레임 형태 출력

sales[,3] # 열 전체가 출력  : 벡터터 형태 출력

#컬럼 개수: ncol(var)
ncol(sales)
sales[1, 3:ncol(sales)]

#행개수: nrow(var)
nrow(sales)
sales[1, 3:nrow(sales)]

#dataframe에서 컬럼 이름만 추출하기 names(var)
names(sales)

# 다양한 함수를 데이터 프레임에 적용하기
sum(sales$v_price)
mean(sales$v_price)
round(mean(sales$v_price),digits =2)

min(sales$v_price)
max(sales$v_price)
range(sales$v_price)

# 실습 9문제
No <-1:10
Name <- c("이은비","김서아","장하윤","유이서","나서윤","이지안","박나은","황유나","김하율","윤시아")
Kor <-c(80,76,26,61,44,19,53,81,26,64)
Eng <- c(8,76,69,18,82,56,48,14,73,83)
Math <- c(65,27,100,76,37,77,73,19,74,60)
Score<-data.frame(No, Name,Kor,Eng, Math)
View(Score)
Score$Kor
Score$Eng

ncol(Score)
nrow(Score)
names(Score)

round(mean(Score$Kor),digits = 1)
max(Score$Eng)
min(Score$Math)



# 요리재료 구하기, csv 파일, 엑셀파일 불러오기


# 불러올 파일 저장 / 파일경로 확인 / 패키지 설치하기
# 패키지 로딩 / 함수 호출하여 파일 불러오기 / dataframe 저장

# 내가 작업하는 공간( working directory ) 에 확인
list.files()

# 패키지 다운로드, 웹에서 다운 받는 것:딱 한번 
install.packages("readxl")

# 패키지를 로딩하여 사용하기 : 로딩은 프로그램 쓸 떄마다 해야함.(재부팅 등)
library(readxl)

score <- read_excel("score.xlsx")
# 시트가 2 개 이상일 때,  read_excel("score.xlsx", sheet="이름")

#csv 파일 읽어와서 데ㅣ터 프레임 형태로 저장
titanic <- read.csv("titanic.csv")

View(titanic)

list.files(tit)









