pkgname <- "FRBData"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('FRBData')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("FRBData-package")
### * FRBData-package

flush(stderr()); flush(stdout())

### Name: FRBData-package
### Title: FRBData: Download financial data from FRB's website
### Aliases: FRBData-package FRBData

### ** Examples

#Treasury rate
GetInterestRates("TCMNOM",lastObs = 10)



cleanEx()
nameEx("GetInterestRates")
### * GetInterestRates

flush(stderr()); flush(stdout())

### Name: GetInterestRates
### Title: Download various interest rate
### Aliases: GetInterestRates

### ** Examples

#Treasury rate
GetInterestRates("TCMNOM",lastObs = 10)
#Swap rate
GetInterestRates("SWAPS",from = as.Date("2011/04/11"), to = as.Date("2011/04/19"))



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
