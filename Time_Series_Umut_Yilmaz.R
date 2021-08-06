library(seastests)
library(sarima)
library(forecast)
library(aTSA)
library(urca)
library(sns)
library(gbutils)

Portugal <- read.csv("Portugal_data.csv", header = TRUE, sep = ";")

# Portugal
Order_p<- data.matrix(Portugal[,3])
seasonality_test <- seastests::isSeasonal(Order_p, test = "wo", freq = 7)   
print(seasonality_test)

plot(Order_p, type = "l")
# ACF Portugal
ACF_p <- acf(Order_p, main = "Autocorrelation Function of Orders in Portugal")

# PACF Portugal
PACF_p <- pacf(Order_p, main = "Partial Autocorrelation Function of Orders in Portugal" )

#making the data stationary
Seasd_p <- data.matrix((diff(Order_p,7)))
plot(Seasd_p, type = "l", col = "blue", main = "After seasonal differencing")
seasonality_test_2 <- seastests::isSeasonal(Seasd_p, test = "wo", freq = 7)   

Diff_Seasd_p <- data.matrix(diff(Seasd_p))
plot(Diff_Seasd_p, type = "l", col = "blue", main = "After seasonal and nonseasonal differencing")

#ACF and PACF

ACF_p <- acf(Diff_Seasd_p, main = "ACF")
PACF_p <- pacf(Diff_Seasd_p, main = "PACF")

#Box-Cox transformation to reduce variance
TDS_p <- data.matrix(BoxCox(Diff_Seasd_p, lambda = 0.9))
plot(TDS_p, type = "l")
hist(Diff_Seasd_p, freq = FALSE, nclass = 10)
hist(TDS_p, freq = FALSE, nclass = 15 )
hist(TDS_p, freq = FALSE)

#Arima model
Arima_model_p <- Arima(TDS_p, order = c(0,1,1), seasonal = list(order = c(1,1,1), period = 7), lambda = 0.9)
print(Arima_model_p)
Forecast_p <- forecast::forecast(Arima_model_p, h = 90, level = c(80,95), lambda = 0.9)


# Ghana

Ghana <- read.csv("Ghana_data.csv", header = TRUE, sep = ";")

Order_g<- data.matrix(Ghana[,3])
seasonality_testt <- seastests::isSeasonal(Order_g, test = "wo", freq = 7)   
print(seasonality_testt)

plot(Order_g, type = "l")
# ACF Ghana
ACF_g <- acf(Order_g, main = "Autocorrelation Function of Orders in Ghana")
# PACF Ghana
PACF_g <- pacf(Order_g, main = "PACF of Orders in Ghana")


#making the data stationary
Seasd_g <- data.matrix((diff(Order_g,7)))
plot(Seasd_g, type = "l", col = "blue")
seasonality_testt_2 <- seastests::isSeasonal(Seasd_g, test = "wo", freq = 7)   

Diff_Seasd_g <- data.matrix(diff(Seasd_g,1,1))
plot(Diff_Seasd_g, type = "l", col = "blue")

#ACF and PACF

ACF_g <- acf(Diff_Seasd_g, main = "ACF")
PACF_g <- pacf(Diff_Seasd_g, main = "PACF")

#Box-Cox transformation to reduce variance
TDS_g <- data.matrix(BoxCox(Diff_Seasd_g, lambda = 0.9))
plot(TDS_p, type = "l")
hist(Diff_Seasd_p, freq = FALSE, nclass = 10)
hist(TDS_p, freq = FALSE, nclass = 15 )
hist(TDS_p, freq = FALSE)

#Arima model
Arima_model_g <- Arima(TDS_g, order = c(0,1,1), seasonal = list(order = c(0,1,1), period = 7), lambda = 0.9)
print(Arima_model_g)
Forecast_p <- forecast::forecast(Arima_model_p, h = 90, level = c(80,95), lambda = 0.9)



