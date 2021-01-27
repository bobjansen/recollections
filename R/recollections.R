#' @import methods
#' @importFrom Rcpp evalCpp
#' @useDynLib recollections, .registration=TRUE

.onLoad <- function(libname, pkgname) {
  Rcpp::loadModule('dictionary_module', TRUE)
  Rcpp::loadModule('priority_queue_module', TRUE)
  Rcpp::loadModule('sequence_module', TRUE)
}
