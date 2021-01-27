#include <stdexcept>
#include <queue>
#include <RcppCommon.h>
using namespace Rcpp;

//' Priority Queue class
//' @export
template <class T>
class PriorityQueue {
private:
  std::priority_queue<T> * innerHeap;

public:
  PriorityQueue() : innerHeap(new std::priority_queue<T>()) {};
  ~PriorityQueue() {
    delete innerHeap;
  }

  bool empty() {
    return innerHeap->empty();
  }

  void clear() {
    while (!innerHeap->empty()) {
      innerHeap->pop();
    }
  }

  int size() {
    return innerHeap->size();
  }

  void push(T value) {
    innerHeap->push(value);
  }

  void pop() {
    if (!empty()) {
      innerHeap->pop();
    } else {
      throw std::length_error("Priority Queue empty, can't pop()");
    }
  }

  T top() {
    if (empty()) {
      throw std::length_error("Priority Queue empty, can't top()");
    }
    return innerHeap->top();
  }

  T topAndPop() {
    T topValue = top();
    innerHeap->pop();
    return topValue;
  }
};
