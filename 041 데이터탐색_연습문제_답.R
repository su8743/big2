#==================================================
# 연습문제 : 타이타닉 데이터 탐색적 분석하기
#==================================================

rm(stat_fn)

# 1. 타이타닉 데이터 불러온 후 구조를 살펴보세요.
str(titanic.0)
rm(stat_fn)
# 1단계 : 각각 변수의 분포를 확인------------------
# 2. 숫자형 변수들에 대해서 기초 통계량을 뽑아보세요.
source("stat_fn.R")
sapply(titanic.0[sapply(titanic.0, is.numeric)], stat_fn)

# 3. 2에서 뽑은 숫자형변수의 기초통계량을 보고 각각의 분포에 대해서 설명해보세요.


# 지금부터는 ggplot2패키지의 qplot 함수를 이용하세요.
# 4. 숫자형 변수에 대해서 각각 히스토그램을 그려보세요.
library(ggplot2)
qplot(Age, data = titanic.0, geom = "histogram"
      ,bins = 20)
qplot(Fare, data = titanic.0, geom = "histogram"
      ,bins = 30)

# 5. 숫자형 변수에 대해서 각각 density plot을 그려보세요.
qplot(Age, data = titanic.0, geom = "density")

# 6. 위 3에서 설명한 내용과 4,5번의 분포가 일치하는지, 그렇지 않다면 이유는 무엇인지 설명해보세요.


# 7. 범주형 변수에 대해서 table(), prop.table()를 이용하여 분포와 비율을 확인 하세요.
str(titanic.0)
table(titanic.0$Survived)
prop.table(table(titanic.0$Survived))

table(titanic.0$Pclass)
prop.table(table(titanic.0$Pclass))


# 8. 범주형 변수에 대해서 각각 bar chart를 그려보세요.
qplot(Pclass, data = titanic.0, geom = "bar")
qplot(Embarked, data = titanic.0, geom = "bar")

# 9. 범주형 변수의 분포를 보고 파악한 내용을 적어 봅시다.


# 10. 각 변수들에 대해서 NA를 한눈에 파악해 봅시다.
library(Amelia)
missmap(titanic.0, col=c("yellow", "black"), legend=FALSE)


# 2단계 : 종속변수와의 관계 파악하기 -----------------
# 11. 연속형 변수에 대해서, 생존여부(종속변수)로 구분되는 히스토그램과 density plot을 그려보세요.
qplot(Age, data = titanic.0, geom = "histogram"
      , fill = Survived)
qplot(Age, data = titanic.0, geom = "density"
      , colour = Survived)
qplot(Fare, data = titanic.0, geom = "histogram"
      , fill = Survived)
qplot(Fare, data = titanic.0, geom = "density"
      , colour = Survived)

# 12. 연속형 변수와 종속변수와 어떤 관계가 있는지 설명해보세요.


# 13. 범주형 변수에 대해서, 종속변수와의 관계를 table(), prop.table()함수를 이용하여 살펴보세요.
table(titanic.0$Survived, titanic.0$Sex)
prop.table(table(titanic.0$Survived, titanic.0$Sex))
table(titanic.0$Survived, titanic.0$Pclass)
prop.table(table(titanic.0$Survived, titanic.0$Pclass))
# 14. 범주형 변수에 대해서, 종속변수와의 관계를 bar plot를 이용하여 살펴보세요.
qplot(Sex, data = titanic.0, geom = "bar"
      , fill = Survived)
qplot(Pclass, data = titanic.0, geom = "bar"
      , fill = Survived)

# 15.범주형 변수에 대해서, 종속변수와의 관계를 mosaic 패키지를 이용하여 살펴보세요.
library(mosaic)

mosaicplot(Survived ~ Sex  + Pclass + Embarked, data = titanic.0, color = TRUE)


# 16. 종속변수와 관련있다고 판단되는 범주형 변수는 무엇인가요?


# 3단계 : 독립변수들 간의 관계
# 17. 연속형 변수들간의 상관성을 확인하세요.
cor(titanic.0[,c(6,10)])
pairs(titanic.0[,c(6,10)])
str(titanic.0)

# 18. 이제 알고리즘에 Input으로 사용할 독립 변수 후보들을 각자 선정해 봅시다.

