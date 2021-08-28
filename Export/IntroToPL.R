# Introduction to Profile Likelihood
#

#################################################
#
# http://www.stat.tamu.edu/~suhasini/teaching613/profile_likelihood.pdf
# cran.r-project.org/web/packages/ProfileLikelihood/ProfileLikelihood.pdf‎
# http://support.sas.com/documentation/cdl/en/etsug/63348/HTML/default/viewer.htm#etsug_model_sect052.htm
# people.upei.ca/hstryhn/stryhn208.pdf‎
#
#################################################
#
# Implementation of PL Confidence Intervals
#
# The suitable calculation of condence limits for this variance ratio are to be com-
# puted using the profile likelihood approach. 
# The R package profilelikelihood will be assessed for feasibility, particularly the command profilelikelihood.lme()

install.packages("profilelikelihood")
library(profilelikelihood)
