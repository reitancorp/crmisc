#' Format P-values for publication
#'
#' Formats your numeric p-values to a truncated character string fit for publication.
#' For instance; 0.00000431 will be returned as "<0.001", and 0.005 as "0.006".
#'
#' @param x a numeric value (= a p-value in numeric form)
#'
#' @return A character string. 
#' 
cr_format.pval <- function(x){
  if(!is.numeric(x)){
    stop("p-value not numeric.")
    }
  if(x < .001){
    out <- "<0.001"
  }
  else {
    out <- as.character(round(x * 1000) / 1000)
  }
  return(out)
}