DownLoadData <- function(rel ,series, lastObs = "", from = "", to = ""){
  base     <- "http://www.federalreserve.gov/datadownload/Output.aspx?"
  rel      <- paste("rel=", rel, "&", sep = "")
  series   <- paste("series=", series, "&", sep = "")
  lastObs  <- paste("lastObs=", lastObs, "&", sep = "")
  from     <- paste("from=", from, "&", sep = "")
  to       <- paste("to=", to, "&", sep = "")
  filetype <- "filetype=csv&"
  label    <- "label=omit&"
  layout   <- "layout=seriescolumn"
  query    <- paste(base, rel, series, lastObs, from, to, filetype, label,layout,sep="")  
  return(read.csv(query, stringsAsFactors=FALSE))
}
CheckArguments <- function(lastObs = "", from = "", to = ""){
  if(lastObs != "" && (from != "" || to != "")){
    stop("one of 'lastObs' and date should be specified")
  }
  if((from != "" && to == "") || (from == "" && to != "")){
    stop("you must specify both 'from' and 'to'")
  }
}
GetRate <- function(series, col.name, lastObs = "", from = "", to = ""){
  CheckArguments(lastObs, from, to)

  rel    <- "H15"
  rate <- DownLoadData(rel = rel, series = series, lastObs = lastObs, from = from, to = to)[-1,]
  rate <- subset(rate, rate[,2] != "ND")
  warn.old <- getOption("warn")
  options(warn = -1)
  rate[,-1] <- if(ncol(rate) > 2){
    apply(rate[,-1], 2, as.numeric)
  }else{
    as.numeric(rate[, -1])
  }
  options(warn = warn.old)
  colnames(rate) <- c("DATE",col.name)  
  as.xts(read.zoo((rate)))
}
GetTreasuryRate <- function(lastObs = "", from = "", to = ""){
  series   <- "bf17364827e38702b42a58cf8eaa3f78"
  col.name <- c("1M","3M","6M","1Y","2Y","3Y","5Y","7Y","10Y","20Y","30Y")
  GetRate(series = series,col.name = col.name, lastObs = lastObs, from = from, to = to)
}
GetSwapRate <- function(lastObs = "", from = "", to = ""){  
  series   <- "7fbf8fc65ad44431bf467b3b7eef6bf2"
  col.name <- c("1Y","2Y","3Y","4Y","5Y","7Y","10Y","30Y")
  GetRate(series = series,col.name = col.name, lastObs = lastObs, from = from, to = to)
}
GetTIPSRate <- function(lastObs = "", from = "", to = ""){  
  series   <- "a5efc8cebeae2f178010054da08cb1f1"
  col.name <- c("5Y","7Y","10Y","20Y","30Y")
  GetRate(series = series,col.name = col.name, lastObs = lastObs, from = from, to = to)
}
GetFFRate <- function(lastObs = "", from = "", to = ""){  
  series   <- "c5025f4bbbed155a6f17c587772ed69e"
  col.name <- c("Rate")
  GetRate(series = series,col.name = col.name, lastObs = lastObs, from = from, to = to)
}


#setwd("C:/Documents and Settings/Administrator/My Documents/My Dropbox/code/R/FRBData/FRBData")
#x <- GetTreasuryRate(lastObs=10)
#y <- GetSwapRate()
#z <- GetTIPSRate()
#xx <- GetFFRate(lastObs=10)
#DownLoadData(
#  rel="H15",
#  series="bf17364827e38702b42a58cf8eaa3f78",
#)