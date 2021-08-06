Portugal <- 
  read.csv("portugal_data.csv", header = TRUE, sep = ";")
regpred <- read.csv("Reg_p_whole.csv", header = TRUE, sep = ";")

plot(Portugal[1:59,2], Portugal[1:59,3], type = "l", col = "blue", xlim = c(0, 100), ylim = c(800,2700),
     xlab = "Days", ylab = "Number of orders", main = "Forecasting by Regression Analysis")
points(regpred[c(1:91),1], regpred[c(1:91),2], type = "l", col = "red")

plot(Portugal[1:59,2], Portugal[1:59,3], type = "l", col = "blue", xlim = c(0, 100), ylim = c(800,2700),
     xlab = "Days", ylab = "Number of orders")

points(regpred[c(92:123),1], regpred[c(92:123),2], type = "l", col = "green")
points(regpred[c(59:91),1], regpred[c(59:91),2], type = "l", col = "red")


Ghana <- read.csv("ghana_data.csv", header = TRUE, sep = ";")
regpred2 <- read.csv("Reg_g_whole.csv", header = TRUE, sep = ";")

plot(Ghana[1:59,2], Ghana[1:59,3], type = "l", col = "blue", xlim = c(0, 100), ylim = c(80,470),
     xlab = "Days", ylab = "Number of orders")
points(regpred2[c(1:91),1], regpred2[c(1:91),2], type = "l", col = "red")


plot(Ghana[1:59,2], Ghana[1:59,3], type = "l", col = "blue", xlim = c(0, 100), ylim = c(80,500),
     xlab = "Days", ylab = "Number of orders")

points(regpred2[c(92:123),1], regpred2[c(92:123),2], type = "l", col = "green")
points(regpred2[c(59:91),1], regpred2[c(59:91),2], type = "l", col = "red")
