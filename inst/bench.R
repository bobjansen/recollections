set.seed(42)
strs <- sapply(sample(1:1000, 1000L, replace = TRUE), toString)

concat <- function(strs) {
  sb <- stringBuilder()
  for (str in strs) {
    push(sb, str)
  }
  toString(sb)
}

concat_vector <- function(strs) {
  sb <- stringBuilder()
  push(sb, strs)
  toString(sb)
}

microbenchmark::microbenchmark(
  paste = paste0(strs, collapse = ''),
  #sb = concat(strs),
  sb_vector = concat_vector(strs),
  times = 100
)

# Unit: milliseconds
# expr      min        lq     mean    median       uq      max neval
# paste 9.797136 11.665601 13.21613 13.117500 14.52953 19.10591   100
# sb_vector 8.087140  9.021894 10.25441  9.555681 10.59474 45.11554   100
