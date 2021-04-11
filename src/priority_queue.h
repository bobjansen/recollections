#include <queue>
#include <stdexcept>
#include <RcppCommon.h>
using namespace Rcpp;

//' Priority Queue class
//' @export
class PriorityQueue {
private:
  std::priority_queue<int> * innerHeap;

public:
  PriorityQueue() : innerHeap(new std::priority_queue<int>()) {};
  ~PriorityQueue() {
    delete innerHeap;
  }

  bool empty() const {
    return innerHeap->empty();
  }

  void clear() {
    while (!innerHeap->empty()) {
      innerHeap->pop();
    }
  }

  int size() const {
    return innerHeap->size();
  }

  void push(int value) {
    innerHeap->push(value);
  }

  void pop() {
    if (!empty()) {
      innerHeap->pop();
    } else {
      throw std::length_error("Priority Queue empty, can't pop()");
    }
  }

  int top() const {
    if (empty()) {
      throw std::length_error("Priority Queue empty, can't top()");
    }
    return innerHeap->top();
  }

  int topAndPop() {
    int topValue = top();
    innerHeap->pop();
    return topValue;
  }
};
