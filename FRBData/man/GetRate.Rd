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
firstof(year = 1970, month = 1, day = 1, hour = 0, min = 0, sec = 0, tz = "")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{year,month,day}{ numerical values to specify a day }
  \item{hour,min,sec}{ numerical vaues to specify time within a day }
  \item{tz}{ timezone used for conversion }
}
\details{
A wrapper to the \R function ISOdatetime with
defaults corresponding to the first or last
possible time in a given period.
}
\value{
An object of class POSIXct.
}
\author{Shinichi Takayanagi}
\examples{
lastof(2007)
lastof(2007,10)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ utilities }