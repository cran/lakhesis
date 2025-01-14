
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="man/figures/logo.png" align="right" width="150px"/> lakhesis: Consensus Seriation for Binary Data

<!-- badges: start -->
<!-- badges: end -->

The `R` package `lakhesis` provides a heuristic-critical platform for
seriating binary data matrices through the exploration, selection, and
consensus of partially seriated sequences.

In brief, seriation (sequencing, ordination) involves putting a set of
things in an optimal order. In archaeology, seriation can be used to
establish a chronological order of contexts and find-types on the basis
of their similarity, i.e, that things come into and go out of fashion
with a peak moment of popularity. In ecology, the distribution of a
species may occur according to a preferred environmental condition that
diminishes as that environment changes. There are a number of R
functions and packages (especially
[`seriation`](https://github.com/mhahsler/seriation) and
[`vegan`](https://CRAN.R-project.org/package=vegan)) that provide means
to seriate or ordinate matrices, especially for frequency or count data.
While binary (presence/absence) data are often viewed as a reductive
case of frequency data, they can also present their own challenges for
seriation. Moreover, not all “incidence matrices” (the matrix of 0/1s
that record the joint incidence or occurrence for a row-column pairing)
will necessarily be well seriated. The selection of row and column
elements in the input is accordingly an intrinsic part of the task of
seriation. In this respect, `lakhesis` seeks to complement existing
methods in `R`, by focusing on binary data. It uses correspondence
analysis, a mainstay technique for seriation, which is then fit to a
reference curve that represents “ideally” seriated data. Multiple
seriations can be run on partial subsets of the initial incidence
matrix, which are then recompiled into a single consensus seriation.
Critical measures are also provided.

While command line functions can be run in `R`, the functionality of
`lakhesis` is primarily achieved via the Lakhesis Calculator, a
graphical platform in `shiny` that enables investigators to explore
datasets for potential seriated sequences, select them, and then
harmonize them into a single consensus seriation. The four panels in the
calculator include the following:

- **Seriation Explorer** (Top left) Displays the correspondence analysis
  of a dataset which has been fit to the curve an “ideal” seriation. Two
  plots are available, the biplot of the row and column CA scores as
  they have been fit to an ideally seriated curve, and a plot showing
  the orthogonal projection of the row and column scores as they have
  been fit to the reference curve. Selections can be made on either the
  biplot or the reference plot.
- **Consensus Seriation** (Top right) Displays the results of
  harmonizing selected partial seriations, which have been identified as
  “strands.” The process of deriving a consensus seriation entails a
  process of iterative regressions on partially seriated sequences which
  are harmonized via PCA, separately on row and column elements. The
  seriated incidence matrix is also displayed in this panel.
- **Criteria** (Bottom left) Critical coefficients to determine whether
  discordant strands should be removed and/or row or column elements
  should be suppressed from consideration. Agreement expresses whether a
  strand agrees with consensus seriation. Concentration expresses how
  well seriated the strand is with respect to both row and column
  values. Tabs marked deviance report on the goodness-of-fit of row and
  column elements in the consensus seriation using deviance with a
  quadratic-logistic model. Higher $p$ values will indicate poorer fit
  for a particular row or column element.
- **Modify** (Bottom right) Temporarily suppress row or column values
  from correspondence analysis, including recomputing the seriations
  from previously selected strands. Strands which have low agreement or
  high concentration may also be deleted in this panel.

The sidebar contains the following commands:

- **Choose CSV** Data must be with a header in a two-column “long”
  format of occurring pairs of row and column elements, where the first
  column contains a row element and the second column contains a column
  element of the incidence matrix.
- **Reinitialize** Resets the plots to their original, starting
  condition.
- **Recompute with Selection** Upon the selection of row and column
  points from the Seriation Explorer panel, this command will perform
  and fit CA only on the selection. To return to the initial dataset,
  press the Reinitialize button. The function `ca.procrustes.curve()`
  performs this task.
- **Save Selection as Strand** Record the displayed plot as a partial
  seriation, or “strand” (i.e., partial with respect to the initial
  data). Strands are sequenced according to their fit onto a reference
  curve which projects a sequence of ideally seriated data in the same
  dimensional space.
- **Lakhesize Strands** Constructs a consensus seriation of the selected
  strands using an iterative process of orthogonal and linear regression
  of partial rankings, with PCA to harmonize sequences. Results are
  displayed in the Consensus Seriation panel, which displays the PCA
  biplot of the row and column consensus seriations separately. The
  matrix plot displays the incidence matrix of the resulting consensus
  seriation, with its coefficient of concentration. The agreement of the
  seriation in each strand with that of the consensus seriation as well
  as its concentration coefficient is displayed in the Criteria panel.
  The function `lakhesize()` performs this task.
- **Run Deviance Test** Performs a goodness-of-fit test using deviance,
  treating the distribution of the row and column incidences with a
  quadratic-logistic model. The largest $p$ values of the row and column
  elements is contained in the Criteria panel. The function
  `element.eval()` performs this task.
- **Export Data** Will download results in a single `.rds` file, which
  is a `list` containing the following objects:
  - `results` The results of `lakhesize()`, itself a `list` which
    contains the consensus seriation, the row and column PCA, and
    coefficients of agreement and concentration.
  - `strands` The strands selected to produce `results`.
  - `im.seriated` The seriated incidence matrix (this matrix only
    includes row and column elements selected in the strands, not all
    rows and columns of the initial dataset).

## Installation

To obtain the current development version of `lakhesis` from GitHub,
install from GitHub in the `R` command line with:

``` r
library(devtools)
install_github("scollinselliott/lakhesis") 
```

## Usage

To start the Lakhesis Calculator, execute the function `LC()`:

``` r
library(lakhesis)
LC()
```

Note that in uploading a `csv` file for analysis inside the Lakhesis
Calculator, the file should consist of just two columms without headers.
If data are already in incidence matrix format, the `im.long()` function
in `lakhesis` can be used to convert an incidence matrix to be exported
into the necessary long format, using the `write.table()` function to
export (see documentation on `im.long()`).

## Bibliography

Hahsler M, Hornik K, Buchcta C (2008). “Getting Things in Order: An
Introduction to the R Package seriation.” *Journal of Statistical
Software*, **25**, 1-34.
[doi:10.18637/jss.v025.i03](https://doi.org/10.18637/jss.v025.i03).

Ihm P (2005). “A Contribution to the History of Seriation in
Archaeology.” In Weihs C, Gaul W (eds.), *Classification - The
Ubiquitous Challenge*, 307-16. Springer, Berlin.

Nenadic O, Greenacre MJ (2007). “Correspondence Analysis in R, with Two-
and Three-dimensional Graphics: The ca Package.” *Journal of Statistical
Software*, **20**, 1-13.
[doi:10.18637/jss.v020.i03](https://doi.org/10.18637/jss.v020.i03).

ter Braak CJF, Looman, CWN. (1986). “Weighted Averaging, Logistic
Regression and the Gaussian Response Model.” *Vegetatio* **65**, 3-11.
[doi:10.1007/BF00032121](https://doi.org/10.1007/BF00032121).
