% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/incidence.R
\name{im.ref}
\alias{im.ref}
\title{Create Reference Matrix}
\usage{
im.ref(obj)
}
\arguments{
\item{obj}{A matrix of size \eqn{n \times k}.}
}
\value{
A matrix of size \eqn{n \times k} with 1s along the diagonal. If \eqn{n > k}, 1s are placed from cell \eqn{(i,i)} to \eqn{(i,i+k-n)}, with 0 in all other cells.
}
\description{
Create an ideal reference matrix of well-seriated values of the same size as the input matrix.
}
\examples{
im.ref(matrix(NA, 5, 5))
im.ref(matrix(1, 7, 12))

}
