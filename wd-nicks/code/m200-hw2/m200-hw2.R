## Part 1: Matrices and Data Frames Tutorial
##
##
## A matrix stores data in several rows and columns. (A matrix with only one row or only one column is possible but ## rarely used.) One way to make a matrix is to combine vectors, making each either a row or a column of the new 
## matrix. The rbind() command creates a matrix whose rows are the vectors supplied to rbind() as arguments. 
## Similarly, cbind() makes a matrix whose columns are the function's arguments.

## 45.  Use cbind() to combine x and y into a matrix called z. View z.
## 
## x  y
## [1,] 65 87
## [2,]  7 78
## [3,] 19  1
## [4,] 82 19
## [5,] 43 15

x <- c(65, 7, 19, 82, 43)
y <- c(87, 78, 1, 19, 15)
z <- cbind(x=x, y=y);z

## 46.  Use rbind() to x1 and y1 into a matrix called z1. View z1.
##
## [,1] [,2] [,3] [,4] [,5]
## x1   65    7   19   82   43
##
## y1   87   78    1   19   15
x1 <- c(65, 7, 19, 82, 43)
y1 <- c(87, 78, 1, 19, 15)
z1 <- rbind(x1=x, y1=y);z1

## You can perform arithmetic operations on matrices just as you would on vectors, as long as their dimensions match
## To check the dimensions of a matrix, use the command dim(). The first number in its output is the number of rows ## in the matrix and the second one is the number of columns.
## 47. Find z1+5.
##
## [,1] [,2] [,3] [,4] [,5]
## x1   70   12   24   87   48
##
## y1   92   83    6   24   20
z1 + 5


## 48.  Find the dimensions of Z and z1.
## 
## [1] 5 2
## [1] 2 5
dim(z)
dim(z1)

## Pretty much all the indexing concepts that apply to vectors also apply to matrices. You just have to think of 
## them one dimension at a time.
## 49.  Find the elements in rows 3 and 4, column 2.
##
## [1] 1 19
unname(c(z[3, 2], z[4, 2]))

## 50.  Display the elements in rows 4, 3, 2, and 4 (in that order), column 1.
##
## [1] 82 19  7 82
unname(c(z[4, 1], z[3, 1], z[2, 1], z[4, 1]))

## To access a whole row, don't specify a column. The syntax is mat[i,]. Similarly, to access a whole column, don't ## specify a row.
## 51.  Display column 1 of matrix z.
## 
## [1] 65  7 19 82 43
z1[1,]

## 52.  Display rows 1 and 5 of matrix z.
##
## x  y
## [1,] 65 87
## [2,] 43 15
unname(z[1, ])
unname(z[5, ])

## You can do logical indexing on the rows and columns of a matrix. Just treat the row or column-brackets and all-as ## a vector. This means you can put one set of brackets directly after another.
## 53.  Display the elements of column 1 that are greater than 20.
## 
## [1] 65 82 43
zCol <- z[, 1]
zCol[which(zCol>20)]

## 54.  Display the elements of column 2 that are greater than 1 and less than 60.
## 
## [1]  19 15
zCol <- z[, 2]
zCol[which(zCol > 1 & zCol<60)]

## In a matrix, you can use conditions on one row or column to pick out elements in another one.
## 55.  Find the element in column 2 that corresponds to the number 19 in column 1.
## 
## [1] 1
z[,2][which(z[, 1]==19)]

## 56.  Display the elements in column 1 that correspond to elements in column 2 that lie between 1 and 60.
##
## [1] 82 43
z[,1][which(z[, 2] > 1 & z[, 2] < 60)]

## While R can read and write data in many formats, CSV (comma-separated variable) is probably the simplest one. 
## The function write.csv() can take an R matrix and make a .csv file that can be opened with a spreadsheet or text ## editor can open. The basic syntax is write.csv(matrix, "filename.csv"); you can look up other functions in help. ## By default, write.csv() assumes you want to label the rows in your output file; if you don't, use the option row
## .names=FALSE as one of the arguments to write.csv().
##
## 57.  Write the matrix z to a file called testmat.csv. The file should not have row names. NOTE: There will be no ## visible output, but you can open the file in a spreadsheet to look at it.
write.csv(z, "E:/RWorkspace/wd-nicks/data/testmat.csv", row.names=FALSE)

