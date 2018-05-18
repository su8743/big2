#==================================================
# 연습문제 : 타이타닉 데이터 탐색적 분석하기
#==================================================

rm(stat_fn)

# 1. 타이타닉 데이터 불러온 후 구조를 살펴보세요.
str(titanic.0)

# 1단계 : 각각 변수의 분포를 확인------------------
# 2. 숫자형 변수들에 대해서 기초 통계량을 뽑아보세요.
source("기초통계량_함수.R")

# 3. 2에서 뽑은 숫자형변수의 기초통계량을 보고 각각의 분포에 대해서 설명해보세요.
stat_fn(titanic.0$Fare)
stat_fn(titanic.0$Age)

# 지금부터는 ggplot2패키지의 qplot 함수를 이용하세요.
# 4. 숫자형 변수에 대해서 각각 히스토그램을 그려보세요.
hist(titanic.0$Fare, breaks = 50)
hist(titanic.0$Age, breaks = 50)

# 5. 숫자형 변수에 대해서 각각 density plot을 그려보세요.
plot(density(titanic.0$Fare, na.rm = T))
plot(density(titanic.0$Age, na.rm = T))

# 6. 위 3에서 설명한 내용과 4,5번의 분포가 일치하는지, 그렇지 않다면 이유는 무엇인지 설명해보세요.


# 7. 범주형 변수에 대해서 table(), prop.table()를 이용하여 분포와 비율을 확인 하세요.
table(titanic.0$Sex)
table(titanic.0$Sex, titanic.0$Survived)
prop.table(table(titanic.0$Sex, titanic.0$Survived))
# 8. 범주형 변수에 대해서 각각 bar chart를 그려보세요.
barchart(titanic.0$Sex)
boxplot(titanic.0$Age)
# 9. 범주형 변수의 분포를 보고 파악한 내용을 적어 봅시다.


# 10. 각 변수들에 대해서 NA를 한눈에 파악해 봅시다.
missmap(titanic.0, col=c("blue", "white"), legend=FALSE)

??cor
iris[1:3,1:2]
cor(iris[,1:4])
pairs(iris[,1:4])
cor(iris[,3:4])
plot(iris$Petal.Length, iris$Petal.Width)

qplot(Petal.Length, Petal.Width, data = iris, geom = c("point", "smooth"))

# 2단계 : 종속변수와의 관계 파악하기 -----------------
# 11. 연속형 변수에 대해서, 생존여부(종속변수)로 구분되는 히스토그램과 density plot을 그려보세요.
str(titanic.0)
hist(titanic.0$Age, titanic.0$Survived)

# 12. 연속형 변수와 종속변수와 어떤 관계가 있는지 설명해보세요.


# 13. 범주형 변수에 대해서, 종속변수와의 관계를 table(), prop.table()함수를 이용하여 살펴보세요.


# 14. 범주형 변수에 대해서, 종속변수와의 관계를 bar plot를 이용하여 살펴보세요.


# 15.범주형 변수에 대해서, 종속변수와의 관계를 mosaic 패키지를 이용하여 살펴보세요.



# 16. 종속변수와 관련있다고 판단되는 범주형 변수는 무엇인가요?


# 3단계 : 독립변수들 간의 관계
# 17. 연속형 변수들간의 상관성을 확인하세요.



# 18. 이제 알고리즘에 Input으로 사용할 독립 변수 후보들을 각자 선정해 봅시다.

