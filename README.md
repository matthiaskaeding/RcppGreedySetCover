
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RcppGreedySetCover

A fast implementation of the greedy algorithm for the set cover problem
using ‘Rcpp’.

## Installation

Newest version from github:

``` r
devtools::install_github("matthiaskaeding/RcppGreedySetCover")
```

CRAN:

``` r
install.packages("RcppGreedySetCover")
```

## Example

This is a basic example which shows you how to use the main function:

``` r
# Create some data.
set.seed(333)
X <- data.table::rbindlist(
 lapply(
   seq_len(1e4L),
   function(x) list(element = sample.int(n = 1e3L, size = sample.int(50L, 1L)))
 ),
 idcol="set"
)

# Input is in long format.
head(X) 
#>    set element
#> 1:   1     425
#> 2:   1     311
#> 3:   1     578
#> 4:   1     295
#> 5:   1     316
#> 6:   1       2

# Run set cover
res <- RcppGreedySetCover::greedySetCover(X)
#> 100% covered by 46 sets.

# Result is in long format.
head(res) 
#>    set element
#> 1:  71       7
#> 2:  71      28
#> 3:  71      40
#> 4:  71      42
#> 5:  71      55
#> 6:  71     111

# Check if all elements are covered:
setequal(res$element, X$element)
#> [1] TRUE
```
