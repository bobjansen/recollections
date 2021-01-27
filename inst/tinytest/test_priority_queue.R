library(recollections)
pq <- recollections::priorityQueue()

expect_equal(
  capture.output(print(pq)),
  "[1] \"Priority Queue container\""
)

# Check the empty method on priority queue ---
expect_true(empty(pq))

push(pq, 2L)
expect_false(empty(pq))
push(pq, 1L)
expect_false(empty(pq))

push(pq, 3L)
expect_false(empty(pq))

expect_equal(topAndPop(pq), 3L)
expect_equal(topAndPop(pq), 2L)

#' Check clearing ----
expect_false(empty(pq))
clear(pq)
expect_true(empty(pq))
