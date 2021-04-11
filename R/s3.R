# S3 methods and default implementations

#' Clear (empty) a container
#'
#' See \code{\link{empty}()} to check whether a container is empty.
#'
#' @param container A container object.
#' @export
clear <- function(container) {
  UseMethod('clear')
}

#' @export
clear.default <- function(container) {
  stop('clear not implemented for ', class(container))
}

#' Check whether the given container is empty
#'
#' See \code{\link{clear}()} to clear a container.
#'
#' @param container A container object.
#' @export
empty <- function(container) {
  UseMethod('empty')
}

#' @export
empty.default <- function(container) {
  stop('empty not implemented for ', class(container))
}

#' Filter a container using \code{fun()}
#' @param container The container to filter.
#' @param fun A function that returns a logical based on a value in the
#' container.
#' @return The container after filtering.
#' @export
filter <- function(container, fun) {
  UseMethod('filter')
}

#' Get the current index of a sequence
#' @param container A lazy sequence.
#' @return The index.
#' @export
getIndex <- function(sequence) {
  UseMethod('getIndex')
}

#' Get a value from a container
#' @param container A container object.
#' @param key The key to get.
#' @return The value.
#' @export
getValue <- function(container, key) {
  UseMethod('getValue')
}

#' Get the keys in a container
#' @param container A container object.
#' @export
keys <- function(container) {
  UseMethod('keys')
}

#' Map the values in the container to new values suing \code{fun()}
#' @param container The container to map.
#' @param fun A function that returns a new value for each value in the
#' container.
#' @return The container with the values transformed using map.
#' @export
map <- function(container, fun) {
  UseMethod('map')
}

#' Get the next value in a sequence
#' @param sequence A lazy sequence.
#' @return The next item.
#' @export
nextItem <- function(sequence) {
  UseMethod('nextItem')
}

#' Push a value to a container
#' @param container A container object.
#' @export
pop <- function(container) {
  UseMethod('pop')
}

#' Push a value to a container
#' @param container A container object.
#' @param value Value to add to the container.
#' @export
push <- function(container, value) {
  UseMethod('push')
}

#' Set a value with the given key in the given container
#' @param container A container object.
#' @param key The key to set.
#' @param value The value to set.
#' @export
setValue <- function(container, key, value) {
  UseMethod('setValue')
}

#' Get the size in a container
#' @param container A container object.
#' @export
size <- function(container) {
  UseMethod('size')
}

#' @export
size.default <- function(container) {
  stop('size not implemented for ', class(container))
}

#' Take n elements
#' @param sequence A lazy sequence.
#' @param n The number of elements to take.
#' @export
#' @examples
#' seq <- primeSequence()
#' unlist(take(seq, 10))
take <- function(sequence, n) {
  UseMethod('take')
}


#' Take elements while the condition is true
#' @param sequence A lazy sequence.
#' @param condition Take numbers until this condition function is \code{FALSE}.
#' @export
#' @examples
#' seq <- primeSequence()
#' unlist(takeWhile(seq, \(x) x < 100L))
takeWhile <- function(sequence, condition) {
  UseMethod('takeWhile')
}


#' Return the top element
#' @param container A container object.
#' @export
top <- function(container) {
  UseMethod('top')
}

#' Remove and return the top element
#' @param container A container object.
#' @export
topAndPop <- function(container) {
  UseMethod('topAndPop')
}

#' Convert container to list.
#' @param container The container.
#' @return The list
#' @export
toList <- function(container) {
  UseMethod('toList')
}
