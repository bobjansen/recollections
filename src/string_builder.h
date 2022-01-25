#ifndef string_builder_h
#define string_builder_h

#include <sstream>
#include <string>
#include <vector>
#include <RcppCommon.h>
using namespace Rcpp;

//' String Builder class
//' @export
class StringBuilder {
public:
  void append(const std::string);
  void append_vector(const std::vector<std::string>);
  std::string toString() const;

private:
  std::vector<std::string> strs;
  std::vector<size_t> sizes;
  size_t total_size = 0;
};

#endif
