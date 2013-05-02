#Correlation CI
#Data
LSAT = c(576,635,558,578,666,580,555,661,651,605,653,575,545,572,594)
GPA = c(3.39,3.3,2.81,3.03,3.44,3.07,3,3.43,3.36,3.13,3.12,2.74,2.76,2.88,2.96)
plot(LSAT, GPA)

#Find correlation
cor(LSAT, GPA)

#Confidence interval around r
#Basic idea: pick pairs (with replacement)
#How? Index vector!
indVec = 1:length(GPA)

iter = 10000
z = rep(NA, iter)
for (i in 1:iter) {
	#Resample, keeping pairs together
	indVecShuf = sample(indVec, length(indVec), replace=TRUE)  #Make index vector
	psLSAT = LSAT[indVecShuf]  #Sample LSAT according to index vector
	psGPA = GPA[indVecShuf]  #Sample GPA according to index vector
	z[i] = cor(psLSAT, psGPA)  #Compute correlation
}

#Find confidence interval
quantile(z, c(0.025, 0.975))

#--------------------------------------

#Regression
#Basic command: lm
lm(GPA ~ LSAT)

#Plot regression line
abline(lm(GPA ~ LSAT))

#Confidence interval for m and b
#As before, pick pairs with replacement
#Compute m and b using lm

indVec = 1:length(GPA)
iter = 10000
#Set up storage
mvec = rep(NA, iter)
bvec = rep(NA, iter)

for (i in 1:iter) {
	indVecShuf = sample(indVec, length(indVec), replace=TRUE)  #Make index vector
	psLSAT = LSAT[indVecShuf]  #Sample LSAT according to index vector
	psGPA = GPA[indVecShuf]  #Sample GPA according to index vector
	psreg = lm(psGPA ~ psLSAT)  #Perform regression
	b[i] = psreg$coefficients[1]
	m[i] = psreg$coefficients[2]
}

#Find CIs
quantile(mvec, c(0.025, 0.975))
quantile(bvec, c(0.025, 0.975))

#------------------------------------------

#Orthogonal distance (aka Model II regression)
#Need lmodel2 package
install.packages("lmodel2")
#Load package
library(lmodel2)

#Do regression and extract result
lmodel2(GPA ~ LSAT)
model2fit$regression.results
