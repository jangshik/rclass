#### .=========.####
#### | [[ Week 1 ]] ####
#### .=========.####

#### 0. 수업 개요 ####
#### __ [01] 들어가며 ####

#### __ [02] 데이터 기반의 의사결정의 필요성 ####

#### __ [03] 관련 언어 및 도구 ####

#### .==================. ####

#### 1. 분석 사례 소개 ####
#### __ [01] 일상 속 데이터 분석 ####

#### .==================. ####

#### 2. 데이터 리터러시 ####
#### __ [01] 실습 문제 ####
#### _____ ● Q1-1: 통계 #####
# 특정 회사의 급여 수준을 논할 때 평균 연봉을 주로 언급한다.
# 여기서 평균 연봉을 대표값으로 사용하는 것은 적절한가?


#### _____ ● Q1-2: 시각화 #####
# 변수가 5개인 하나의 데이터세트를 시각화 한다고 하자.
# 이 때 4개의 그래프로 그리는 것과 1개의 그래프로 그리는 것은
# 어떤 차이가 있는가?


#### _____ ● Q1-3: 자연어 처리 #####
# 한국어는 영어나 일본어에 비해 분석하기 까다롭다고 한다.
# 그 이유를 고민해보고 나름의 의견을 제시하라.


#### _____ ● Q2: 그래프 #####
# 아래 그래프는 몇 차원 그래프라고 할 수 있는가?


#### _____ ● Q3: 그래프 #####
# 아래 그래프로부터 얻을 수 있는 정보를 모두 기술하시오.



#### .==================. ####

#### 3. R 기초 ####
#### __ [01] 개요 ####
#### __ [02] 설치 ####
#### __ [03] 프로그램 시작하기 ####
#### ____ ● 단축키 ####
# 실행: [Ctrl] + [Enter]
# 새 파일 열기: [Ctrl] + [o]
# 스크립트 저장: [Ctrl] + [s]
# 주석 처리: [Ctrl] + [Shift] + [c]
# 스크립트창 이동: [Ctrl] + [1]
# 콘솔창 이동: [Ctrl] + [2]
# 콘솔창 클리어: [Ctrl] + [l]
# 문서 개요 확인: [Ctrl] + [Shift] + [o]

#### __ [04] 명령어의 이해 ####
#### ____ ● 명령어 입력 ####


#### ____ ● 명령어 실행 ####


#### __ [05] 연산자 ####
#### ____ ● 할당 연산자 ####

# X=1 X에 1을 대입
# X <- 1
# X <<- 1 X에 1을 대입(함수내에서 활용)
# 1 -> X  X에 1을 대입
# 1 ->> X X에 1을 대입(함수내에서 활용)

#### ____ ● 산술 연산자 ####
# 
# %/% modulo 정수나눗셈
# %% remainder 정수나눗셈 나머지
# ^or ** 제곱

#### ____ ● 논리 연산자 ####
# == 같음
# != 같지않음
# & 논리곱(Logical AND)
# | 논리합(Logical OR)
# ! 논리부정 (Logical NOT)

# "감자"=="고구마"
# "감자" !="고구마"
# floor(24.51)
# round(24.51, -1)
# round(26.51, -1)
# factorial(4)
# seq(from =1, to=3)
# seq(from =1, to=3, by =1.2)
# rep(1:3, 3)
# seq(from = 1, to=3, length.out=8)

#### __ [06] 기초 산술 함수 ####
#### ____ ● 산술 함수 ####
# 프롬프트(>)는 제외하고 입력합니다!
# 삼각함수


# 어림하기


# 팩토리얼

#### ____ ● 수열 생성 ####
# 특수기호(:)를 사용한 숫자 생성


# seq() 함수를 사용한 숫자 생성


# rep() 함수를 사용한 숫자 생성

#### __ [07] 기본 자료형 ####
#### ____ ● 원소 속성 ####
# ▶ 수치형(numeric): 숫자로 이루어져 있으며 정수(integer)와 실수(double)를 포함
# ▶ 문자형(character): 문자로 이루어져 있으며 그 길이에 관계없이 형식이 같음
# ▶ 팩터형(factor): 명목/순서형 변수
# ▶ 논리형(logical): TRUE와 FALSE. 즉 참/거짓 을 나타내는 형식

