
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

## Usage example

``` r
# Create some data
set.seed(333)
X <- data.table::data.table(
  set = sample(1e5, 1e7, TRUE), 
  element = sample(2e3, 1e7, TRUE), 
  key = c("set", "element")
)
# Input is in long format
head(X) 
#>    set element
#> 1:   1      12
#> 2:   1      19
#> 3:   1      32
#> 4:   1      45
#> 5:   1      51
#> 6:   1      62
# Run set cover
tictoc::tic()
res <- RcppGreedySetCover::greedySetCover(X)
#> 100% covered by 42 sets.
tictoc::toc() # Takes about 10 seconds for 10 million rows on a Macbook Air M1
#> 10.509 sec elapsed
# Result is in long format
head(res) 
#>     set element
#> 1: 1689     447
#> 2: 1689     458
#> 3: 1689     505
#> 4: 1689     792
#> 5: 1689     798
#> 6: 1689     816
# Check if all elements are covered:
setequal(res$element, X$element)
#> [1] TRUE
```
