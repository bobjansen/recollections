#' String Builder object
#'
#' A StringBuilder backed by C++'s \code{std::vector<std::string>} and
#' \code{std::stringstream}.
#'
#' @param ... Initial values of the priority queue.
#'
#' @export
stringBuilder <- function(...) {
  container <- new(StringBuilder)

  dots <- list(...)
  for (dot in dots) {
    container$append(dot)
  }

  structure(list(container = container), class = 'StringBuilder')
}

#' @import utils
#' @export
push.StringBuilder <- function(container, value) {
  if (length(value) > 1L) {
    container$container$append_vector(value)
  } else {
    if (is.object(value)) {
      container$container$append(utils::str(value))
    } else {
      container$container$append(toString(value))
    }
  }
}

#' @export
toString.StringBuilder <- function(x, ...) {
  x$container$toString()
}
