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

#' @export
push.StringBuilder <- function(container, chunk) {
  if (length(chunk) > 1L) {
    container$container$append_vector(chunk)
  } else {
    if (is.object(chunk)) {
      container$container$append(str(chunk))
    } else {
      container$container$append(toString(chunk))
    }
  }
}

#' @export
toString.StringBuilder <- function(container) {
  container$container$toString()
}
