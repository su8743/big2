
##################################################################################
# 연습문제 ----------------------------------------------------------------
##################################################################################

?airquality
# 0. 준비작업 
# airquality 데이터 셋을 aq라는 이름으로 복사하시오.
aq <- airquality
head(aq)
# Month 칼럼을 범주형변수로 변환하여 Month2라는 이름으로 추가하시오.
install.packages("dplyr")
library(dplyr)
aq <- mutate(airquality, Month2 = as.factor(Month))
str(aq)

# 1. x축을 온도로, y축을 오존농도로 하여 산점도를 그리시오
head(aq)
qplot(Temp, Ozone, data = aq)

# 2. 1번에 이어서, 월별로 칼라를 구분하여 그리시오.
qplot(Temp, Ozone, data = aq, colour = Month2)
qplot(Temp, Ozone, data = aq, colour = Month)

# 3. x축을 온도로, y축을 오존농도로 하여 산점도와 smooth 라인을 같이 그리시오
qplot(Temp, Ozone, data = aq, geom = c("point", "smooth"))

# 4. 3번을 월별로 각각 나눠서 그리시오
qplot(Temp, Ozone, data = aq, 
      facets = Month2 ~.,geom = c("point", "smooth"))


# 5. x축을 바람세기, y축을 오존농도로 하여 산점도와 smooth 라인을 같이 그리시오
qplot(Wind, Ozone, data = aq, geom = c("point", "smooth"))


# 6. x축을 태양복사열, y축을 오존농도로 하여 산점도와 smooth 라인을 같이 그리시오
qplot(Solar.R, Ozone, data = aq, geom = c("point", "smooth"))


# 7. 월별 오존농도의 크기를 box plot으로 그리시오
qplot(Month2, Ozone, data = aq, geom = "boxplot")
