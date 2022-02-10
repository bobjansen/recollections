#' Counter object inspired on Python collections.Counter
#'
#' @param ... Initial values of the counter.
#' @return A dictionary of class counter.
#' @export
counter <- function(...) {
  container <- new(Dictionary)

  dots <- list(...)
  for (name in names(dots)) {
    container$insert(name, dots[[name]])
  }

  structure(list(container = container), class = 'Counter')
}

#' Create a counter object from a list of strings
#'
#' @param lst A list of items, will be coerced to \code{character}.
#' @return A dictionary with the as keys the distinct elements of the input list
#' and as values the count of these elements.
#' @export
counterFromList <- function(lst) {
  lst <- as.character(lst)
  container <- new(Dictionary)
  for (elem in lst) {
    tryCatch({
      val <- container$at(elem)
      container$insert(elem, val + 1L)
    }, error = function(e) container$insert(elem, 1L)
    )
  }
  structure(list(container = container), class = 'Counter')
}

#' @export
`[.Counter` <- function(container, key) {
  getValue.Counter(container, key)
}

#' @export
getValue.Counter <- function(container, key) {
  tryCatch({
    container$container$at(key)
  }, error = function(e) 0L
  )
}

#' @export
setValue.Counter <- function(container, key, value) {
  container$container$insert(key, value);
  container
}

#' @export
`[<-.Counter` <- function(container, key, value) {
  setValue.Counter(container, key, value)
}

#' @export
empty.Counter <- function(container) {
  container$container$empty()
}

#' @export
clear.Counter <- function(container) {
  container$container$clear()
}

#' @export
keys.Counter <- function(container) {
  container$container$keys()
}

#' @export
print.Counter <- function(x, ...) {
  print("Counter container", ...)
}

#' Convert a Counter to a list
#' @param container The Counter to convert.
#' @return A list.
#' @export
toList.Counter <- function(container) {
  container$container$list()
}

#' @export
sum.Counter <- function(..., na.rm = FALSE) {
  container <- list(...)[[1]]
  sum <- 0L
  for (key in keys(container)) {
    sum <- sum + getValue(container, key)
  }
  sum
}
