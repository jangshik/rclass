#### .=========.####
#### | [[ Week 2 ]] ####
#### .=========.####

# 하나씩 실행시키세요.
install.packages("lubridate")
install.packages("reshape2")
install.packages("sqldf")
install.packages("dplyr")
install.packages("data.table")
install.packages("ggplot2")
install.packages("plotly")
install.packages("networkD3")

library("lubridate")
library("reshape2")
library("sqldf")
library("dplyr")
library("data.table")
library("ggplot2")
library("plotly")
library("networkD3")

#### 1. 1주차 복습 ####

#### 2. 업무 자동화의 첫 걸음 ####
#### __ [01] 반복문에 살붙이기 ####
#### ____ ● 진행상황을 보여주는 반복문 ####
# 기본

# 응용

#### __ [02] 다수 파일 관리 ####
#### ____ ● 폴더 100개, 파일 300개 ####
# 폴더 + 파일 생성
source("data_generator_folders_files.R")

file_list = list.files(path = "Item_19274_DB/",
                       recursive = TRUE,
                       full.names = TRUE)
file_list[1:5]


#### ____ ● Markdown ####
# 굵게: **word** 또는 __word__
# 기울임: *word* 또는 _word_


#### 3. 실력 Jump up! ####
#### __ [01] 시간 데이터 처리 ####

#### ____ ● 시간 데이터 생성 ####
# as.POSIXct() 함수 활용

# 시스템 시간 호출

# seq() 함수 활용

# Q. 격일로 출력하려면?

#### ____ ● 시간 데이터 추출 ####
# 내장함수 활용 

# 패키지(lubridate) 활용

#### __ [02] 속성 확인 ####
#### ____ ● 용례 ####

#### ____ ● 예제 - 원소 ####

#### ____ ● 예제 - 객체 ####

#### __ [03] 속성 변환 ####
#### ____ ● 용례 ####

#### ____ ● 예제 - 원소 ####

#### ____ ● 예제 - 객체 ####

#### ____ ● 예제 - table ####

#### __ [04] Pivoting ####
#### ____ ● 준비 ####
# 데이터 & 패키지 준비 

#### ____ ● melt() ####

#### ____ ● cast() ####

#### ____ ● 행렬관련 함수의 활용 ####


#### __ [05] 반복문 대체 ####
#### ____ ● 개요 ####

#### ____ ● ifelse() ####
df = data.frame(aa = 1:2,
                bb = c("a", "b"))


#### ____ ● ifelse() 예제 ####


#### ____ ● apply() ####
# 데이터 준비
data("iris")
df = head(iris[, 1:4])

#### ____ ● apply() ####


#### ____ ● apply() 예제 ####


#### ____ ● sapply() ####


#### __ [06] 데이터 병합 ####
#### ____ ● join ####
# left join

# inner join

#### ____ ● 데이터 준비 ####
source("data_generator_join.R", encoding = "UTF-8")


#### ____ ● SQL 문법 ####
library("sqldf")

# Left join

# Inner join

#### ____ ● dplyr 패키지 ####
library("dplyr")

# Left join

# Inner join

#### __ [07] 효율적인 코드 작성 ####
#### ____ ● 가독성 ####

#### ____ ● Dirty Code ####

#### ____ ● 다양한 Style Guide ####

#### ____ ● 욱킴의 Style Guide ####

#### ____ ● Script file 관리 ####

#### ____ ● 캡슐화 ####

#### ____ ● RStudio 기능 활용 ####

#### ____ ● 사용자 정의 함수 활용 ####

#### ____ ● Script file의 분할 ####

#### ____ ● 예시 ####

#### ____ ● Project 생성 ####

#### __ [08] 사용자 정의 함수 ####
#### ____ ● 사용자 정의 함수 ####

#### ____ ● 예제 - 기본 ####
#### ____ ● 예제 01 ####
# 입력값을 받지 않는 함수

#### ____ ● 예제 02 ####
# 입력값을 그대로 출력하는 함수

#### ____ ● 예제 03 ####
# 입력값 단순 계산 함수

#### ____ ● 예제 04 ####
# 기본값이 지정 되어있는 함수

#### ____ ● 예제 05 ####
# 입력값이 두 개인 함수

#### ____ ● 예제 06 ####
# print() 함수를 활용한 함수

#### ____ ● 활용 실습 ####

