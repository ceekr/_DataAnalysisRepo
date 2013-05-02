## M200 Advanced Experimental Statistics
## Homework 1 (Due April 11)

## Part 1 - R Tutorial
## Question 1
x <- c(65, 7, 19, 82); x

## Question 2
y <- c(87, 78, 1); y

## Question 3
x <- c(x, 43); x

## Question 4
y1 <- c(19, 15);
y <- c(y, y1); y; remove(y1)

## Question 5
y/x

## Question 6
x + 2*y

## Question 7
mean(c(sum(x), median(y)))

## Question 8
myfun <- function(x){
  return (x*3 + 5)
}; myfun(x)

## Question 9
x[1]

## Question 10
y[4]

## Question 11
x[c(1, 2)]

## Question 12
y[c(3, 5)]

## Question 13
y[c(5, 3)]

## Question 14
x[c(3, 2, 5)]

## Question 15
x[c(4, 4)]

## Question 16
y[c(1, 5, 1)]

## Question 17
x[c(-2)]

## Question 18
y[which(y %% 2 != 0)]

## Question 19
x > 20

## Question 20
y == 1

## Question 21
x[x > 20]

## Question 22
y[y <= 19]

## Question 23
x[x > 20 | x < 19]

## Question 24
y[y < 80 & y > 20]

## Part 2 - Statistics

## Question 24
## Read as Data Frame
## dSet1 <- as.numeric(read.csv(file="./data/dataset1.csv", header=F, sep=","))
## Read as Numeric vector
dSet1 <- scan(file="E:/RWorkspace/wd-nicks/data/dataset1.csv")
## Make the Histogram of the data set
hist(x=dSet1, freq=F, breaks=20, col="red")
## From the Histogram, it is clear that the data is not Gaussian; Why? Because the data
## has no negative values and cuts of at 0
## Now, plot the QQ plot with original data on Y and normal data on X (auto created by qqnorm)
qqnorm(y=dSet1)
qqline(y=dSet1)
## The plot deviates significantly from the straight line fit, indicating the data set is not normal
## Then we run the Shapiro-Wilk on the data set to get a p-value
shapiro.test(x=dSet1)
## The p-value is significantly less than 5%, we reject the hypothesis that the data is normal
## Since the data is not normal, we will select Median as the the appropriate descriptor of Central tendency 
## We are simply quoting the median here without the confidence interval. 
## The CI can be calculated with bootstrap
median(dSet1) 
## For the spread, we will calculate the Median absolute Deviation (MAD) (stated as MADAM in Lectures)
mad(x=dSet1)
## Again, the MAD can be stated with a confidence interval using bootstrap

## Question 25
## Read as Data Frame
## dSet1 <- as.numeric(read.csv(file="./data/dataset1.csv", header=F, sep=","))
## Read as Numeric vector
dSet2 <- scan(file="E:/RWorkspace/wd-nicks/data/dataset2.csv")
## Make the Histogram of the data set
hist(x=dSet2, freq=F, breaks=20, col="grey")
## From the Histogram, it is clear that the data seems Gaussian; 
## Although, we still do NOT have any negative values
## Now, plot the QQ plot with original data on Y and normal data on X (auto created by qqnorm)
qqnorm(y=dSet2)
qqline(y=dSet2)
## The plot almost perfectly fits the straight line indicating a normal distribution
## Then we run the Shapiro-Wilk on the data set to get a p-value
shapiro.test(x=dSet2)
## The p-value is significantly MORE than 5% (about 45%), we accept the hypothesis that the data is normal
## Since the data is normal, we may select either Mean or Median as the the appropriate descriptor of 
## Central tendency - in this case, the mean and median are almost same.
## Again the CI can be calculated with bootstrap
median(dSet2) 
mean(dSet2)
## For the spread, we will calculate the Median absolute Deviation (MAD) (stated as MADAM in Lectures)
mad(x=dSet2)
## As well as the standard deviation, which is closer to MAD 
sd(dSet2)
## Again, the MAD/SD can be stated with a confidence interval using bootstrap
