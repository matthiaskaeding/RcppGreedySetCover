#' Fast Greedy Set Cover
#'
#' An implementation of the greedy algorithm for the set cover problem using Rcpp.
#' 
#' @references Vazirani, Vijay V. (2001), Approximation Algorithms (PDF), Springer-Verlag
#' 
#' @details 
#' The set cover problem is posed as follows: Given an universe of elements \emph{U} and \emph{F},
#' a collection of subsets of \emph{U}, find the smallest subcollection 
#' \emph{A} of \emph{F} that covers \emph{U}, i.e. the union of the sets in 
#' \emph{A} is \emph{U}.
#'  
#' The optimal solution is available via linear programming, however for large problem sizes a fast 
#' approximation is necessary. 
#' Such an approximation is given by the greedy algorithm. In pseudocode, 
#' the algorithm iterates the following steps until all elements are covered:
#' \itemize{
#'   \item Add the largest set of uncovered elements to \emph{A}.
#'   \item Remove covered elements.
#' }
#' This simple algorithm exhibits suprisingly good properties. 
#' For a nice introduction to the set cover problem and the properties 
#' of the greedy algorithm see Vazirani, 2001.
#' 
#' @docType package
#' @name RcppGreedySetCover-package
NULL