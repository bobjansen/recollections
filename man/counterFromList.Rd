% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/counter.R
\name{counterFromList}
\alias{counterFromList}
\title{Create a counter object from a list of strings}
\usage{
counterFromList(lst)
}
\arguments{
\item{lst}{A list of items, will be coerced to \code{character}.}
}
\value{
A dictionary with the as keys the distinct elements of the input list
and as values the count of these elements.
}
\description{
Create a counter object from a list of strings
}
