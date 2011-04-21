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
### Title: download interest rate
### Aliases: GetInterestRates
### Keywords: utilities

### ** Examples

#Treasury rate
GetInterestRates("TCMNOM",lastObs = 10)
#Swap
GetInterestRates("SWAPS",from = "04/11/2011", to = "04/19/2011")



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
