library(recollections)
countingDictionary <- recollections::counter()

expect_equal(
  capture.output(print(countingDictionary)),
  "[1] \"Counter container\""
)

# Check the empty method on counterionary ---
expect_true(empty(countingDictionary))

countingDictionary['foo'] = 1L
expect_false(empty(countingDictionary))
setValue(countingDictionary, 'bar', 2L)
expect_false(empty(countingDictionary))
expect_equal(countingDictionary['foo'], 1L)
expect_equal(getValue(countingDictionary, 'foo'), 1L)
expect_equal(countingDictionary['bar'], 2L)
expect_equal(getValue(countingDictionary, 'bar'), 2L)

expect_equal(sum(countingDictionary), 3L)

#' Check clearing ----
clear(countingDictionary)
expect_true(empty(countingDictionary))
