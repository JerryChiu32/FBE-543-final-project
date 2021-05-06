###########Hong Kong HSI
getSymbols("^HSI", from = "2010-01-01",to = "2021-04-30",src = "yahoo")
tail(HSI)
HSI = to.monthly(HSI)
HSI = HSI$HSI.Adjusted
colnames(HSI) = "HSI"
HSI = HSI*0.13 ##change HKD to USD

###########China SSE
getSymbols("000001.SS", from = "2010-01-01",to = Sys.Date(),src = "yahoo")
tail(SSE)
SSE = to.monthly(`000001.SS`)
SSE = SSE$`000001.SS.Adjusted`
colnames(SSE) = "SSE"
SSE = SSE*0.15  ##change CNY to USD

###########Japan Nikkei 225
getSymbols("^N225", from = "2010-01-01",to = "2021-04-30",src = "yahoo")
tail(N225)
N225 = to.monthly(N225)
N225 = N225$N225.Adjusted
colnames(N225) = "N225"
N225 = N225*0.0092 ##change JPY to USD

###########Taiwan TWII
getSymbols("^TWII", from = "2010-01-01",to = "2021-04-30",src = "yahoo")
tail(TWII)
TWII = to.monthly(TWII)
TWII = TWII$TWII.Adjusted
colnames(TWII) = "TWII"
TWII = TWII*0.036 ##change TWD to USD

###########Korea KS11
getSymbols("^KS11", from = "2010-01-01",to = "2021-04-30",src = "yahoo")
tail(KS11)
KS11 = to.monthly(KS11)
KS11 = KS11$KS11.Adjusted
colnames(KS11) = "KS11"
KS11 = KS11*0.00089 ##change KRW to USD

###########Singapore STI
getSymbols("^STI", from = "2010-01-01",to = "2021-04-30",src = "yahoo")
tail(STI)
STI = to.monthly(STI)
STI = STI$STI.Adjusted
colnames(STI) = "STI"
STI = STI*0.75 ##change SGD to USD

###########US GSPC
getSymbols("^GSPC", from = "2010-01-01",to = "2021-04-30",src = "yahoo")
tail(GSPC)
GSPC = to.monthly(GSPC)
GSPC = GSPC$GSPC.Adjusted
colnames(GSPC) = "GSPC"

##########Engle-Granger cointegration test 
#####Hongkong
egcm(HSI,SSE)
plot(egcm(HSI, SSE)) 
summary(egcm(HSI, SSE))

egcm(HSI,N225)
plot(egcm(HSI, N225)) 
summary(egcm(HSI, N225))

egcm(HSI,TWII)
plot(egcm(HSI, TWII)) 
summary(egcm(HSI, TWII))

egcm(HSI, KS11)
plot(egcm(HSI, KS11)) 
summary(egcm(HSI, KS11))

egcm(HSI,STI)
plot(egcm(HSI, STI)) 
summary(egcm(HSI, STI))

egcm(HSI,GSPC)
plot(egcm(HSI, GSPC)) 
summary(egcm(HSI, GSPC))

egcm(SSE,HSI)
plot(egcm(SSE, HSI)) 
summary(egcm(HSI, SSE))

######China
egcm(SSE,N225)
plot(egcm(SSE, N225)) 
summary(egcm(SSE, N225))

egcm(SSE,TWII)
plot(egcm(SSE, TWII)) 
summary(egcm(SSE, TWII))

egcm(SSE,KS11)
plot(egcm(SSE, KS11)) 
summary(egcm(SSE, KS11))

egcm(SSE,STI)
plot(egcm(SSE, STI)) 
summary(egcm(SSE, STI))

egcm(SSE,GSPC)
plot(egcm(SSE, GSPC)) 
summary(egcm(SSE, N225))

#######Japan
egcm(N225,TWII)
plot(egcm(N225, TWII)) 
summary(egcm(N225, TWII))

egcm(N225,KS11)
plot(egcm(N225, KS11)) 
summary(egcm(N225, KS11))

egcm(N225,STI)
plot(egcm(N225, STI)) 
summary(egcm(N225, STI))

egcm(N225,GSPC)
plot(egcm(N225, GSPC)) 
summary(egcm(N225, GSPC))

#######Taiwan
egcm(TWII,KS11)
plot(egcm(TWII, KS11)) 
summary(egcm(TWII, TWII))

egcm(TWII,STI)
plot(egcm(TWII, STI)) 
summary(egcm(TWII, STI))

egcm(TWII,GSPC)
plot(egcm(TWII, GSPC)) 
summary(egcm(TWII, GSPC))

#######Korea
egcm(KS11,STI)
plot(egcm(KS11, STI)) 
summary(egcm(KS11, STI))

egcm(KS11,GSPC)
plot(egcm(KS11, GSPC)) 
summary(egcm(KS11, GSPC))

########Singapore
egcm(STI,GSPC)
plot(egcm(STI, GSPC)) 
summary(egcm(STI, GSPC))

###################Johansen Cointegration
library(urca)
library(forecast)
library(tidyverse)
library(vars)
TSHSI = ts(data = HSI, start = c(2010, 1), frequency = 12)
TSSSE = ts(data = SSE, start = c(2010, 1), frequency = 12)
TSN225 = ts(data = N225, start = c(2010, 1), frequency = 12)
TSTWII = ts(data = TWII, start = c(2010, 1), frequency = 12)
TSKS11 = ts(data = KS11, start = c(2010, 1), frequency = 12)
TSSTI = ts(data = STI, start = c(2010, 1), frequency = 12)
TSGSPC = ts(data = GSPC, start = c(2010, 1), frequency = 12)

dataset = cbind(TSHSI,TSSSE,TSN225,TSTWII,TSKS11,TSSTI,TSGSPC)

dataset2 = cbind(HSI,SSE,N225,TWII,KS11,STI)
lagselect = VARselect(dataset, lag.max = 12, type = "const")
lagselect$selection

johansen = ca.jo(dataset, type = "trace", ecdet = "const", K = 2)
summary(johansen)
