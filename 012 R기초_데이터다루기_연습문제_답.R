##############################
# 연습문제1
##############################
mpg2 <- as.data.frame(mpg)
class(mpg2)
# mpg 데이테셋을 이용하여 다음 연습문제를 푸시오.
# mpg 는 차량의 제조사, 모델, 연식, 시내주행시 연비(cty), 고속도로주행시 연비(hwy) 등의 정보를 담고 있습니다.

head(mpg2)
str(mpg2)

# 1. mpg에 대한 도움말을 조회하고 읽어 보세요.
?mpg
# 2. lapply, sapply를 이용하여 전체 자동차들의 
# 시내주행, 고속도로주행시 평균연비를 계산하시오.
lapply(mpg2[,c("cty","hwy")], mean)

# 3. tapply를 이용하여, 자동차 모델별 시내주행 평균 연비를 계산하시오. 
tapply(mpg2$cty, mpg2$model, mean)

# dplyr 패키지를 사용하시오
# 4. 제조사, 모델, 연식, 기어(자동,수동), 고속도로주행연비, class(차종) 를 조회하시오.
select(mpg2, manufacturer, model, year, trans, hwy, class)

# 5. 제조사가 audi인 데이터를 조회하시오
filter(mpg2, manufacturer == 'audi')

# 6. 전체 데이터에서 평균연비 = (시내주행연비 + 고속도로주행연비)/2 칼럼을 추가하시오
mpg2 <- mutate(mpg2, AvgG = (cty + hwy)/2)

head(mpg2)

# 7. 6번에 이어서, 평균연비가 높은 순으로 정렬하여 조회하시오
arrange(mpg2, desc(AvgG))

head(arrange(mpg2, desc(AvgG)), 5)


# 8. 차종(class) 별로 평균연비를 구하시오.
groupClass <- group_by(mpg2, class)
summarise(groupClass, AvgFE = mean(AvgG))

# 9. 체인함수(%>%)를 써서 위 4, 6, 7, 8번을 한 문장으로 작성하시오.
select(mpg2, manufacturer, model, year
       , trans, hwy, class,cty) %>%
  mutate(AvgG = (cty + hwy)/2) %>%
  group_by(class) %>%
  summarise(AvgFE = mean(AvgG)) %>%
  arrange(desc(AvgFE))