## Similarly, the function read.csv() reads CSV files; the basic syntax is read.csv("filename.csv"). By default, 
## read.csv() assumes the file you're importing has column titles (called a header). If it doesn't, you have to 
## specify header=FALSE in the command.
## 58.  Open the file test.csv and assign its contents to a variable called test. View test.
##
## x  y
## 1 65 87
## 2  7 78
## 3 19  1
## 4 82 19
## 5 43 15
testmat  <- read.csv(file="E:/RWorkspace/wd-nicks/code/m200-hw2/testmat.csv")

## 59.  Multiply test by 10. Don't assign this result to any variable.
## x   y
## 1 650 870
## 2  70 780
## 3 190  10
## 4 820 190
## 5 430 150

testmat*10

## 60.  What is the sum of test and z?
## 
## x   y
## 1 130 174
## 2  14 156
## 3  38   2
## 4 164  38
## 5  86  30
testmat + z

## Some functions treat matrices and data frames differently. For example, if you apply mean() to a matrix, it 
## gives the mean of the whole matrix, but applying mean to a data frame gives the mean of each column. (Try this ## with z and test.) If you're not sure if a variable is a matrix or a data frame, you can use the functions is
## .matrix() and is.data.frame() to check. To convert between them, use as.matrix() and as.data.frame().
## 61.  Is test a matrix?
##
## [1] FALSE
is.matrix(testmat)

## 62.  Convert the matrix z1 to a data frame called z1frame and view it.
## 
## V1 V2 V3 V4 V5
## x1 65  7 19 82 43
## y1 87 78  1 19 15
## NOTE: Converting a matrix without column labels to a data frame generates automatic column labels.
z1frame <- as.data.frame(z1); z1frame


## Part 2: Statistics
##
## 1.  Examine dataset3.csv. Do the following:
##   a.	Make a histogram
##   b.	Make a Dot plot
##   c.	Make a Box and Whiskers plot
##   d.	Report an estimate with confidence intervals for the following descriptors:
##      i.	Mean
##      ii.	Median
##      iii.	Variance
##      iv.	Mean absolute deviation about the median
##   e.	Note any weird observations

## Reading in the dataset 3
dataset3 <- read.csv(file="E:/RWorkspace/wd-nicks/data/dataset3.csv")
dataVector <- dataset3[, 1]
dataVector <- round(dataVector, 8)
## Quick peek at the data
head(dataVector)

## Make a histogram - applying Scott's rule to bin width
## bin width w = 3.5??/cube-root(n) 
## binWidth <- 3.5*sd(dataset3[, 1])/(length(dataset3[, 1]))^1/3
hist(x=dataVector, breaks=100)

## Make a Dot plot
dotchart(x=dataVector)

## Make a Box and Whisker plot
boxplot(x=dataVector)

## Calculating MEAN with 95% CI
estMean <- round(mean(dataVector), 4)
## First get 10,000 bootstrapped samples from the data set
bootSamples <- lapply(X=1:10000, FUN=function(X){sample(dataVector, replace=T)})
## Calculating the mean for each the bootstrapped sample
bootMeans <- sapply(X=bootSamples, FUN=mean)
hist(x=bootMeans, breaks=50)
## Now determining the CI - Sorting the bootstrapped means
sortedBootMeans <- sort(bootMeans)
## Then calculate the 25th and 75th MEANS on the sorted list
loMean <- round(sortedBootMeans[250], 4)
hiMean <- round(sortedBootMeans[9750], 4)
print(paste("The mean, with 95% confidence interval, is: ", estMean, ", (", loMean, ", ", hiMean, ")"))

## Calculating MEDIAN with 95% CI
estMedian <- round(median(dataVector), 4)
## Then generate 10,000 bootstrapped samples from the data set
bootSamples <- lapply(X=1:10000, FUN=function(x){sample(x=dataVector, replace=T)})
## Now calculate the MEDIAN for each bootstrapped sample
bootMedians <- sapply(X=bootSamples, FUN=median)
hist(x=bootMedians, breaks=50)
## Now sort the boot medians
sortedBootMedians <- sort(bootMedians)
## Then calculate the lower and upper 2.5%
loMedian <- round(sortedBootMedians[250], 4)
hiMedian <- round(sortedBootMedians[9750], 4)
print(paste("The median, with 95% confidence interval, is: ", estMedian, ", (", loMedian, ", ", hiMedian, ")"))

