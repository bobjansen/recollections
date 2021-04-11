#ifndef priority_queue_h
#define priority_queue_h

#include <queue>
#include <stdexcept>
#include <RcppCommon.h>
using namespace Rcpp;

//' Priority Queue class
//' @export
class PriorityQueue {
public:
  bool empty() const {
    return innerHeap.empty();
  }

  void clear() {
    while (!innerHeap.empty()) {
      innerHeap.pop();
    }
  }

  List toList() {
    List list = List::create();
    while (!empty()) {
      list.push_back(topAndPop());
    }
    return list;
  };

  int size() const {
    return innerHeap.size();
  }

  void push(int value) {
    innerHeap.push(value);
  }

  void pop() {
    if (!empty()) {
      innerHeap.pop();
    } else {
      throw std::length_error("Priority Queue empty, can't pop()");
    }
  }

  int top() const {
    if (empty()) {
      throw std::length_error("Priority Queue empty, can't top()");
    }
    return innerHeap.top();
  }

  int topAndPop() {
    int topValue = top();
    innerHeap.pop();
    return topValue;
  }

private:
  std::priority_queue<int> innerHeap;
};

#endif
