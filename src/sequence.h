#include <RcppCommon.h>
using namespace Rcpp;

template <class T>
class Sequence {
public:
  RObject nextItem() {
    index++;
    if (next_item != nullptr) {
      RObject tmp = next_item;
      next_item = nullptr;
      return tmp;
    }
    return static_cast<T*>(this)->nextImpl();
  };

  int getIndex() const {
    return index;
  }

  RObject peek() {
    if (next_item == nullptr) {
      next_item = static_cast<T*>(this)->nextImpl();
    }
    return next_item;
  }

  RObject take(int n) {
    std::vector<RObject> output(n);
    for (int i = 0; i < n; i++) {
      output[i] = nextItem();
    }
    return wrap(output);
  }

private:
  int index = 0;
  RObject next_item = nullptr;
};

class IntSequence : public Sequence<IntSequence> {
private:
  int lastVal;

public:
  IntSequence() : lastVal(0) {}
  IntSequence(int lastVal) : lastVal(lastVal) {}

  RObject nextImpl() {
    lastVal++;
    return wrap(lastVal);
  }
};

class StepSequence : public Sequence<StepSequence> {
private:
  int lastVal;
  const int step;

public:
  StepSequence(int initVal, int step) : lastVal(initVal), step(step) {}

  RObject nextImpl() {
    int retVal = lastVal;
    lastVal += step;
    return wrap(retVal);
  }
};

class CycleSequence : public Sequence<CycleSequence> {
private:
  int lastVal;
  const int start;
  const int maxVal;
  const int step;

public:
  CycleSequence(int initVal, int maxVal, int step) :
  lastVal(initVal), start(lastVal), maxVal(maxVal), step(step) {}

  RObject nextImpl() {
    int retVal = lastVal;
    lastVal += step;
    if (lastVal > maxVal) {
      lastVal = lastVal - maxVal + start;
    }
    return wrap(retVal);
  }
};

class PrimeSequence : public Sequence<PrimeSequence> {
private:
  long lastPrime = 2;
  std::vector<long> primes;

public:
  PrimeSequence() {
    primes.push_back(2);
  }

  RObject nextImpl() {
    long candidate = lastPrime + (lastPrime == 2 ? 1 : 2);
    while (candidate > 0) {
      for (size_t i = 0; i < primes.size(); i++) {
        int prime = primes[i];
        if (prime * prime > candidate) {
          primes.push_back(candidate);
          int retVal = lastPrime;
          lastPrime = candidate;
          return wrap(retVal);
        }
        if (candidate % prime == 0) {
          break;
        }
      }
      candidate += 2;
    }
    throw std::range_error("Prime larger than storable in long");
  }
};