## Calculating the Variance with 95% CI
estVar <- round(var(dataVector), 4)
## Then generate 10,000 bootstrapped samples from the data set
bootSamples <- lapply(X=1:10000, FUN=function(x){sample(x=dataVector, replace=T)})
## Now calculate the VARIANCE for each bootstrapped sample
bootVars <- sapply(X=bootSamples, FUN=var)
hist(x=bootVars, breaks=50)
## Now sort the boot Variances
sortedBootVars <- sort(bootVars)
## Then calculate the 25th and 75th MEDIANS on the sorted list
loVar <- round(sortedBootVars[250], 4)
hiVar <- round(sortedBootVars[9750], 4)
print(paste("The variance, with 95% confidence interval, is: ", estVar, ", (", loVar, ", ", hiVar, ")"))

## Calculating the MADAM with 95% CI
estMadam <- round(mad(x=dataVector, center=median(dataVector)), 4)
## Then generate 10,000 bootstrapped samples from the data set
bootSamples <- lapply(X=1:10000, FUN=function(x){sample(x=dataVector, replace=T)})
## Now calculate the MADAM for each bootstrapped sample
bootMadams <- sapply(X=bootSamples, FUN=mad) ## center defaults to median, so all good.
hist(x=bootMadams, breaks=50)
## Now sort the boot Madams
sortedBootMadams <- sort(bootMadams)
## Then calculate the 25th and 75th MADAM on the sorted list
loMadam <- round(sortedBootMadams[250], 4)
hiMadam <- round(sortedBootMadams[9750], 4)
print(paste("The MADAM, with 95% confidence interval, is: ", estMadam, ", (", loMadam, ", ", hiMadam, ")"))

## Weird Observation
## The data is tightly centered around 0 with several outliers. This evident from the histogram, dot plot, and the ## box and whiskers plot. Owing to this the mean has a wide variation from -1.6611 to 3.289. This is a typical case ## for applying trimmed mean.")


## 2.  Examine dataset4.csv. Do the following:
##      a.	Make a scatter plot
##      b.	Compute the Pearson correlation
##      c.	Compute the Spearman correlation
##      d.	Compute p-values for b and c by bootstrapping the null hypothesis significant test
##      e.	Note any weird observations

## Reading in the dataset 4
dataset4 <- read.csv(file="E:/RWorkspace/wd-nicks/data/dataset4.csv")
## Extract the Column vetcor
X <- dataset4$X163
Y <- dataset4$X66
## Check the distribution of X163
hist(x=X, breaks=20)
## Check the distribution of X66
hist(x=Y, breaks=20)
## Scatter plot of the variables in the data set
plot(x=X, y=Y, pch=20)

############ Computing the Pearson correlation - APPROACH #1 ############

estPearsonCor <- round(as.numeric(names(table(cor(x=dataset4, method="pearson", use="everything")))[1]), 4)
## Generating Bootstrapped samples of the dataset4 - Remember integrity of pairs are maintained
bootPairs <- lapply(X=1:10000, FUN=function(x){dataset4[sample(x=nrow(dataset4), size=49, replace=T),]})
## Now for EACH bootstrapped sample, consisting of 49 pairs, calculate the Pearson's r
bootPears <- sapply(X=bootPairs, FUN=cor, method="pearson") 
bootPearsTbl <- table(bootPears)
bootPears1 <- c()
## Then extract the r values for each sample - DO NOT LIKE THIS, but have no handy solution for now
for (i in 1:10000){
  bootPears1 <- c(bootPears1, as.numeric(names(bootPearsTbl[i])))
}
## Now we have the Pearson's r for each sample. So plot the distribution of the r
hist(x=bootPears1, breaks=50)
## Now sort the boot Pearsons
sortedBootPearsons <- sort(bootPears1)
loPearsonCor <- round(sortedBootPearsons[250], 4)
hiPearsonCor <- round(sortedBootPearsons[9750], 4)
print(paste("The PEARSON's r, with 95% confidence interval, is: ", estPearsonCor, ", (", loPearsonCor, ", ", hiPearsonCor, ")"))


