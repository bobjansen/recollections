# recollections

Collections for R are collections as can be found in Python's collections
module implemented using Rcpp.

Very much a work in progress.

# Supported data structures

At the moment recollections exposes the following C++ STL data structures to R:

- Bounded priority queue based on `std::map`
- Dictionary (hash table) based on `std::unordered_map`
- Priority queue based on `std::priority_queue`
- String Builder (custom implementation based on `std::vector<std::string>`

and several sequences:
- Cyclic Sequence
- Prime Sequence
- Step Sequence

which can be accessed using `nextItem(sequence)`, `take(sequence, n)` and
`takeWhile(sequence, fun)`.

# Example use

## Dictionary

```R
# Function and indexing style
dict <- recollections::dictionary()
dict['foo'] <- 1L
setValue(dict, 'bar', 2L)
dict['foo'] # 1L
getValue(dict, 'bar')  # 2L

# Pipes
dict <- recollections::dictionary() |>
  setValue('foo', 1L) |>
  setValue('bar', 2L)
dict['bar'] # 2L
dict['foo'] # 1L
```

## Lazy sequences

```R
cycleSeq <- cycleSequence(5, 25, 5)
unlist(take(cycleSeq, 10L))  # [1]  5 10 15 20 25 10 15 20 25 10

primeSeq <- recollections::primeSequence()
for (i in 1:10) {
  cat(nextItem(primeSeq), ' ')  # 2  3  5  7  11  13  17  19  23  29
}
unlist(takeWhile(primeSeq, \(val) val < 50L))  # [1] 31 37 41 43 47
unlist(take(primeSeq, 5L))  # [1] 53 59 61 67 71

stepSeq <- stepSequence(5L, 4L)
unlist(take(stepSeq, 10L))  # [1]  5  9 13 17 21 25 29 33 37 41
```

# API

The data structures have the following S3-methods (where applicable):

- `clear()` clears the contents of a container
- `empty()` check for emptiness
- `filter()` find all elements that satisfy a test
- `keys()` gathers all keys in a container
- `map()` applies a function to all values in a container
- `pop()` removes the top item from a container
- `push()` adds an element to a container
- `setValue()` sets a value for a key
- `size()` the size of a container
- `top()` the top item from a container
- `topAndPop()` returns and removes the top element of a container
