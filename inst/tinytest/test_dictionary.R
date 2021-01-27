library(recollections)
dict <- recollections::dictionary()

expect_equal(
  capture.output(print(dict)),
  "[1] \"Dictionary container\""
)

# Check the empty method on dictionary ---
expect_true(empty(dict))

# Fill the dictionary with values and check the correct mapping ----
dict['foo'] <- 1L
setValue(dict, 'bar', 2L)
expect_false(empty(dict))
expect_equal(dict['foo'], 1L)
expect_equal(getValue(dict, 'foo'), 1L)
expect_equal(dict['bar'], 2L)
expect_equal(getValue(dict, 'bar'), 2L)

#' Check that the keys are exactly as expected ----
expect_equal(sort(keys(dict)), c('bar', 'foo'))

# Check updating ----
dict['foo'] <- 2L
expect_equal(dict['foo'], 2L)

# Check clearing ----
clear(dict)
expect_true(empty(dict))

# Key type conversion handling ----
dict <- recollections::dictionary()
expect_warning(setValue(dict, 1L, 1L))
expect_equal(dict['1'], 1L)
expect_equal(getValue(dict, '1'), 1L)
expect_warning(dict[1])

# List conversion and storing a data.frame ----
lst <- toList(dict)
expect_equal(lst, list(`1` = 1))
testDf <- data.frame(a = 1:3)
setValue(dict, 'df', testDf)
lst <- toList(dict)
expect_equal(lst$`1`, 1)
expect_equal(lst$df, testDf)

# Map, filter, reduce ----
dict <- recollections::dictionary()
setValue(dict, 'foo', 1L)
dict <- map(dict, function(x) x * 2)
expect_equal(dict['foo'], 2L)

dict <- recollections::dictionary(keys = letters[1:10], values = 1:10)
dict <- map(filter(dict, function(x) x %% 2 == 0), function(x) x * x)
expect_equal(size(dict), 5L)
expect_equal(dict['b'], 4L)
expect_equal(dict['d'], 16L)
expect_equal(dict['f'], 36L)
expect_equal(dict['h'], 64L)
expect_equal(dict['j'], 100L)

expect_equal(dict[c('b', 'd')], list(4L, 16L))
