# recollections

Collections for R are collections as can be found in Python's collections
module implemented using Rcpp.

Very much a work in progress.

# Supported data structures

At the moment recollections exposes the following C++ STL data structures to R:

- Bounded priority queue based on `std::map`
- Dictionary (hash table) based on `std::unordered_map`
- Priority queue based on `priority_queue`
- Sequences (Step Sequence, Cyclic Sequence, Prime Sequence)
- String Builder (custom implementation based on `std::vector<std::string>`

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
- `top()` returns and removes the top element of a container
