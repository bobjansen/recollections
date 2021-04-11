library(recollections)

# Integer sequence ----
intSeq <- recollections::integerSequence()
expect_equal(capture.output(print(intSeq)), "[1] \"Lazy Sequence\"")
expect_equal(nextItem(intSeq), 1L)
expect_equal(unlist(take(intSeq, 10L)), 2:11)
expect_equal(getIndex(intSeq), 11L)

# Step sequence ----
stepSeq <- recollections::stepSequence(10L, 2L)
expect_equal(capture.output(print(stepSeq)), "[1] \"Lazy Sequence\"")
expect_equal(nextItem(stepSeq), 10L)
expect_equal(unlist(take(stepSeq, 10L)), 1:10 * 2L + 10L)
expect_equal(getIndex(stepSeq), 11L)

# Cycle sequence ----
cycleSeq <- recollections::cycleSequence(1L, 4L, 2L)
expect_equal(capture.output(print(cycleSeq)), "[1] \"Lazy Sequence\"")
expect_equal(nextItem(cycleSeq), 1L)
expect_equal(unlist(take(cycleSeq, 3L)), c(3L, 2L, 1L))
expect_equal(getIndex(cycleSeq), 4L)

# Prime sequence ----
primeSeq <- recollections::primeSequence()
expect_equal(capture.output(print(primeSeq)), "[1] \"Lazy Sequence\"")
expect_equal(nextItem(primeSeq), 2L)
expect_equal(unlist(take(primeSeq, 4L)), c(3L, 5L, 7L, 11L))
expect_equal(getIndex(primeSeq), 5L)

primeSeq <- recollections::primeSequence()
expect_equal(
  unlist(takeWhile(primeSeq, \(x) x < 20L)),
  c(2L, 3L, 5L, 7L, 11L, 13L, 17L, 19L)
)
