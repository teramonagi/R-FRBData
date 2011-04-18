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
GetRate(series = "c5025f4bbbed155a6f17c587772ed69e", col.name = "Rate", lastObs = 30)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lastObg}{ numerical values to data size }
  \item{from,to}{ start and end date string such as "04/11/2010"}
}
\details{
Download various interest rate. GetRate function is the most generic function. But, user need to specify "series ID" which you would like to get.
Because user don't have to search "series ID", other functions(ex :GetTreasuryRate) are very easy to use.
}
\value{
An object of class xts.
}
\author{Shinichi Takayanagi}
\examples{
#Treasury,Swap,TIPS,Fedral rate,
GetTreasuryRate(lastObs = 10)
GetSwapRate(from = "04/01/2011", to = "04/15/2011")
GetTIPSRate(from = "04/01/2011", to = "04/15/2011")
GetFFRate(lastObs=20)
#not recommend
GetRate(series = "c5025f4bbbed155a6f17c587772ed69e",
  col.name = "Rate", lastObs = 30)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ utilities }