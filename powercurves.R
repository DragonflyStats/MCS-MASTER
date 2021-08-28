time1=Sys.time()


simMCSpair = function(n=10,muD=2,sigmaOne=1,sigmaTwo=3,sigmaREs=5)


{
REs = rnorm(n,0,sigmaREs)
Xs = rnorm(n,0,sigmaOne) + REs
Ys = muD + rnorm(n,0,sigmaTwo) + REs
Ds = Xs-Ys
Ms = (Xs+Ys)/2
Zs = Ms - mean(Ms)
SLR = lm( Ds ~ Zs )
InterceptTest = summary(SLR)$coefficients[1,4] < 0.05
return( as.numeric( InterceptTest ) )
}


simMCSpair()


TestResults = 0 ; K = 1


for(k in 1:K)


{


M = 25000


simResults = numeric()
for(i in 1:M)


{


simResults[i] = simMCSpair()


}


TestResults = TestResults + sum( simResults )


}


TestResults/(K*M)
M


time2=Sys.time()
time1
time2
M
