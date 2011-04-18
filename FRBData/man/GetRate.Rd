\name{GetRate}
\alias{GetRate}
\alias{GetTreasuryRate}
\alias{GetSwapRate}
\alias{GetTIPSRate}
\alias{GetFFRate}
\title{download interest rate}
\description{
Download various interest rate.
}
\usage{
GetTreasuryRate(lastObs=10, from = "", to = "")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lastObg}{ numerical values to data size }
  \item{from,to}{ start and end date string such as "04/11/2010"}
}
\details{

}
\value{
An object of class xts.
}
\author{Shinichi Takayanagi}
\examples{
  GetTreasuryRate(lastObs=10, from = "", to = "")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ utilities }