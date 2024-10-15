# Logistic regression analyses for Colyer, Hoover, and Healy (n.d)

# clear data
rm(list=ls())

# libraries
library(lme4)


# Rerun for each data set separately 


#Read in file
#setwd('ADD FILE PATH')

d <- read.csv('output_all_LR.csv', header=T)
#d <- d[d$Dataset=='Human',] #human
#d <- d[d$Dataset=='Llama2',] #llama2
#d <- d[d$Dataset=='MIXTRAL',] #mixtral


# Testing the effect of CBType
modela<-glmer(Accuracy ~ ProblemType*CBType + (1|Subject), data=d, family = binomial(logit))
modelc<-glmer(Accuracy ~ ProblemType + (1|Subject), data= d, family = binomial(logit))
modelcomp <- anova(modela, modelc)
summary(modelcomp)

# Leaving out gender and CBType
modela<-glmer(Accuracy ~ ProblemType + (1|Subject), data=d, family = binomial(logit))
summary(modela)


#critical stats
est<-summary(modela)$coefficients[2]; est
se<-summary(modela)$coefficients[4]; se
OR <- exp(abs(est)); OR
chi_2 <- summary(modela)$coefficients[6]^2; chi_2
CIlower<-exp((-1.96*se)+abs(est)); CIlower
CIupper<-exp((1.96*se)+abs(est)); CIupper

# Calculate Odds Ratios by hand
# table(d$Dataset, d$ProblemType, d$Accuracy)
# (369/13)/(155/227) # human
# (1257/271)/(258/1270) # Llama 2
# (1483/45)/(952/576) # Mixtral




