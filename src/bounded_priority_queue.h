#include <map>
#include <string>
#include "RcppCommon.h"
using namespace Rcpp;

//' Bounded Priority map class
//' @export
class BoundedPriorityQueue {
public:
  BoundedPriorityQueue(int maxSize) : maxSize(maxSize) {}

  void clear() {
    innerMap.clear();
  }

  bool empty() const {
    return innerMap.empty();
  }

  void pop() {
    if (empty()) {
      throw std::length_error("Bounded Priority Queue empty, can't pop()");
    }
    innerMap.erase(std::prev(innerMap.cend()));
  }

  List toList() const {
    List list = List::create();
    for (auto const& kv : innerMap) {
      list[std::to_string(kv.first)] = kv.second;
    }
    return list;
  }

  size_t size() const {
    return innerMap.size();
  }

  void insert(int count, RObject value) {
    if (size() == maxSize) {
      innerMap.erase(innerMap.begin());
    }
    innerMap.insert({count, value});
  }

  RObject top() const {
    if (empty()) {
      throw std::length_error("Bounded Priority Queue empty, can't pop()");
    }
    return std::prev(innerMap.cend())->second;
  }

  RObject topAndPop() {
    if (empty()) {
      throw std::length_error(
          "Bounded Priority Queue empty, can't topAndPop()"
      );
    }
    const auto it = std::prev(innerMap.cend());
    const RObject val = it->second;
    innerMap.erase(it);
    return val;
  }

private:
  const int maxSize;
  std::map<int, RObject> innerMap;
};
