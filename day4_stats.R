library(dplyr)
library(ggplot2)
sample_info<-read.csv("sample_info.csv")
sample_info$condition<-factor(sample_info$condition)
set.seed(1)
exp_df <- data_frame(
  sample = paste0("s",1:20) ,
  condition = rep(c("control","treated"),each = 10) ,
  expression = c(rnorm(10,8,1) , rnorm(10,6,1))
)
m_age<-sample_info |> group_by(condition) |> summarise(mean_age=mean(age)) |> arrange(desc(mean_age))
 ggplot(m_age,aes( x= condition ,y=mean_age)) + 
   geom_col()
 t.test(expression ~ condition, data = exp_df)
 # Treated is lower than control by about 1.9 expression units
 # (mean 6.25 vs 8.13; 95% CI of the difference: 1.0 to 2.8; Welch t-test p = 0.0003).
 set.seed(1)
 exp_noisy <- data.frame(
   condition = rep(c("control", "treated"), each = 10),
   expression = c(rnorm(10, mean = 8, sd = 4), rnorm(10, mean = 6, sd = 4))
 )
 t.test(expression ~ condition, data = exp_noisy) 
 # No clear difference detected (mean 7.47 vs 6.48; 95% CI of the difference: -2.35 to 4.32;
 # Welch t-test p = 0.54). The data are too noisy to conclude either way.
 
 set.seed(1)
 n <- 100
 exp_big <- data.frame(
   condition = rep(c("control", "treated"), each = n),
   expression = c(rnorm(n, mean = 8, sd = 4), rnorm(n, mean = 6, sd = 4))
 )
 t.test(expression ~ condition, data = exp_big)
 # Treated is lower than control by about 2.6 expression units
 # (mean 5.85 vs 8.44; 95% CI of the difference: 1.55 to 3.62; Welch t-test p = 1.8e-06).
 # Same noise as exp_noisy (sd = 4), but with n = 100 per group the difference is clear. 