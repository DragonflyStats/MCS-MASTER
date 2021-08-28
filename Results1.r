# BIAS is equal 
# EQUAL BS
# DIFFERING WS

#############################################################################

set.seed(46755); 


J1add = rnorm(85)
J2add = rnorm(85)
J3add = rnorm(85)
R1add = rnorm(85,0,6)
R2add = rnorm(85,0,6)
R3add = rnorm(85,0,6)
S1add = rnorm(85,0,6) - rnorm(85,15,1)
S2add = rnorm(85,0,6) - rnorm(85,15,1)
S3add = rnorm(85,0,6) - rnorm(85,15,1)

Bloodadd=matrix(cbind(J1add,J2add,J3add,R1add,R2add,R3add,S1add,S2add,S3add),nrow=85)
Blood=Bloodmain+ round(Bloodadd,2) 

###########################################################################


		#Preparing the Blood Data
		library(nlme)
		blood = groupedData( y ~ meth | item ,
		data = data.frame( y = c(Blood), item = c(row(Blood)),
		meth = rep(c("J","R","S"), rep(nrow(Blood)*3, 3)),
		repl = rep(rep(c(1:3), rep(nrow(Blood), 3)), 3) ),
		labels = list(BP = "Systolic Blood Pressure", method = "Measurement Device"),
		order.groups = FALSE )
		

		
		dat = subset(blood, subset = meth != "S")

#####################################################################
 fit1r = lme(y ~ meth-1, data = dat,   #Symm , Symm#
     random = list(item=pdSymm(~ meth-1)), 
     weights=varIdent(form=~1|meth),
     correlation = corSymm(form=~1 | item/repl), 
     method="ML")

 fit2r = lme(y ~ meth-1, data = dat,   #CS , Symm#
     random = list(item=pdCompSymm(~ meth-1)),
     correlation = corSymm(form=~1 | item/repl), 
     method="ML")
  
 fit3r = lme(y ~ meth-1, data = dat,   #Symm , CS# 
     random = list(item=pdSymm(~ meth-1)),
     weights=varIdent(form=~1|meth), 
     correlation = corCompSymm(form=~1 | item/repl), 
     method="ML")

 fit4r = lme(y ~ meth-1, data = dat,   #CS , CS# 
     random = list(item=pdCompSymm(~ meth-1)), 
     correlation = corCompSymm(form=~1 | item/repl), 
     method="ML")

 test1r = anova(fit1r,fit2r)                     # Between-Subject Variabilities
 test2 = anova(fit1r,fit3r)                    # Within-Subject Variabilities
 test3 = anova(fit1r,fit4r)                    # Overall Variabilities   
