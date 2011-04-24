\name{GetInterestRates}
\alias{GetInterestRates}
\title{Download various interest rate}
\description{
Download various interest rate.
}
\usage{
  GetInterestRates(id, lastObs, from, to)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{id}{series ID. you can select an id in following ID list.}
  \item{lastObs}{ positive integer. downloaded data size.}
  \item{from,to}{ start and end date. "Date" object}
}
\details{
Download various interest rate. GetInterestRates function is only API function. But, user
 can download various interest rate data via "id" parameter. See below list for selectable "id".
 \itemize{
  \item{FF:Federal funds effective rate}
  \item{NFCP:AA Nonfinancial Commercial Paper Interest Rate}
  \item{FCP:AA Financial Commercial Paper Interest Rate}
  \item{CD:Average rate on each month neogtiable certificates of deposit (secondary market),quoted on an investment basis}
  \item{ED:Eurodollar deposits (London)}
  \item{PRIME:PRIMEBank prime loan.Average majority prime rate charged by banks on short-term loans to business, quoted on an investment basis}
  \item{DWPC:Discount window primary credit.The rate charged for primary credit under amendment to the Board's Regulation A}
  \item{TB":U.S. government securities/Treasury bills (secondary market)}
  \item{TCMNOM:U.S. government securities/Treasury constant maturities/Nominal}
  \item{TCMII:U.S. government securities/Treasury constant maturities/Inflation indexed}
  \item{LTAVG:U.S. government securities/Inflation-indexed/Long-term average.(over 10 years)}
  \item{SWAPS:Interest rate swaps}
  \item{AAA:Corporate bonds/Moody's seasoned Aaa}
  \item{BAA:Corporate bonds/Moody's seasoned Baa}
  \item{SL:State &amp local bonds.BOND BUYER GO 20-BOND MUNICIPAL BOND INDEX}
  \item{MORTG:Conventional mortgages.CONTRACT RATE ON 30-YEAR, FIXED-RATE CONVENTIONAL HOME MORTGAGE COMMITMENTS}
  }
}
\value{
An object of class xts.
}
\author{Shinichi Takayanagi<teramonagi@gmail.com>}
\examples{
#Treasury rate
GetInterestRates("TCMNOM",lastObs = 10)
#Swap rate
GetInterestRates("SWAPS",from = as.Date("2011/04/11"), to = as.Date("2011/04/19"))
}