#### ____ ● 시간 + 공간 복잡도 줄이기 ####
# ▶ 다음의 데이터에서 ‘result’ 라는 새로운 column을 생성하시오.
# ▶ apply() 함수를 활용하여 해당 column을 생성하시오.
# ▶ apply() 함수에서 연산을 담당하는 함수는 ‘cal_fun()’ 이라는 새로운 사용자정의 함수를 활용하시오.
# ▶ ‘cal_fun’ 함수는 입력된 모든 숫자를 제곱하고 그 값을 합한 이후에 지정된 자릿수에서 반올림 하도록 작성하시오.

#### 4. R려줘! 보여줘! 데이터 시각화 ####
#### __ [01] 고급 그래프 ####
library("ggplot2")
library("plotly")

gg = ggplot() + 
  geom_point(aes(x = 1:10,
                 y = 1:10),
             size = 10)
ggplotly(gg)

#### ____ ● 반응형 3D 그래프 ####
library("reshape2")
library("plotly")

x = seq(from = -4 * pi, to = 4 * pi, length.out = 100)
df = expand.grid(x = x, y = x)
df$r = sqrt(df$x^2 + df$y^2)
df$z = cos(df$r^2) * exp(-df$r/6)

data_z = acast(df, x ~ y, value.var = "z")
plot_ly(z = data_z, type = "surface")

#### ____ ● 반응형 네트워크 그래프 ####
library("networkD3")

src = c(rep("A",4), rep("B", 2), rep("C", 2), "D")
target = c("B", "C", "D", "J", "E", "F", "G", "H", "I")
networkData = data.frame(src, target)

simpleNetwork(networkData)

#### __ [02] 유용한 사이트 ####
# http://ggplot2.tidyverse.org/reference
# https://www.rstudio.com/resources/cheatsheets
# https://color.adobe.com
# http://www.color-hex.com/

#### __ [03] ggplot 시작하기 ####
#### ____ ● 산점도 ####
# 데이터 & 패키지 준비
data_point = data.frame(xx = 1:10,
                        yy = sample(1:10, 10))
library("ggplot2")

# 그래프
ggplot(data = data_point, aes(x = xx, y = yy)) + geom_point()
ggplot(data = data_point, aes(xx, yy)) + geom_point()


#### ____ ● 기초 문법 ####
# 스타일 1

# 스타일 2

#### __ [04] 기본 그래프 ####
#### ____ ● 선 그래프 ####

#### ____ ● 막대 그래프 ####
data_bar = data.frame(xx = 1:10,
                      yy = sample(1:3, 10, replace = TRUE))
data_bar

#### ____ ● 추가 기능####

#### __ [05] 다중 그래프 ####
#### ____ ● 선 그래프 ####
# 데이터 준비
line_df = data.frame(obs = 1:30,
                     var_1 = rep(c("A", "B", "C"), 10),
                     value = sample(1:100, size = 10),
                     stringsAsFactors = FALSE)
head(line_df)

library("ggplot2")

# 그래프 1

# 그래프 2

# 그래프 3

# 그래프 4

# 그래프 5

# 그래프 5 - 퀴즈: 코드를 조금 더 간결하게 바꾸시오.
# style 1

# style 2


#### __ [06] 색상 설정 Ⅰ ####
#### ____ ● 막대 그래프 ####
# 데이터 준비
bar_df = data.frame(obs = 1:10,
                    var = rep(c("A", "B", "C"), length.out = 10),
                    value = sample(1:100, size = 10),
                    stringsAsFactors = FALSE)
head(bar_df)

# 그래프 1

# 그래프 2

# 그래프 3

# 그래프 4

# 그래프 5

# 그래프 5 - 퀴즈: 그래프 4와 5의 차이점은?

# 그래프 6

# 그래프 7

#### __ [07] 색상 설정 Ⅱ ####
#### ____ ● 막대 그래프 ####
# 데이터 준비
color_df = data.frame(obs = 1:10,
                      var = rep(c("A", "B", "C"), length.out = 10),
                      value = sample(1:100, size = 10),
                      stringsAsFactors = FALSE)
head(color_df)

# 그래프 1

# 그래프 2

# 그래프 3

# 그래프 4

# 그래프 5

#### __ [08] 색상 설정 Ⅲ ####
#### ____ ● 선 그래프 ####
# 데이터 준비
color_df = data.frame(obs = 1:10,
                      var = rep(c("A", "B", "C"), length.out = 10),
                      value = sample(1:100, size = 10),
                      stringsAsFactors = FALSE)
head(color_df)

# 그래프 1

# 그래프 2

# 그래프 3

# 그래프 4

# 그래프 5

# 그래프 6

#### ____ ● 선 그래프 - 색상함수 활용####
# 그래프 1

# 그래프 2

# 그래프 3

# 그래프 4

# 그래프 5 - 중요!

