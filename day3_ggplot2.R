library(dplyr)
library(ggplot2)
set.seed(1)
exp_df<- data_frame(
  sample=paste0("s",1:20) ,
  condition = rep(c("control","treated"),each=10) ,
  expression = c(rnorm(10,mean = 8 , sd =1) , rnorm(10, mean = 6 ,sd=1))
)
exp_df$condition<-factor(exp_df$condition,levels = c("control","treated"))

ggplot(exp_df, aes(x = condition, y = expression)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(width = 0.1)
ggsave("boxplot.png")
