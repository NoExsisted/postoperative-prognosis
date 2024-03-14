library(rms)
library(ggplot2)
library(survival)
library(showtext)
library(Cairo)

data <- read.csv("汇总.csv", fileEncoding = 'gb2312')

dd <- datadist(data)
options(datadist = "dd")
#names(data)
#model <- lrm(label ~ age + asa分级, data=data)
model <- lrm(label ~ 中性粒细胞绝对值 + age + asa分级 + 是否吸烟 + 心脏病 + 高血压 + 糖尿病, data=data)
#中性粒细胞绝对值 + age + asa分级 + 是否吸烟 + 心脏病 + 高血压 + 糖尿病

CairoPDF(file="nomo2.pdf", width = 10)
showtext_begin()
plot(nomogram(model, fun=identity, funlabel=c("Risk")))
showtext_end()
dev.off()