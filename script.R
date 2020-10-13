# Read data
t_control <- read.csv("control.csv")
names(t_control) <- c("t", names(t_control)[-1])
t_control$Gemiddeld <- NULL

t_jj <- read.csv("jj.csv")
names(t_jj) <- c("t", names(t_jj)[-1])
t_jj$Gemiddeld <- NULL

t_control_long <- tidyr::pivot_longer(
  t_control,
  cols = starts_with("X"),
  names_to = "person_id"
)
t_control_long$treatment <- "control"

t_jj_long <- tidyr::pivot_longer(
  t_jj,
  cols = starts_with("X"),
  names_to = "person_id"
)
t_jj_long$treatment <- "jj"
t <- rbind(t_control_long, t_jj_long)
t

library(ggplot2)
ggplot(
  t,
  aes(x = t, y = value, color = treatment)
) + geom_point() + geom_smooth() +
  scale_y_continuous("AUC of blood glucose concentration") +
  scale_x_continuous("time (minutes)") +
  ggtitle("AUCs in time") +
  ggsave("aucs_in_time.png", width = 7, height = 7)

t$person_id <- as.factor(t$person_id)

ggplot(
  t,
  aes(x = t, y = value, color = treatment)
) + geom_point() + geom_smooth() +
  scale_y_continuous("AUC of blood glucose concentration") +
  scale_x_continuous("time (minutes)") +
  ggtitle("AUCs in time") +
  facet_grid(person_id ~ .) +
  ggsave("aucs_in_time_pp.png", width = 7, height = 49)

t$gi <- NA

get_gi <- function(t, time = 15, person_id = "X1") {
  # Get the value for the control
  auc_control <- t[
    t$t == time & t$person_id == person_id & t$treatment == "control",
  ]$value
  # Get the value for the jj
  auc_jj <- t[
    t$t == time & t$person_id == person_id & t$treatment == "jj",
  ]$value

  # GI = jj / control
  auc_jj / auc_control
}

t
for (row_index in seq_len(nrow(t))) {
  t$gi[row_index] <- get_gi(
    t = t, time = t$t[row_index], person_id= t$person_id[row_index]
  )
}
t$gi[is.infinite(t$gi)] <- NA

ggplot(
  t,
  aes(x = t, y = gi, color = treatment)
) + geom_point() + geom_smooth() +
  scale_y_continuous("GI") +
  scale_x_continuous("time (minutes)") +
  ggtitle("GI in time") +
  ggplot2::geom_hline(yintercept = 0.0) +
  ggplot2::geom_hline(yintercept = 0.55) +
  ggplot2::geom_hline(yintercept = 0.70) +
  ggsave("gi_in_time.png", width = 7, height = 49)

# From https://en.wikipedia.org/wiki/Glycemic_index#Grouping
# that means JJ has a low glycemic index
sum_auc_control <- sum(t[t$treatment == "control", ]$value)
sum_auc_jj <- sum(t[t$treatment == "jj", ]$value)

# GI assuming control is glucose (with a GI of 100)
relative_gi <- sum_auc_jj / sum_auc_control

# Compared to white bread, the relative GI is 53%
testthat::expect_equal(relative_gi, 0.526013, tol = 0.000001)

# However, we know that white bread has a glycemic index of around 75
# (instead of 100 of glucose)
gi_control <- 75

# To calculate the GI of JJ we need to increase the relative GI
gi <- relative_gi / (gi_control / 100.0)
testthat::expect_equal(gi, 0.7013507, tol = 0.000001)

# A GI of 70% is a high GI [2]

## References
#
# * [2] Atkinson, Fiona S., Kaye Foster-Powell, and Jennie C. Brand-Miller. "International tables of glycemic index and glycemic load values: 2008." Diabetes care 31.12 (2008): 2281-2283.
# * [3] https://en.wikipedia.org/wiki/Glycemic_index#Grouping
