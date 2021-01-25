#include "dictionary.h"

RCPP_MODULE(dictionary_module) {
  class_<Dictionary>("Dictionary")
  .constructor();
}
