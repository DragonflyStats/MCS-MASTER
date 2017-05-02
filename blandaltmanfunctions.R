
library(ggplot2)
set.seed(2063)  #Dr. Cochrane

bland <- function(x, y, titl=''){
  gg.data <- data.frame(x=x, y=y, avg=(x+y)/2, diff=(x-y))
  g <- ggplot(gg.data, aes(x=avg, y=diff)) + geom_point(size=4) + theme_bw()
  g <- g + theme(text=element_text(size=24), axis.text=element_text(colour='black'))
  g <- g + labs(x='Average', y='Difference') + ggtitle(titl)
  g <- g + geom_hline(yintercept=mean(gg.data$diff), colour='chocolate', size=1)
  g <- g + geom_hline(yintercept=mean(gg.data$diff) + 1.96*sd(gg.data$diff), colour='dodgerblue3', size=1,
                      linetype='dashed')
  g <- g + geom_hline(yintercept=mean(gg.data$diff) - 1.96*sd(gg.data$diff), colour='dodgerblue3', size=1,
                      linetype='dashed')
  g <- g + geom_point(size=4)                    
  plot(g)

}
