#CONSTANTS
#hash : ID => SERIES,COL_NAME
ID <- list(
  FF     = list(SERIES = "c5025f4bbbed155a6f17c587772ed69e", COL_NAME = c("RATE")), 
  NFCP   = list(SERIES = "ca2dd1ccd5102a49176c86b6646496c3", COL_NAME = c("1M","2M","3M")),
  FCP    = list(SERIES = "268dcdcf1b746c42fb990fe2107b7dad", COL_NAME = c("1M","2M","3M")),
  CD     = list(SERIES = "563fd2e148652031b93255007c23142d", COL_NAME = c("1M","3M","6M")),
  ED     = list(SERIES = "57e92a3ca05fa75e5ca9d0d9558f2413", COL_NAME = c("1M","3M","6M")),
  PRIME  = list(SERIES = "02338be6957591cdba0a59c6f09b8389", COL_NAME = c("RATE")),
  DWPC   = list(SERIES = "e048853c9a3f0734b8538f508828f298", COL_NAME = c("RATE")),
  TB     = list(SERIES = "96d4341c20caff56fdbe729cf1ad8b9b", COL_NAME = c("4W","3M","6M","1Y")),
  TCMNOM = list(SERIES = "bf17364827e38702b42a58cf8eaa3f78", COL_NAME = c("1M","3M","6M","1Y","2Y","3Y","5Y","7Y","10Y","20Y","30Y")),
  TCMII  = list(SERIES = "a5efc8cebeae2f178010054da08cb1f1", COL_NAME = c("5Y","7Y","10Y","20Y","30Y")),
  LTAVG  = list(SERIES = "68447ee78d1e78718e4a96db9405d605", COL_NAME = c("RATE")),
  SWAPS  = list(SERIES = "7fbf8fc65ad44431bf467b3b7eef6bf2", COL_NAME = c("1Y","2Y","3Y","4Y","5Y","7Y","10Y","30Y")), 
  AAA    = list(SERIES = "64d2cda8bbf1712f9ffe7e31238b9618", COL_NAME = c("RATE")),
  BAA    = list(SERIES = "b2763fc01e872c23bc1aa1ef99a9a8de", COL_NAME = c("RATE")),
  SL     = list(SERIES = "56d5933a7e7f980c519de0a7228b808e", COL_NAME = c("RATE")),
  MORTG  = list(SERIES = "735a17440929c2d1c1291317cdfeffc0", COL_NAME = c("RATE"))
)
#APIs
GetInterestRates <- function(id, lastObs = 0, from = "", to = ""){
  lastObs <- ifelse(lastObs <= 0 , "", as.character(lastObs))
  CheckArguments(lastObs, from, to)

  rate <- DownLoadData(rel = "H15", series = ID[[id]]$SERIES, lastObs = lastObs, from = from, to = to)[-1,]
  rate <- subset(rate, rate[,2] != "ND")
  warn.old <- getOption("warn")
  options(warn = -1)
  rate[,-1] <- if(ncol(rate) > 2){
    apply(rate[,-1], 2, as.numeric)
  }else{
    as.numeric(rate[, -1])
  }
  options(warn = warn.old)
  colnames(rate) <- c("DATE",ID[[id]]$COL_NAME)  
  as.xts(read.zoo((rate)))
}
#private functions
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