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
