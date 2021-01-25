#include <Rcpp.h>
#include <map>
using namespace Rcpp;

class Dictionary {
private:
  std::map<std::string, int> * innerMap;

public:
  Dictionary() : innerMap() {};

  ~Dictionary() {
    delete innerMap;
  }
};

