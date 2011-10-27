\name{FRBData-package}
\alias{FRBData-package}
\alias{FRBData}
\docType{package}
\title{
FRBData: Download financial data from FRB's website
}
\description{
This package provide functions which can get financial and economical data from FRB's website.(http://www.federalreserve.gov)
}
\details{
\tabular{ll}{
Package: \tab FRBData\cr
Type: \tab Package\cr
Version: \tab 0.3\cr
Date: \tab 2011-10-27\cr
License: \tab BSD\cr
LazyLoad: \tab yes\cr
}
Easily download financial data from FRB's website.Especially, the functions which import interest rate are implemented at this time. In the future, other financial and economic data such as consumer credit and industrial production will be available.
}
\author{
Shinichi Takayanagi<teramonagi (at) gmail.com>
}
\examples{
#Treasury rate
GetInterestRates("TCMNOM",lastObs = 10)
}