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