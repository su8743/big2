##################################################################################
# 3.1 집단의 대표값 --------------------------------------------------------
##################################################################################

#최소, 최대, 평균, 중위수
str(cars)

head(cars, 10)

min(cars$dist)
max(cars$dist)
mean(cars$dist)
median(cars$dist)

#최빈값 구하기 함수
# table() : 분할표를 작성한다.
# which.max() : 최댓값이 저장된 위치의 색인을 반환한다.

mode <- function(x) {
  t <- table(x)
  names(t)[which.max(t)]
}
cars$dist
mode(cars$dist)
table(cars$dist)
##################################################################################
# 3.2 데이터의 분포 --------------------------------------------------------
##################################################################################

p1 <- c(7,9,9,10,10,10,10,11,11,13)
p2 <- c(7,8,9,9,10,10,11,11,12,13)
p3 <- c(3,3,6,7,7,10,10,10,11,13,30)

mean(p1); median(p1)
mean(p2); median(p2)
mean(p3); median(p3)

sd(p1) ; var(p1)
sd(p2) ; var(p2)
sd(p3) ; var(p3)

summary(p1)
summary(p2)
summary(p3)

br <- c(6.5, 7.5,  8.5,  9.5, 10.5, 11.5, 12.5, 13.5)
hist(p1, breaks = br)
lines(density(p1))
hist(p2, breaks = br)
hist(p3)

#데이터 프레임으로 바꿔서 비교하기
df1 <- data.frame(player = 'p1', score = p1)
df2 <- data.frame(player = 'p2', score = p2)
df3 <- data.frame(player = 'p3', score = p3)

df_player <- rbind(df1, df2)
df_player <- rbind(df_player, df3)
df_player

#install.packages("ggplot2")
#library(ggplot2)

qplot(player, score, data = df_player
      , geom = "boxplot")


#분산, 표준편차

var(cars$dist)
sd(cars$dist)

