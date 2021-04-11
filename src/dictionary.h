#include <string>
#include <unordered_map>
#include <vector>
#include <RcppCommon.h>
using namespace Rcpp;

//' Encapsulates a C++ std::unordered_map.
class Dictionary {
private:
  std::unordered_map<std::string, RObject> * innerMap;

public:
  Dictionary() : innerMap(new std::unordered_map<std::string, RObject>()) {};

  Dictionary(std::unordered_map<std::string, RObject>* map) : innerMap(map) {};

  Dictionary(std::vector<std::string> keys, GenericVector values) :
    innerMap(new std::unordered_map<std::string, RObject>()) {
    for (int i = 0; i < keys.size(); i++) {
      std::string key(keys[i]);
      RObject value = values[i];
      innerMap->insert({key, value});
    }
  };

  ~Dictionary() {
    delete innerMap;
  }

  RObject at(std::vector<std::string> keys) const {
    int n = keys.size();
    if (n > 1) {
      List list = List::create();
      for (std::string key : keys) {
        list.push_back(innerMap->at(key));
      }
      return list;
    } else if (n == 1) {
      return innerMap->at(keys.at(0));
    }
    return R_NilValue;
  }

  void clear() {
    innerMap->clear();
  }

  bool empty() const {
    return innerMap->empty();
  }

  Dictionary* map(Function fun) {
    auto filtered = new std::unordered_map<std::string, RObject>();
    for (auto const& kv : *innerMap) {
      filtered->insert({kv.first, fun(kv.second)});
    }
    return new Dictionary(filtered);
  }

  Dictionary* filter(Function fun) {
    auto filtered = new std::unordered_map<std::string, RObject>();
    for (auto const& kv : *innerMap) {
      auto check = as<bool>(fun(kv.second));
      if (check) {
        filtered->insert({kv.first, kv.second});
      }
    }
    return new Dictionary(filtered);
  }

  void insert(std::string key, RObject value) {
    const auto it = innerMap->find(key);
    if (it == innerMap->end()) {
      innerMap->insert({key, value});
    } else {
      it->second = value;
    }
  }

  std::vector<std::string> keys() const {
    std::vector<std::string> keysVector;
    for (auto const& kv : *innerMap) {
      keysVector.push_back(kv.first);
    }
    return keysVector;
  }

  List list() const {
    List list = List::create();
    for (auto const& kv : *innerMap) {
      list[kv.first] = kv.second;
    }
    return list;
  }

  int size() const {
    return innerMap->size();
  }
};
