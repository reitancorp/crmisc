#' @title Convert survex to survfit object
#' @description This function creates a simple data frame containing a survival curve from a survex object.
#' @param x a survexp object from the survexp function
#' @export

table_survexp <- function(x){
  data.frame(
  time = rep(x$time, times = dim(x$n.risk)[2]),
  surv = as.vector(x$surv),
  group = rep(colnames(x$surv), each = nrow(x$surv))

)
}