#### ____ ● 특수 유형 ####
# ▶ NA: 결측값(missing value, 값이 존재하지 않음)
# ▶ NULL: 데이터 유형과 자료의 길이도 0인 비어있는 값
# ▶ NaN: 수학적으로 정의가 불가한 수
# ▶ Inf: 무한값(infinite)

#### ____ ● 객체 구조 ####
# 벡터 - c()
c(1, 2, 3)
c(1, 2, "a") ##문자가 우선됨. 전체 문자
aa=c(1,2,3) #aa라는 객체에 1,2,3을 저장함.
aa[2]
aa[3] = "b"
aa[1:2]
aa[c(1,3)]
aa

# 행렬 - matrix() 
matrix(1:6)
matrix(1:6, nrow=2) #n(umber)ofrows -> 
matrix(1:6, ncol=2) #n(umber)ofcolumns -> 
matrix(1:6, nrow=2, byrow=TRUE) #byrow -> 원소 row먼저 채움
mat=matrix(1:6, nrow=2, byrow=TRUE)
mat
# 데이터 프레임 - data.frame()
data.frame(aa=1:3,
           bb = c("a", "b", "c"))

df = data.frame(aa= 1:3,
                bb=c("a", "b", "c"))
df
df[,1]
df[1,]
# 리스트 - list()
list(aa=1:4,
     bb=matrix(1:9, nrow=3),
     cc=list(dd=1:3,
             ee=letters[2:4]))
listt = list(aa=1:4,
                bb=matrix(1:9, nrow=3),
                cc=list(dd=1:3,
                        ee=letters[2:4])) ##letters객체의 2~4(b,c,d)
listt
listt$aa ## $는 of의 개념 -> listt의 aa
listt$bb
listt$cc
listt$cc$dd
listt$cc$dd[1]
listt$cc$ee



install.packages("imager")
#### ____ ● 자료구조 - 이미지 ####
library("imager")
img = load.image("sample_cat_image.jpg")
plot(img)
dim(img)
img[1:5, 1:5 ,,1]
img[,,,1] =1 - img[,,,1]
img[,,,2] =1 - img[,,,2]
img[,,,3] =1 - img[,,,3]
plot(img)

plot(img)

#### ____ ● 자료구조 - 웹페이지 ####
web = readLines("sample_webpage_text.txt")

#### __ [08] 패키지 ####
#### ____ ● 개요

#### ____ ● 패키지 설치(인터넷 O) ####
# install.packages("beepr")

#### ____ ● 패키지 설치(인터넷 X) ####
# https://cran.r-project.org/

install.packages("beepr")
library("beepr")
beep(5)
#### ____ ● 패키지 불러오기 ####

#### ____ ● 유용한 패키지 ####
# ▶ 데이터 조작 및 처리: dplyr, reshape2, data.table
# ▶ 그래프 등 시각화 관련: ggplot2, ggmap, ggvis, lattice, plotly
# ▶ 데이터 분석 등 기계학습 관련: CART, e1071, C50, DMwR
# ▶ 시계열 데이터 처리: lubridate, xtm
# ▶ 텍스트 처리: splitstackshape, KoNLP
getwd() #작업폴더 경로확인
setwd("bank")
setwd("..")
getwd()
aws=read.delim("AWS_sample.txt",sep="#", stringsAsFactors = FALSE)
head(aws)
tail(aws)
str(aws) #structure
summary(aws)
nrow(aws)
ncol(aws)
dim(aws)
colnames(aws)
names(aws)

install.packages("ggplot2")

#### ____ ● 재미난 패키지 ####


#### __ [09] 데이터 입력 ####
#### ____ ● 작업폴더(working directory) ####

#### ____ ● 작업폴더 확인과 설정 ####
# 작업폴더 확인 - getwd()

# 작업폴더 설정 - setwd()

#### ____ ● 데이터 가져오기 실습 - 특정 구분자 ####


#### __ [10] 데이터 확인 ####
#### ____ ● 상/하단 행 확인 ####
# head()

# tail()

#### ____ ● 객체 구조 및 변수별 기술통계 확인 ####
# str()

# summary()

# nrow()

# ncol()

# dim()

# colnames()

#### __ [11] 데이터 추출 ####
#### ____ ● 행과 열 ####

#### ____ ● '$'를 사용한 데이터 추출 ####


