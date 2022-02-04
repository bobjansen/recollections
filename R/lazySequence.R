#' Lazy sequence of natural numbers
#'
#' @return A lazy sequence of natural numbers.
#'
#' @export
#' @examples
#' seq <- integerSequence()
#' for (i in 1:4) {
#'   print(nextItem(seq))
#' }
integerSequence <- function() {
  structure(list(sequence = new(IntSequence)), class = 'Sequence')
}

#' Lazy sequence object of evenly spaced integers
#'
#' @param start The start of the sequence.
#' @param step The step size of the sequence, defaults to \code{1L}.
#' @return Lazy sequence object of evenly spaced integers starting at
#' \code{start} increasing by \code{step}..
#'
#' @export
#' @examples
#' seq <- stepSequence(1, 4)
#' for (i in 1:4) {
#'   print(nextItem(seq))
#' }
stepSequence <- function(start, step = 1L) {
  structure(
    list(sequence = new(StepSequence, start, step)), class = 'Sequence'
  )
}

#' Cycling sequence of integers
#'
#' @param start Start of the cycle, inclusive.
#' @param end End of the cycle, not included.
#' @param step The step size, defaults to \code{1L}.
#' @return Cycle sequence object of integers cycling from start to end by step
#' size.
#'
#' @export
#' @examples
#' seq <- cycleSequence(1, 4, 2)
#' for (i in 1:4) {
#'   print(nextItem(seq))
#' }
cycleSequence <- function(start, end, step = 1L) {
  structure(
    list(sequence = new(CycleSequence, start, end, step)), class = 'Sequence'
  )
}

#' Lazy sequence of primes
#'
#' @return Lazy sequence of primes.
#'
#' @export
#' @examples
#' seq <- primeSequence()
#' for (i in 1:4) {
#'   print(nextItem(seq))
#' }
primeSequence <- function() {
  structure(list(sequence = new(PrimeSequence)), class = 'Sequence')
}

#' @export
getIndex.Sequence <- function(sequence) {
  sequence$sequence$getIndex()
}

#' @export
nextItem.Sequence <- function(sequence) {
  sequence$sequence$nextItem()
}

peek.Sequence <- function(sequence) {
  sequence$sequence$peek()
}

#' @export
print.Sequence <- function(x, ...) {
  print("Lazy Sequence", ...)
}

#' @export
take.Sequence <- function(sequence, n) {
  sequence$sequence$take(n)
}

#' @export
takeWhile.Sequence <- function(sequence, condition) {
  output <- list()
  while (condition(peek(sequence))) {
    output <- c(output, nextItem(sequence))
  }
  output
}
