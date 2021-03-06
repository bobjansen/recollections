% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/boundedPriorityQueue.R
\name{boundedPriorityQueue}
\alias{boundedPriorityQueue}
\title{Bounded Priority Queue object}
\usage{
boundedPriorityQueue(size = NULL, ...)
}
\arguments{
\item{size}{Size of the queue. If not given, the size of the arguments is
used.}

\item{...}{Initial values of the priority queue.}
}
\description{
A priority queue backed by C++'s \code{std::priority_queue}.
}
