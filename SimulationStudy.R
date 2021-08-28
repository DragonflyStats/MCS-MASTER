T1 = Sys.time()
library(nlme)
M=100

withinJ=numeric()
withinR=numeric()
withinS=numeric()
betweenJ=numeric()
betweenR=numeric()
betweenS=numeric()


for(i in 1:M)
{
set.seed(i); 

mu = round(rnorm(85,125,30))
mu
J1 = mu + rnorm(85)
J2 = mu + rnorm(85)
J3 = mu + rnorm(85)
S1 = mu + rnorm(85,0,12)
S2 = mu + rnorm(85,0,12)
S3 = mu + rnorm(85,0,12)
R1 = mu + rnorm(85,0,12)
R2 = mu + rnorm(85,0,12)
R3 = mu + rnorm(85,0,12)
Blood= matrix(round(c(J1,J2,J3,S1,S2,S3,R1,R2,R3),1),nrow = 85, ncol = 9, byrow = TRUE,
		dimnames = list(NULL, c("J1","J2","J3","R1","R2","R3","S1","S2","S3")) )
 
withinJ=c(withinJ,sd(apply(Blood[,1:3],1,mean)))
betweenJ=c(betweenJ,mean(apply(Blood[,1:3],1,sd)))

withinR=c(withinR,sd(apply(Blood[,4:6],1,mean)))
betweenR=c(betweenR,mean(apply(Blood[,4:6],1,sd)))

withinS=c(withinS,sd(apply(Blood[,7:9],1,mean)))
betweenS=c(betweenS,mean(apply(Blood[,7:9],1,sd)))

}
Results= data.frame(withinJ,withinR,withinS, betweenJ,betweenR,betweenS)
Results
