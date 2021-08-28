library(MethComp)
library(dplyr)
library(magrittr)

data(sbp)

dat <- sbp %>% filter(meth != "R")

Ref.Fit.1 = lme(y ~ meth-1, data = dat,   #Symm , Symm#
	random = list(item=pdSymm(~ meth-1)), 
	weights=varIdent(form=~1|meth),
	correlation = corSymm(form=~1 | item/repl),  
        method="ML")

dat <- sbp %>% filter(meth != "S")

Ref.Fit.2 = lme(y ~ meth-1, data = dat,   #Symm , Symm#
	random = list(item=pdSymm(~ meth-1)), 
	weights=varIdent(form=~1|meth),
	correlation = corSymm(form=~1 | item/repl),  
        method="ML")



NMW.Fit = lme(y ~ meth-1, data = dat,   #Symm , CS# 
     random = list(item=pdSymm(~ meth-1)),
     # weights=varIdent(form=~1|meth), 
     correlation = corCompSymm(form=~1 | item/repl), 
     method="ML")

NMB.Fit  = lme(y ~ meth-1, data = dat,   #CS , Symm#
     random = list(item=pdCompSymm(~ meth-1)), 
     weights=varIdent(form= ∼1|meth),
     correlation = corSymm(form=~1 | item/repl), 
     method="ML")

NMO.Fit = lme(y ~ meth-1, data = dat,   #CS , CS# 
     random = list(item=pdCompSymm(~ meth-1)), 
     # weights=varIdent(form= ∼1|meth),
     correlation = corCompSymm(form=~1 | item/repl), 
     method="ML")

anova(Ref.Fit,NMW.Fit)
anova(Ref.Fit,NMB.Fit)
anova(Ref.Fit,NMO.Fit)

intervals(NMW.Fit)$sigma[[2]]
intervals(NMW.Fit)$corStruct[[2]]
intervals(NMO.Fit)$reStruct[[1]][2]



getParam = function(x) {

    Param = list(

        meanX=x$coefficients$fixed[1],

        meanY=x$coefficients$fixed[2],

        SigVarX=x$sigma,

        SigVarY=x$sigma*max(intervals(x)$varStruct[2],is.null(intervals(x)$varStruct[2])),

        SigCovXY=x$sigma*max(intervals(x)$corStruct[2],is.null(intervals(x)$corStruct[2])-1)

        )

    Param

    }


DVarX=as.numeric(VarCorr(x)[1,1])
DVarY=as.numeric(VarCorr(x)[2,1])
DCovXY=sqrt(DVarX*DVarY)

