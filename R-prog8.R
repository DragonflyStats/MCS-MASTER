

REF = lme( y ~ meth  , data = dat , 
method="ML" ,  random = list( item = pdSymm( ~ meth-1  ) ) ,  
weights = varIdent( form = ~1 | meth ) ,  
correlation = corSymm( form = ~1 | item/repl) )


NMB = lme( y ~ meth  , data = dat , 
method="ML" ,  
random = list( item= pdCompSymm( ~ meth-1  ) ) ,  
weights = varIdent( form = ~1 | meth ) ,  
correlation = corSymm( form = ~1 | item/repl ) )


NMW = lme( y ~ meth  , data = dat , 
method="ML" ,  
random = list( item = pdSymm( ~ meth-1 ) ) ,  
#weights = varIdent( form = ~1 | meth ) ,  
correlation = corCompSymm( form = ~1 | item/repl ) )

NMO = lme(y ~ meth, data = dat , 
method="ML" ,  
random = list( item = pdCompSymm( ~ meth-1 ) ) ,  
#weights = varIdent( form = ~1 | meth ) ,  
correlation = corCompSymm( form = ~1 | item/repl ) )