#### ____ ● 벡터연산을 사용한 데이터 추출 - 행 ####


#### ____ ● 벡터연산을 사용한 데이터 추출 - 열 ####


#### ____ ● 벡터연산을 사용한 데이터 추출 - 행열 ####
aws$TA ## $를 이용한 데이터 추출
aws$TA[961]
aws[c(2, 135, 3:10),]
aws[,c(1,3)] ##비워두면 전체
aws[1:50,3:4]
aws[,"Wind"]
aws[2:5, c("TA","Wind")]
aws[1,] = -1
aws[1,]
aws[1:2,] = -33
aws[1:5, 1:5]
aws["6",] = -4
head(aws)
aws[c(1:2, 6),] = -6666
head(aws)
aws[1:4, -3] ## 3번째 열을 뺌
head(aws)
aws[,6] = "new"
head(aws)
aws[,ncol(aws)+1] = "neuuuuuw"
head(aws)
aws[,"last_one"] = 12345
head(aws)
#### __ [12] 데이터 치환/삽입 ####
#### ____ ● 벡터연산을 사용한 데이터 치환 ####
# ※ 순서대로 입력하세요.


#### ____ ● 벡터연산을 사용한 데이터 삽입 ####

# Q. column 명을 바꿔봅시다.
colnames(aws)[colnames(aws)=="v6"] <- "aa"
head(aws)
colnames(aws)[6]<-"aa"
head(aws)
colnames(aws)[7]="bb"
haed(aws)
head(aws)
colnames(aws)
colnames(aws)[c(6,7)]=c("AA", "BB")
aws[,"last_one"] = "asdf"
head(aws)

#### __ [13] 데이터 병합 ####
#### ____ ● bind 함수를 사용한 데이터 병합 ####
aaa = aws[10:13, 3:4]
bbb = aws[20:23, 3:4]
aaa
bbb
ccc = aws[24:30, 1:2]
ccc
# cbind()
cbind(aaa,bbb) #column bind 옆으로 붙임
cbind(aaa,ccc) #달라서 안댐
# rbind()
rbind(aaa,bbb) #row bind 밑으로 붙여나감 형식, 갯수 같아야함.
rbind(aaa,ccc) # 이름 달라서 안됨
#### __ [14] 데이터 요약 ####
#### ____ ● 개요 ####
# ▶ str(): 객체 구조 확인
# ▶ summary(): (2차원) 객체의 변수별 기술통계량 확인
# ▶ length(): 1차원 객체의 길이 계산
# ▶ unique(): 1차원 객체의 고유 원소 추출
# ▶ quantile(): 1차원 객체의 분위수 계산
# ▶ nrow(): 2차원 객체의 row 개수 계산
# ▶ ncol(): 2차원 객체의 column 개수 계산
# ▶ table(): 객체의 고유 원소 개수 계산
# ▶ aggregate(): 조건에 따른 요약 정보 계산
# ▶ apply(): (2차원) 객체의 row 또는 column 기준 일괄 계산
library("ggplot2")
data("diamonds",package="ggplot2")
head(diamonds,3)
table(diamonds$cut, diamonds$clarity) # cut ideal, clarity SI2 2598회
table(diamonds$cut)
prop.table(table(diamonds$cut))
prop.table(table(diamonds$cut)) * 100
round(prop.table(table(diamonds$cut)) * 100, 2)
tb=table(diamonds$cut, diamonds$clarity)
tb
prop.table(tb)
prop.table(tb,margin =1) ##margin 1은 row의합 1
prop.table(tb,margin =2) ##margin 2는 column의합 1

sum(tb)==nrow(diamonds)
#### ____ ● table() 함수를 사용한 표 만들기 ####
# install.packages("ggplot2")


#### ____ ● 데이터 준비 ####
data("airquality")
df=airquality
head(df,2)


#### ____ ● 함수의 활용 ####
# unique()
unique(df$Month) #Month에 중복자료 제거 
length(unique(df$Month)) #5개(5,6,7,8,9) -> ex)몇개월치인지
length(c(2,4,6)) # 1차원객체?? 원소?? 뭐야이건

