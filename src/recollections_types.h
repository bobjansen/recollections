#include <string>
#include <vector>
#include <Rcpp.h>
#include "dictionary.h"
#include "priority_queue.h"
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

RCPP_MODULE(priority_queue_module) {
  class_<PriorityQueue<RObject>>("PriorityQueue")
    .constructor()

    .method("clear", &PriorityQueue<RObject>::clear)
    .method("empty", &PriorityQueue<RObject>::empty)
    .method("pop", &PriorityQueue<RObject>::pop)
    .method("push", &PriorityQueue<RObject>::push)
    .method("size", &PriorityQueue<RObject>::size)
    .method("top", &PriorityQueue<RObject>::top)
    .method("topAndPop", &PriorityQueue<RObject>::topAndPop)
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

  class_<Sequence<RangeSequence>>("RangeSequence_")
    .constructor()
    .method("nextItem", &Sequence<RangeSequence>::nextItem)
    .method("getIndex", &Sequence<RangeSequence>::getIndex)
    .method("take", &Sequence<RangeSequence>::take)
  ;

  class_<RangeSequence>("RangeSequence")
    .derives<Sequence<PrimeSequence>>("RangeSequence_")
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
