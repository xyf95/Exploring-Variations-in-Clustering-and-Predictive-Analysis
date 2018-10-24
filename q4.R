transferClassToNumber <- function(x){
  class_name <- levels(x)
  work_class <- c()
  for (i in 1:length(x)){
    index <- which(class_name == x[i])
    work_class <- append(work_class, index)
  }
  return(work_class)
}

dataset <- read.table("D:/blackboard/6444/outline/project2/adult(1).data", header = FALSE, sep = ",")
names(dataset) <- c("age", "workclass", "fnlwgt", "education", "education-num", "marital", "occupation", "relationship", "race", "sex", "capital-gain", "capital-loss", "hours-per-week", "native-country", "salary")
age <- dataset[[1]]
workclass <- transferClassToNumber(dataset[[2]])
fnlwgt <- dataset[[3]]
education <- transferClassToNumber(dataset[[4]])
education_num <- dataset[[5]]
marital <- transferClassToNumber(dataset[[6]])
occupation <- transferClassToNumber(dataset[[7]])
relationship <- transferClassToNumber(dataset[[8]])
race <- transferClassToNumber(dataset[[9]])
sex <- transferClassToNumber(dataset[[10]])
capital_gain <- dataset[[11]]
capital_loss <- dataset[[12]]
hours_per_week <- dataset[[13]]
native_country <- transferClassToNumber(dataset[[14]])
salary <- transferClassToNumber(dataset[[15]])
salary <- salary - 1

# get related features by PCA
pr <- princomp(data.frame(age, workclass, fnlwgt, education, education_num, marital, occupation, relationship, race, sex, capital_gain, capital_loss, hours_per_week, native_country), cor = TRUE)
summary(pr, loadings = TRUE)
lm_predicted <- lm(salary ~ age + workclass + fnlwgt + education + education_num + marital + occupation + relationship + sex + capital_gain + capital_loss + hours_per_week + native_country)
glm_binomimal <- glm(salary ~ age + workclass + fnlwgt + education + education_num + marital + occupation + relationship + sex + capital_gain + capital_loss + hours_per_week + native_country, family = binomial())
glm_gaussian <- glm(salary ~ age + workclass + fnlwgt + education + education_num + marital + occupation + relationship + sex + capital_gain + capital_loss + hours_per_week + native_country, family = gaussian())
glm_gamma <- glm((salary + 1) ~ age + workclass + fnlwgt + education + education_num + marital + occupation + relationship + sex + capital_gain + capital_loss + hours_per_week + native_country, family = Gamma())
glm_poisson <- glm((salary) ~ age + workclass + fnlwgt + education + education_num + marital + occupation + relationship + sex + capital_gain + capital_loss + hours_per_week + native_country, family = poisson())
