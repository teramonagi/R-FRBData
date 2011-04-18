pkgname <- "FRBData"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('FRBData')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("GetRate")
### * GetRate

flush(stderr()); flush(stdout())

### Name: GetRate
### Title: download interest rate
### Aliases: GetRate GetTreasuryRate GetSwapRate GetTIPSRate GetFFRate
### Keywords: utilities

### ** Examples

#Treasury,Swap,TIPS,Fedral rate,
GetTreasuryRate(lastObs = 10)
GetSwapRate(from = "04/01/2011", to = "04/15/2011")
GetTIPSRate(from = "04/01/2011", to = "04/15/2011")
GetFFRate(lastObs=20)
#not recommend
GetRate(series = "c5025f4bbbed155a6f17c587772ed69e",
  col.name = "Rate", lastObs = 30,)



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
