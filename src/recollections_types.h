#include <string>
#include <vector>
#include <Rcpp.h>
#include "bounded_priority_queue.h"
#include "dictionary.h"
#include "priority_queue.h"
#include "string_builder.h"
#include "sequence.h"

RCPP_MODULE(dictionary_module) {
  class_<Dictionary>("Dictionary")
    .constructor()
    .constructor<std::vector<std::string>, GenericVector>()

    .method("at", &Dictionary::at)
    .method("clear", &Dictionary::clear)
    .method("empty", &Dictionary::empty)
    .method("filter", &Dictionary::filter)
    .method("insert", &Dictionary::insert)
    .method("keys", &Dictionary::keys)
    .method("list", &Dictionary::list)
    .method("map", &Dictionary::map)
    .method("size", &Dictionary::size)
  ;
}

RCPP_MODULE(string_builder_module) {
  class_<StringBuilder>("StringBuilder")
    .constructor()
    .method("append", &StringBuilder::append)
    .method("append_vector", &StringBuilder::append_vector)
    .method("toString", &StringBuilder::toString)
  ;
}

RCPP_MODULE(priority_queue_module) {
  class_<PriorityQueue>("PriorityQueue")
    .constructor()

    .method("clear", &PriorityQueue::clear)
    .method("empty", &PriorityQueue::empty)
    .method("pop", &PriorityQueue::pop)
    .method("push", &PriorityQueue::push)
    .method("size", &PriorityQueue::size)
    .method("toList", &PriorityQueue::toList)
    .method("top", &PriorityQueue::top)
    .method("topAndPop", &PriorityQueue::topAndPop)
  ;
}

RCPP_MODULE(bounded_priority_queue_module) {
  class_<BoundedPriorityQueue>("BoundedPriorityQueue")
  .constructor<int>()

  .method("clear", &BoundedPriorityQueue::clear)
  .method("empty", &BoundedPriorityQueue::empty)
  .method("insert", &BoundedPriorityQueue::insert)
  .method("pop", &BoundedPriorityQueue::pop)
  .method("size", &BoundedPriorityQueue::size)
  .method("toList", &BoundedPriorityQueue::toList)
  .method("top", &BoundedPriorityQueue::top)
  .method("topAndPop", &BoundedPriorityQueue::topAndPop)
  ;
}

RCPP_MODULE(sequence_module) {

  class_<Sequence<IntSequence>>("IntSequence_")
    .constructor()
    .method("nextItem", &Sequence<IntSequence>::nextItem)
    .method("getIndex", &Sequence<IntSequence>::getIndex)
    .method("take", &Sequence<IntSequence>::take)
  ;

  class_<IntSequence>("IntSequence")
    .derives<Sequence<IntSequence>>("IntSequence_")
    .constructor()
  ;

  class_<Sequence<StepSequence>>("StepSequence_")
    .constructor()
    .method("nextItem", &Sequence<StepSequence>::nextItem)
    .method("getIndex", &Sequence<StepSequence>::getIndex)
    .method("take", &Sequence<StepSequence>::take)
  ;

  class_<StepSequence>("StepSequence")
    .derives<Sequence<StepSequence>>("StepSequence_")
    .constructor<int, int>()
  ;

  class_<Sequence<CycleSequence>>("CycleSequence_")
    .constructor()
    .method("nextItem", &Sequence<CycleSequence>::nextItem)
    .method("getIndex", &Sequence<CycleSequence>::getIndex)
    .method("take", &Sequence<CycleSequence>::take)
  ;

  class_<CycleSequence>("CycleSequence")
    .derives<Sequence<CycleSequence>>("CycleSequence_")
    .constructor<int, int, int>()
  ;

  class_<Sequence<PrimeSequence>>("PrimeSequence_")
    .constructor()
    .method("nextItem", &Sequence<PrimeSequence>::nextItem)
    .method("getIndex", &Sequence<PrimeSequence>::getIndex)
    .method("take", &Sequence<PrimeSequence>::take)
  ;

  class_<PrimeSequence>("PrimeSequence")
    .derives<Sequence<PrimeSequence>>("PrimeSequence_")
    .constructor()
  ;

}
