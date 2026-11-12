sample_info
str(sample_info)

library(dplyr)
sample_info |> filter(age>25)
sample_info |> select(sample,age)
sample_info |> mutate(age_months=age*12)
sample_info |> arrange(desc(age))
sample_info |> group_by(age_group)
sample_info |> group_by(condition) |> summarise(mean_age = mean(age))


sample_info |>
  filter(age > 25) |>
  group_by(condition) |>
  summarise(mean_age = mean(age)) |>
  arrange(desc(mean_age))