############# Computing the Pearson correlation - APPROACH #2 ############
## This approach is borrowed from Jane's code. 
estPearsonCor <- round(x=cor(x=X, y=Y, method="pearson", use="everything"), digits=4)
## Bootstrapping the confidence interval
indexVec <- 1:length(X)
iteration <- 10000
## This vector will contain the bootstrapped Pearsons r
bootPears <- rep(NA, iteration) 
for(i in 1:iteration){
  ## Resample keeping the pairing intact
  indexVecShuffled <- sample(x=indexVec, size=length(indexVec), replace=T)
  ## Now you have a vector that contains random sample indexes - use that to pick the pairs
  XReSample <- X[indexVecShuffled]
  YReSample <- Y[indexVecShuffled]
  ## Now that we have pair wise X and Y, calculate Cor
  bootPears[i] <- cor(x=XReSample, y=YReSample, method="pearson") ## Although the method value is default  
}
#Find confidence interval (Quantile will auto sort the list - unlike my approach #1)
## quantile(bootPears, c(0.025, 0.975)) ## My previous method was admittedlt crude!
loPearsonCor <- round(x=unname(quantile(bootPears, c(0.025, 0.975))[1]), digits=4)
hiPearsonCor <- round(x=unname(quantile(bootPears, c(0.025, 0.975))[2]), digits=4)
## Now we have the Pearson's r for each sample. So plot the distribution of the r
hist(x=bootPears, breaks=50)
print(paste("The PEARSON's r, with 95% confidence interval, is: ", estPearsonCor, ", (", loPearsonCor, ", ", hiPearsonCor, ")"))

############ Computing the p-values for Pearsons correlation - NHST ############

## So what is the Null Hypothesis here? 
## The null hypothesis is that there is no correlation between X and Y, meaning we hypothesize r=0
## Also meaning X and Y are independent. We should note here that the Pearson's r has a 
## 95% confidence interval of 0.2 to 0.6. This means that at least for this dataset with given pairs
## intact, the r=0 does not fall in the 95% confidence interval. This demonstrates that at least the 
## given pairings have a linear relationship, degree of which is quantified by r=0.44
## But then the question is: Does this pairing have any importance? What if we violate the pairings?
## Will X and Y still be linearly related? Or, is the linearity just a function of this particular pairing?
## To test this, we break the pairing and randomize them. Then for each set of X, Y pairings we calculate 
## the Pearsons's r. There will be 10,000 such sets.

## Bootstrapping the randomizd pairings
indexVec <- 1:length(X)
iteration <- 10000
## This vector will contain the bootstrapped Pearsons r
bootPears <- rep(NA, iteration) 
for(i in 1:iteration){
  ## Resample RANDOMIZING the pairing this time
  indexVecShuffled <- sample(x=indexVec, size=length(indexVec), replace=T)  
  XReSample <- X[indexVecShuffled]
  ## Randomize again, for different set of Ys
  indexVecShuffled <- sample(x=indexVec, size=length(indexVec), replace=T)
  YReSample <- Y[indexVecShuffled]
  ## Now, calculate the Pearson's r on randomized pairs
  bootPears[i] <- cor(x=XReSample, y=YReSample, method="pearson")
}
#Find confidence interval (Quantile will auto sort the list - unlike my approach #1)
## quantile(bootPears, c(0.025, 0.975)) ## My previous method was admittedlt crude!
loPearsonCor <- round(x=unname(quantile(bootPears, c(0.025, 0.975))[1]), digits=4)
hiPearsonCor <- round(x=unname(quantile(bootPears, c(0.025, 0.975))[2]), digits=4)
## Now we have the Pearson's r for each sample. So plot the distribution of the r
hist(x=bootPears, breaks=50)
print(paste("The PEARSON's r, with 95% confidence interval, is: ", estPearsonCor, ", (", loPearsonCor, ", ", hiPearsonCor, ")"))

## So now the question is: How many times do we get r value equals or higher than our estimated Pearson's 
## correlation r=0.44? Quanitfying this will provide the probability of this estimated r=0.44
pValue <- length(bootPears[which(x=bootPears>estPearsonCor)])/length(bootPears)
print(paste("The p-value for the estimated Pearson's correlation is:", pValue))
print("Since the p-value is much less than 5%, we DO NOT REJECT the null hypothesis that r=0")

## One final thing - eyeballing the 95% confidence interval of Pearson's r will indicate that the r=0 falls
## within the CI range. This also indicates that null hypothesis might be true, so we cannot reject it


############ Computing the Spearman correlation - APPROACH #1 ############

## This approach has issues. Using the entire dataframe as input cor() creates some cor values = 1
## This is natural owing to cartesian product. This is not suitable somehow for Spearman. The Pearsons
## came out OK though. Need to investigate (later - TODO)

