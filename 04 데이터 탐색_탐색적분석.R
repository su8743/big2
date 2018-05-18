rm(list=ls())
#==================================================
# 5.1 문제 정의
#==================================================
# Mission : Titanic 생존자를 찾아라!


# 타이타닉 데이터 불러오기 -----------------------------------------------------------

getwd()
titanic <- read.csv("titanic.csv")
str(titanic)
head(titanic)

titanic.0 <- read.csv("titanic.csv" 
                      , stringsAsFactors = F 
                      , header = T
                      , na.strings=c("","NA","Unknown"))

# na.strings=c("","NA"): 읽을 때 "", "NA"는 NA로 처리
str(titanic.0)

#==================================================
# 5.2 데이터 탐색
#==================================================
# Sex, Survived, Embarked, Pclass은 factor 형식으로 변경하자.
titanic.0$Sex <- as.factor(titanic.0$Sex)
titanic.0$Survived <- as.factor(titanic.0$Survived)
titanic.0$Embarked <- as.factor(titanic.0$Embarked)
titanic.0$Pclass <- as.factor(titanic.0$Pclass)
str(titanic.0)

# 5.3 기초 통계량 ----------------------------------------------------------------

# 숫자형 변수
stat_fn <- function(x) {
    c(n = length(x), na.count = sum(is.na(x))
      , min = min(x, na.rm = T)
      , qt1st = quantile(x, 0.25,na.rm = T)
      , median = median(x, na.rm = T)
      , mean = mean(x, na.rm = T)
      , qt3st = quantile(x, 0.75,na.rm = T)
      , max = max(x, na.rm = T)
      , range = max(x, na.rm = T) - min(x, na.rm = T))
}

sapply(titanic.0, is.numeric)
sapply(titanic.0[sapply(titanic.0, is.numeric)], stat_fn)


# 값 분포 확인하기.
hist(titanic.0$Fare, breaks = 50)
hist(titanic.0$Age)
hist(titanic.0$Age, breaks = 16)
plot(density(titanic.0$Fare))
plot(density(titanic.0$Age, na.rm = T))


#범주형 변수
str(titanic.0)
table(titanic.0$Sex)

prop.table(table(titanic.0$Sex))

table(titanic.0$Sex, titanic.0$Survived)

prop.table(table(titanic.0$Sex,titanic.0$Survived))
prop.table(table(titanic.0$Survived))

# 범주형 변수 값 분포 확인하기
install.packages("mosaic")
library(mosaic)

mosaicplot(Survived ~Sex  + Pclass
           , data = titanic.0, color = TRUE)
mosaicplot(Survived ~Sex  + Pclass + Embarked, data = titanic.0, color = TRUE)

?mosaicplot
# 5.4 결측치 NA --------------------------------------------------------------------
is.na(titanic.0)
colSums(is.na(titanic.0))

install.packages("Amelia")
library(Amelia)

missmap(titanic.0, col=c("yellow", "black"), legend=FALSE)

# 5.5 이상치 -----------------------------------------------------------------------

boxplot(titanic.0$Age)

# 5.7 변수간의 상관성 확인 ---------------------------------------------------------
library(ggplot2)
head(iris)
iris[1:3,1:2]
cor(iris[,1:4])
pairs(iris[,1:4])
cor(iris[,3:4])
plot(iris$Petal.Length, iris$Petal.Width)

qplot(Petal.Length, Petal.Width, data = iris, geom = c("point", "smooth"))


