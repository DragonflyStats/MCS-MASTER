Grubbs Procedure
========================================================

### Fuse Data Set
This Data set is the running times of 20 mechanical fuses measured 
by operators stopping two independent clocks.


```r
Fuse <- 1:20
### Measuerement by first Instrument
Y1 <- c(4.85, 4.93, 4.75, 4.77, 4.67, 4.87, 4.67, 4.94, 4.85, 4.75, 4.83, 4.92, 
    4.74, 4.99, 4.88, 4.95, 4.95, 4.93, 4.92, 4.89)
### Measuerement by second Instrument
Y2 <- c(5.09, 5.04, 4.95, 5.02, 4.9, 5.05, 4.9, 5.15, 5.08, 4.98, 5.04, 5.12, 
    4.95, 5.23, 5.07, 5.23, 5.16, 5.11, 5.11, 5.08)
```

### Identity Plot

```r
par(font.lab = 2, font.axis = 2, cex = 1.7)
plot(Y1, Y2, pch = 16, col = "red", ylim = c(4.5, 5.5), xlim = c(4.5, 5.5))
title("Identity Plot - Grubbs's Fuse Data")
abline(a = 0, b = 1, col = "blue", lwd = 2)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Preliminary Calculations / Bland-Altman Analysis

```r
Ds = Y2 - Y1
Ss = Y2 + Y1
```

According to conventionally used procedure, there is a significant inter-method bias between both methods.

```r
## Mean of Case-wise Differences
mean(Ds)
```

```
## [1] 0.2105
```

```r
## Limits of Agreement
c(mean(Ds) - 1.96 * sd(Ds), mean(Ds) + 1.96 * sd(Ds))
```

```
## [1] 0.1422 0.2788
```

```r
## Paired t-test
t.test(Y2, Y1, paired = T)$p.value
```

```
## [1] 1.281e-16
```

### Using the BB procedure
Case-wise difference regressed on case-wise sums.

```r

FitBB <- lm(Ds ~ Ss)

summary(FitBB)$coefficients
```

```
##              Estimate Std. Error t value Pr(>|t|)
## (Intercept)  0.304368    0.43300  0.7029   0.4911
## Ss          -0.009467    0.04366 -0.2168   0.8308
```

```r
anova(FitBB)
```

```
## Analysis of Variance Table
## 
## Response: Ds
##           Df  Sum Sq Mean Sq F value Pr(>F)
## Ss         1 0.00006 0.00006    0.05   0.83
## Residuals 18 0.02303 0.00128
```

### Scatterplot of BB regression



```r
par(font.lab = 2, font.axis = 2, cex = 1.7)
plot(Ss, Ds, pch = 16, col = "red", ylab = "Case-wise Differences", xlab = "Case-wise Sums", 
    ylim = c(-0.05, 0.35))
title("Grubbs's Fuse Data")
abline(coef(FitBB), col = "blue", lwd = 2)
abline(h = 0, col = "green", lwd = 1.5)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 


