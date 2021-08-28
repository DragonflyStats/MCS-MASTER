Grubbs Procedure
========================================================

### Hypothetical Data Set

```r
Fuse <- 1:20
Y1 <- c(4.8, 4.75, 4.34, 5.1, 4.47, 4.02, 4.43, 6.45, 5.36, 6.62, 5.71, 6.45, 
    5.83, 5.4, 4.22)
Y2 <- c(4.62, 4.73, 4.84, 4.98, 4.05, 4.35, 4.84, 5.47, 5.02, 5.99, 5.13, 6.05, 
    6.02, 5.06, 3.83)
```

### Identity Plot

```r
par(font.lab = 2, font.axis = 2, cex = 1.7)
plot(Y1, Y2, pch = 16, col = "red", ylim = c(3.8, 6.8), xlim = c(3.8, 6.8))
title("Identity Plot - Hypothetical Data")
abline(a = 0, b = 1, col = "blue", lwd = 2)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Preliminary Calculations / Bland-Altman Analysis

```r
Ds = Y2 - Y1
Ss = Y2 + Y1
```

According to conventionally used procedure, there is **No** significant inter-method bias between both methods.

```r
## Mean of Case-wise Differences
mean(Ds)
```

```
## [1] -0.198
```

```r
## Limits of Agreement
c(mean(Ds) - 1.96 * sd(Ds), mean(Ds) + 1.96 * sd(Ds))
```

```
## [1] -1.0155  0.6195
```

```r
## Paired t-test
t.test(Y2, Y1, paired = T)$p.value
```

```
## [1] 0.08729
```

### Using the BB procedure
Case-wise difference regressed on case-wise sums.

```r

FitBB <- lm(Ds ~ Ss)

summary(FitBB)$coefficients
```

```
##             Estimate Std. Error t value Pr(>|t|)
## (Intercept)   1.1537    0.70340   1.640  0.12494
## Ss           -0.1326    0.06831  -1.941  0.07429
```

```r
anova(FitBB)
```

```
## Analysis of Variance Table
## 
## Response: Ds
##           Df Sum Sq Mean Sq F value Pr(>F)  
## Ss         1  0.547   0.547    3.77  0.074 .
## Residuals 13  1.888   0.145                 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

### Scatterplot of BB regression



```r
par(font.lab = 2, font.axis = 2, cex = 1.7)
plot(Ss, Ds, pch = 16, col = "red", ylab = "Case-wise Differences", xlab = "Case-wise Sums", 
    ylim = c(-1, 1))
title("Hypothetical Data")
abline(coef(FitBB), col = "blue", lwd = 2)
abline(h = 0, col = "green", lwd = 1.5)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 