# quantile()
quantile(df$Wind) #dd
quantile(df$Wind, probs = 0.01) #하위1프로
quantile(df$Wind, probs = 0.99)
quantile(df$Wind, probs = c(0.05, 0.95))
#### __ [15] 문자열 데이터 처리 ####
#### ____ ● 기본 처리 ####
# 데이터 준비
sample = data.frame(aa = c("abc_sdfsdf", "abc_KKdfsfsfs", "ccd"),
                    bb = 1:3,
                    stringsAsFactors = FALSE)
sample






# 문자 개수 세기
nchar(sample[1,1])
# 특정 문자 위치 확인
which(sample[,1] =="ccd") #ccd의 위치찾기
# 대소문자 변환
toupper(sample[1,1]) #대문자로
tolower(sample[2,1]) #소문자로
which(c(TRUE,FALSE,TRUE))
#### ____ ● 응용 ####
install.packages("splitstackshape")
# install.packages("splitstackshape")
library("splitstackshape")
# 문자열 분리
# cSplit <- S 대문자 입니다.
cSplit(sample, splitCols = "aa", sep="_") #sep 은 _ 기준으로 분리
cSplit(sample, splitCols = "aa", sep="_", drop=FALSE) #drop은 기존자료도유지
# 문자 결합
paste0(sample[,1], sample[,2]) # 0은 사이공간없이 뙇 붙임
paste(sample[,1], sample[,2]) #그냥때리면 스페이스들어감
paste(sample[,1], sample[,2], sep=" 이렇게분리됨 ") #구분자에 sep넣음
paste("010", "1111", "2222", sep = "-")
paste("010", "1111", "2222", collapse = "-")
paste(c("010", "1111", "2222"), sep = "-")
paste(c("010", "1111", "2222"), collapse = "-")

# 특정 위치 문자 추출
substr(sample[,1],1,4) #1번째부터 4번째 글자까지, 1열에
substr(sample$aa, 1,2)
sample



#### __ [16] 반복문 조건문 ####
#### ____ ● 반복문 - for() ####
# for() 함수
for(number in 1:3){
  print(number)
}
for(number in c(1,3,9)){
  print(number)
  Sys.sleep(1) # 1초쉬고 또
}
for(num in 3:6){
  print(num*num)
}

# 데이터 준비
df_1 = data.frame(aa = c("a", "b", "c", "d"),
                  bb = 1:4)
df_1

# 응용
for(num in 2:5){
  df_1[num, "new_column"] = num*2 # num번째 row에 "new_column"컬럼에
}
df_1
#### ____ ● 조건문 - if() ####
# if() 함수

n=3
if(n==3){
  print("n은 3입니다")
}else{
  print("n은 3이 아닙니다.")
}
n=5
if(n==3){
  print("n은 3입니다")
}else{
  print("n은 3이 아닙니다.")
}

# 데이터 준비
df_1 = data.frame(aa = c("a", "b", "c", "d"),
                  bb = 1:4)
df_1

# 응용
for(n in 1:4){
  if(n>=3){
    print(df_1[n, "bb"])
  }else{
    print("응응?")
  }
  }

#### ____ ● 조건 연산자 ####
# 데이터 준비
df_1 = data.frame(aa = c("a", "b", "c", "d"),
                  bb = 1:4)

# 실습
df_1[df_1$bb >= 3,] #bb의 row 3이상
df_1[df_1$aa == "b",] #b가 있는애만
df_1[df_1$aa != "b",] #b가 없는애만
df_1[(df_1$bb == 1) & (df_1$bb == 4), ] 
df_1[df_1$bb %in% c(1,4), ]
#### __ [17] 파일 입출력 ####
#### ____ ● 파일 불러오기 ####
df = read.csv("bike.csv")
head(df,2)

library("data.table")
df = fread("bike.csv") #fread 빠르게읽긔
head(df,2)

library("data.table")
df = fread("bike.csv", nrows=4, select=c(1:3, 5), skip=1) #fread 빠르게읽긔
df

#### ____ ● 다양한 데이터 불러오기 ####
# life_expectancy

# population_country

# rating_chocobar

# rating_ramyun

# store_apple

#### ____ ● 파일 저장하기 ####
install.packages("readr")
install.packages("xlsx")
write.csv(df, "write_csv_basic.csv", row.names=FALSE) #row.names=FALSE
library("readr")
write_tsv(df, "write_tsv.txt")

library("xlsx")
write.xlsx(df,"write_xlsx.xlsx")
