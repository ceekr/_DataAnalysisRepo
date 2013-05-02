#Generate exponential data
#Create 1000 samples of 1000 data points (say, survival times) each
expdata <- array(NA, c(1000,1000))  #Preallocate array
for (i in 1:1000) {  #Fill each row
	expdata[i,] <- sort(rexp(1000, rate=2), decreasing=TRUE)
}
hist(expdata[1,])

#Generate y variable
y <- 1:1000
plot(expdata[1,], y)

#For each sample, compute lambda using nonlinear least squares, transformation, and MLE
#Least squares (sometimes fails)
nlsEst <- rep(NA, 1000)
for (i in 1:1000) {
	try(nlsEst[i] <- coef(nls(y ~ a*exp(-lambda*expdata[i,])+b, start=list(a=1000, lambda=1, b=1)))[2], silent=TRUE)  #Ignore errors
}

#Log transformation
logEst <- rep(NA, 1000)
for (i in 1:1000) {
	logEst[i] = -coef(lm(log(y) ~ expdata[i,]))[2]
}

#Maximum likelihood
library(MASS)
mleEst <- rep(NA, 1000)
for (i in 1:1000) {
	mleEst[i] <- fitdistr(expdata[i,], "Exponential")[1]$estimate
}

#Histogram each method across samples
x11(); hist(nlsEst)
mean(nlsEst, na.rm=TRUE)

x11(); hist(mleEst)
mean(mleEst)

x11(); hist(logEst)
mean(logEst)


#Bootstrap CI's for one data set
indvec = 1:1000  #Set up index vector

#Preallocate space (one row per bootstrap replicate)
nlsboot <- array(NA, c(100,1000))
logboot <- array(NA, c(100,1000))
mleboot <- array(NA, c(100,1000))

for (i in 1:100) {
	expvec <- expdata[i,]  #Pick data set to resample
	#Main bootstrap loop
	for (j in 1:1000) {
		indvecboot <- sample(indvec, length(indvec), replace=TRUE)
		psexpvec <- expvec[indvecboot]
		psy <- y[indvecboot]
		#Estimate lambda with each method
		nlsboot[i,j] <- as.numeric(try(coef(nls(psy ~ a*exp(-lambda*psexpvec)+b, start=list(a=1000, lambda=1, b=1)))[2], silent=TRUE))
		logboot[i,j] <- -coef(lm(log(psy) ~ psexpvec))[2]
		mleboot[i,j] <- fitdistr(psexpvec, "Exponential")[1]$estimate	
	}
}

#Find 2.5 and 97.5% percentiles. How often does true value lie in them?
nlsright <- rep(NA, 100)
logright <- rep(NA, 100)
mleright <- rep(NA, 100)

for (i in 1:100) {
	#NLS
	if (quantile(nlsboot[i,], 0.025, na.rm=TRUE) <= 2 & quantile(nlsboot[i,], 0.975, na.rm=TRUE) >= 2) 
		nlsright[i] <- 1
	else
		nlsright[i] <- 0
	
	#Log transform
	if (quantile(logboot[i,], 0.025) <= 2 & quantile(logboot[i,], 0.975) >= 2)
		logright[i] <- 1
	else
		logright[i] <- 0
	
	#MLE estimation
	if (quantile(mleboot[i,], 0.025) <= 2 & quantile(mleboot[i,], 0.975) >= 2)
		mleright[i] <- 1
	else
		mleright[i] <- 0
}

#What fraction of CIs contained true value?
mean(nlsright)
mean(logright)
mean(mleright)

