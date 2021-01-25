#' @import methods
#' @importFrom Rcpp evalCpp
#' @useDynLib recollections, .registration=TRUE

.onLoad <- function(libname, pkgname) {
  Rcpp::loadModule('dictionary_module', TRUE)
}
