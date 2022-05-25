#' @title rhia_ordlista
#' 
#' @description 
#' Conversion list for RIKS-HIA variable levels
#'
#' A list containing a named vector for each RIKS-HIA variable. 
#' The vector can be accessed subsetting the list on variable name. 
#' Note that all variable names is in lowercase
#' 
#'
#' @format A named list with 299 items.
#' 
#' @source \url{https://www.ucr.uu.se/swedeheart/dokument-sh/variabellista}
#' 
#' @example  rikshia %>% mutate(LIPID = relevel(LIPID, !!!rhia_ordlista$lipid))
#' 
#' 
"rhia_ordlista"


#' @title scaar_ordlista
#' 
#' @description 
#' Conversion list for SCAAR variable levels
#'
#' A list containing a named vector for each SCAAR variable. 
#' The vector can be accessed subsetting the list on variable name. 
#' Note that all variable names is in lowercase
#' 
#'
#' @format A named list 
#' 
#' @source \url{https://www.ucr.uu.se/swedeheart/dokument-sh/variabellista}
#' 
#' 
"scaar_ordlista"

#' @title sephia_ordlista
#' 
#' @description 
#' Conversion list for SEPHIA variable levels
#'
#' A list containing a named vector for each SEPHIA variable. 
#' The vector can be accessed subsetting the list on variable name. 
#' Note that all variable names is in lowercase
#' 
#'
#' @format A named list 
#' 
#' @source \url{https://www.ucr.uu.se/swedeheart/dokument-sh/variabellista}
#' 
#' 
"sephia_ordlista"

#' @title sh_gem_ordlista
#' 
#' @description 
#' Conversion list for SWEDEHEART GEMENSAM variable levels
#'
#' A list containing a named vector for each SWEDEHEART GEMENSAM variable. 
#' The vector can be accessed subsetting the list on variable name. 
#' Note that all variable names is in lowercase
#' 
#'
#' @format A named list 
#' 
#' @source \url{https://www.ucr.uu.se/swedeheart/dokument-sh/variabellista}
#' 
#' 
"sh_gem_ordlista"