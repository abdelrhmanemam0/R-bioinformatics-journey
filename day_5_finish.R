library(dplyr)
genes2 <- data.frame(
  gene    = c("A", "B", "C", "D", "E"),
  control = c(5.0, 6.0, 7.0, 8.0, 9.0),
  treated = c(5.5, 3.0, 7.2, 5.0, 12.0)
)
dim(genes2)
names(genes2)

genes2 <- genes2 |> mutate(change = treated - control)
genes2

genes2 |> filter(change < -2)

genes2 |> arrange(change)

genes2<- genes2 |> mutate(direction = ifelse(change > 0, "up", "down"))
