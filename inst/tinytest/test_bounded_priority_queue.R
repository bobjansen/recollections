library(recollections)
bpq <- recollections::boundedPriorityQueue(4L)

expect_equal(
  capture.output(print(bpq)),
  "[1] \"Bounded Priority Queue container\""
)

# Check the empty method on priority queue ---
expect_true(empty(bpq))

setValue(bpq, 2L, 'second')
expect_false(empty(bpq))
setValue(bpq, 1L, 'first')
expect_false(empty(bpq))

setValue(bpq, 3L, 'third')
expect_false(empty(bpq))

expect_equal(topAndPop(bpq), 'third')
expect_equal(topAndPop(bpq), 'second')

#' Check clearing ----
expect_false(empty(bpq))
clear(bpq)
expect_true(empty(bpq))

bpq <- recollections::boundedPriorityQueue(2L, `1` = 'f', `2` = 's', `3` = 't')
expect_equal(size(bpq), 2L)
expect_equal(toList(bpq), list(s = 2L, t = 3))
expect_equal(topAndPop(bpq), 't')
expect_equal(topAndPop(bpq), 's')
expect_true(empty(bpq))
