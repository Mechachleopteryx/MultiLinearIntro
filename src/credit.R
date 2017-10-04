## salary <- 50000*exp(rnorm(15))
## debt <- 100000*exp(rnorm(15))
## annual.return <- 750 + 0.02*debt - 0.04*salary
## df <- data.frame(salary,debt,annual.return)
## write.table(df, file="credit2.csv", sep = ",", row.names=FALSE) 
library(scatterplot3d)
df <- read.table(file="credit.dat")
salary <- df[[1]]
debt <- df[[2]]
annual.return <- df[[3]]
model1 <- lm(annual.return ~ salary, df)
model2 <- lm(annual.return ~ debt, df)
model3 <- lm(formula = annual.return ~ salary + debt, data = df)
jpeg("model1.jpg")
plot(salary, annual.return, xlab="Salary, S / $", ylab="Annual Return, R / $")
abline(coef(model1))
dev.off()
jpeg("model2.jpg")
plot(debt, annual.return, xlab="Debt, D / $", ylab="Annual Return, R / $")
abline(coef(model2))
dev.off()
jpeg("model3.jpg")
sp <- scatterplot3d(salary, debt, annual.return, pch = 20, highlight.3d = TRUE, angle =60, xlab="Salary, S / $", ylab="Debt, D / $", zlab="Annual Return, R / $")
sp$plane3d(model3)
dev.off()

