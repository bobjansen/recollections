#include "string_builder.h"

void StringBuilder::append(const std::string chunk) {
  size_t size = chunk.size();
  sizes.push_back(size);
  total_size += chunk.size();
  strs.push_back(chunk);
}

void StringBuilder::append_vector(const std::vector<std::string> chunks) {
  for (std::string chunk : chunks) {
    strs.push_back(chunk);
    total_size += chunk.size();
  }
}

std::string StringBuilder::toString() const {
  std::string output;
  output.reserve(total_size + 1);
  for (std::string str : strs) {
    output.append(str);
  }
  return output;
}
