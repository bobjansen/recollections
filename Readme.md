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