## Computing the Spearman correlation
estSpearmanCor <- round(as.numeric(names(table(cor(x=dataset4, method="spearman", use="everything")))[1]), 4)
## Generating Bootstrapped samples of the dataset4 - Remember integrity of pairs are maintained
bootPairs <- lapply(X=1:10000, FUN=function(x){dataset4[sample(x=nrow(dataset4), size=49, replace=T),]})
## Now for EACH bootstrapped sample, consisting of 49 pairs, calculate the Spearman's corr
bootSpears <- sapply(X=bootPairs, FUN=cor, method="spearman") 
bootSpearsTbl <- table(bootSpears)
bootSpears1 <- c()
## Then extract the r values for each sample - DO NOT LIKE THIS, but have no handy solution for now
for (i in 1:10000){
  bootSpears1 <- c(bootSpears1, as.numeric(names(bootSpearsTbl[i])))
}
## Now we have the Spearman's corr for each sample. So plot the distribution of the r
hist(x=bootSpears1, breaks=50)
## Now sort the boot Spearmans
sortedBootSpearmans <- sort(bootSpears1)
loSpearmanCor <- round(sortedBootSpearmans[250], 4)
hiSpearmanCor <- round(sortedBootSpearmans[9750], 4)
print(paste("The SPEARMAN's corr, with 95% confidence interval, is: ", estSpearmanCor, ", (", loSpearmanCor, ", ", hiSpearmanCor, ")"))


############ Computing the Spearman correlation - APPROACH #2 ############
## This approach is borrowed from Jane's code. 
estSpearmanCor <- round(x=cor(x=X, y=Y, method="spearman", use="everything"), digits=4)
## Bootstrapping the confidence interval
indexVec <- 1:length(X)
iteration <- 10000
## This vector will contain the bootstrapped Pearsons r
bootSpears <- rep(NA, iteration) 
for(i in 1:iteration){
  ## Resample keeping the pairing intact
  indexVecShuffled <- sample(x=indexVec, size=length(indexVec), replace=T)
  ## Now you have a vector that contains random sample indexes - use that to pick the pairs
  XReSample <- X[indexVecShuffled]
  YReSample <- Y[indexVecShuffled]
  ## Now that we have pair wise X and Y, calculate Cor
  bootSpears[i] <- cor(x=XReSample, y=YReSample, method="spearman", use="everything") 
}
#Find confidence interval (Quantile will auto sort the list - unlike my approach #1)
loSpearmanCor <- round(x=unname(quantile(bootSpears, c(0.025, 0.975))[1]), digits=4)
hiSpearmanCor <- round(x=unname(quantile(bootSpears, c(0.025, 0.975))[2]), digits=4)
## Now we have the Pearson's r for each sample. So plot the distribution of the r
hist(x=bootSpears, breaks=50)
print(paste("The Spearman's correlation, with 95% confidence interval, is: ", estSpearmanCor, ", (", loSpearmanCor, ", ", hiSpearmanCor, ")"))

############ Computing the p-values for Spearman correlation - NHST ############

## Bootstrapping the randomizd pairings
indexVec <- 1:length(X)
iteration <- 10000
## This vector will contain the bootstrapped Pearsons r
bootSpears <- rep(NA, iteration) 
for(i in 1:iteration){
  ## Resample RANDOMIZING the pairing this time
  indexVecShuffled <- sample(x=indexVec, size=length(indexVec), replace=T)  
  XReSample <- X[indexVecShuffled]
  ## Randomize again, for different set of Ys
  indexVecShuffled <- sample(x=indexVec, size=length(indexVec), replace=T)
  YReSample <- Y[indexVecShuffled]
  ## Now, calculate the Pearson's r on randomized pairs
  bootSpears[i] <- cor(x=XReSample, y=YReSample, method="spearman")
}
#Find confidence interval
loSpearmanCor <- round(x=unname(quantile(bootSpears, c(0.025, 0.975))[1]), digits=4)
hiSpearmanCor <- round(x=unname(quantile(bootSpears, c(0.025, 0.975))[2]), digits=4)
## Now we have the Pearson's r for each sample. So plot the distribution of the r
hist(x=bootSpears, breaks=50)
print(paste("The Spearman's correlation, with 95% confidence interval, is: ", estSpearmanCor, ", (", loSpearmanCor, ", ", hiSpearmanCor, ")"))

## So now the question is: How many times do we get Spearman's correlaton value equals 
## or higher than our estimated Spearmans's correlation of 0.4284? 
## Quanitfying this will provide the probability of this estimated correlation
pValue <- length(bootSpears[which(x=bootSpears>estSpearmanCor)])/length(bootSpears)
print(paste("The p-value for the estimated Spearman's correlation is:", pValue))
print("Since the p-value is less than 5%, we DO NOT REJECT the null hypothesis")

## Also, eyeballing the 95% confidence interval of Spearman's correlation will indicate that the null 
## hypothesis of correlation being 0 falls within the CI range. 
## This also indicates that null hypothesis might be true, so we CANNOT REJECT it outright
