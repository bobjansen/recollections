#ifndef bounded_priority_queue_h
#define bounded_priority_queue_h

#' Bounded Priority Queue object
#'
#' A priority queue backed by C++'s \code{std::priority_queue}.
#'
#' @param size Size of the queue. If not given, the size of the arguments is
#' used.
#' @param ... Initial values of the priority queue.
#'
#' @export
boundedPriorityQueue <- function(size = NULL, ...) {
  dots <- list(...)
  if (is.null(size)) {
    size = length(dots)
  }
  stopifnot(size > 1L)

  container <- new(BoundedPriorityQueue, size)

  for (name in names(dots)) {
    container$insert(as.integer(name), dots[[name]])
  }

  structure(list(container = container), class = 'boundedPriorityQueue')
}

#' @export
empty.boundedPriorityQueue <- function(container) {
  container$container$empty()
}

#' @export
clear.boundedPriorityQueue <- function(container) {
  container$container$clear()
  container
}

#' @export
pop.boundedPriorityQueue <- function(container) {
  container$container$pop()
  container
}

#' @export
print.boundedPriorityQueue <- function(x, ...) {
  print("Bounded Priority Queue container", ...)
}

#' @export
setValue.boundedPriorityQueue <- function(container, key, value) {
  container$container$insert(key, value)
  container
}

#' @export
size.boundedPriorityQueue <- function(container) {
  container$container$size()
}

#' @export
top.boundedPriorityQueue <- function(container) {
  container$container$top()
}

#' @export
topAndPop.boundedPriorityQueue <- function(container) {
  container$container$topAndPop()
}

#' @export
toList.boundedPriorityQueue <- function(container) {
  container$container$toList()
}

#endif
