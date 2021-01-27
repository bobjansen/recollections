#' Dictionary object
#'
#' A dictionary object backed by C++'s \code{std::unordered_map}.
#'
#' @param ... Argument value pairs to put in the dictionary.
#' @param lst A list to put into the dictionary.
#' @param keys Keys to put into a dictionary. Needs to have the same length as
#' \code{values}.
#' @param values Values to put into a dictionary. Needs to have the same length
#' as \code{keys}.
#'
#' @return A dictionary object.
#'
#' @export
dictionary <- function(..., lst = NULL, keys = NULL, values = NULL) {
  container <- if (!is.null(lst)) {
    lstNames <- names(lst)
    if (is.null(lstNames)) {
      stop('List needs to be named')
    }
    new(Dictionary, lstNames, lst)
  } else if (!is.null(keys) && !is.null(values)) {
    new(Dictionary, keys, values)
  } else if (!is.null(keys) || !is.null(values)) {
    stop('Set both keys or values or neither')
  } else {
    container <- new(Dictionary)
    dots <- list(...)
    for (name in names(dots)) {
      container$insert(name, dots[[name]])
    }
    container
  }

  structure(list(container = container), class = 'Dictionary')
}

#' @export
`[.Dictionary` <- function(container, key) {
  getValue.Dictionary(container, key)
}

#' @export
getValue.Dictionary <- function(container, key) {
  if (!is(key, 'character')) {
    warning("Converting key of class '", class(key), "' to 'character'")
    key <- as.character(key)
  }
  tryCatch({
    container$container$at(key)
  }, error = function(e) NULL
  )
}

#' @export
setValue.Dictionary <- function(container, key, value) {
  if (!is(key, 'character')) {
    warning("Converting key of class '", class(key), "' to 'character'")
    key <- as.character(key)
  }
  container$container$insert(key, value);
  container
}

#' @export
`[<-.Dictionary` <- function(container, key, value) {
  setValue.Dictionary(container, key, value)
}

#' @export
empty.Dictionary <- function(container) {
  container$container$empty()
}

#' @export
clear.Dictionary <- function(container) {
  container$container$clear()
}

#' @export
filter.Dictionary <- function(container, fun) {
  structure(
    list(container = container$container$filter(fun)),
    class = 'Dictionary'
  )
}

#' @export
keys.Dictionary <- function(container) {
  unlist(container$container$keys())
}

#' @export
map.Dictionary <- function(container, fun) {
  structure(
    list(container = container$container$map(fun)),
    class = 'Dictionary'
  )
}

#' @export
print.Dictionary <- function(x, ...) {
  print("Dictionary container", ...)
}

#' @export
size.Dictionary <- function(container) {
  container$container$size()
}

#' @export
toList.Dictionary <- function(container) {
  container$container$list()
}
