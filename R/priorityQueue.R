#' Priority Queue object
#'
#' A priority queue backed by C++'s \code{std::priority_queue}.
#'
#' @param ... Initial values of the priority queue.
#'
#' @export
priorityQueue <- function(...) {
  container <- new(PriorityQueue)

  dots <- list(...)
  for (dot in dots) {
    container$push(dot)
  }

  structure(list(container = container), class = 'PriorityQueue')
}

#' @export
empty.PriorityQueue <- function(container) {
  container$container$empty()
}

#' @export
clear.PriorityQueue <- function(container) {
  container$container$clear()
  container
}

#' @export
pop.PriorityQueue <- function(container) {
  container$container$pop()
  container
}

#' @export
print.PriorityQueue <- function(x, ...) {
  print("Priority Queue container", ...)
}

#' @export
push.PriorityQueue <- function(container, value) {
  container$container$push(value)
  container
}

#' @export
size.PriorityQueue <- function(container) {
  container$container$size()
}

#' @export
top.PriorityQueue <- function(container) {
  container$container$top()
}

#' @export
topAndPop.PriorityQueue <- function(container) {
  container$container$topAndPop()
}

#' @export
toList.PriorityQueue <- function(container) {
  container$container$list()
}
