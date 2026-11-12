gene_expression<-c(3.4,5.6,13.4,4.3,12,2.3)
gene_expression
gene_expression[3]
gene_expression[4:6]
gene_expression[gene_expression>10]
sum(gene_expression)

rows=c("gene1","gene2","gene3","gene4")
cols=c("sample1","sample2","sample3")

exp_matrix<-matrix(1:12,nrow = 4 ,ncol = 3, dimnames = list(rows,cols))
exp_matrix

exp_matrix[,"sample1"]
exp_matrix["gene1",]
exp_matrix["gene1","sample3"]


condition <- factor(c("control","control","control","treated","treated","treated"))

levels(condition)
factor(condition, levels = c("treated", "control"))
condition <- relevel(condition, ref = "control") 
condition

lm(gene_expression ~ condition)

sample_info <- data.frame(
  sample = c("sample1","sample2","sample3","sample4","sample5","sample6"),
  condition = condition,
  age = c(25, 31, 28, 40, 35, 29)
)
sample_info
str(sample_info)
sample_info[sample_info$age>30,]
sample_info[sample_info$condition=="treated",]
sample_info$age_group<- ifelse(sample_info$age>30,"old","young")

my_list <- list(expr = gene_expression, matrix = exp_matrix, info = sample_info)
my_list$expr
my_list$matrix
my_list$info$age
my_list$matrix["gene1",]
my_list[["matrix"]]
