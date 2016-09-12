setwd("~/Documents/Classes/BigDATASpecialization/R Programming")

corr <- function(directory="./specdata", threshold=0){
  corr = c()
  #if directory is not specdata
  #we assume directory is the CORRECT folder name for the file list
  if (grep(directory,"./specdata")!=TRUE){
    directory = paste("./",directory,sep="")
  }#if
  files<-list.files(directory)
  paths<-paste(directory,files,sep="/")
  cmpldt=complete(directory,id=1:332)
  nobs<-cmpldt[,"nobs"]
  id <- subset(cmpldt,nobs>threshold)
  id <-id[,"id"]
  for (i in id){
    crfile<-read.csv(paths[i], header=T, sep=",")
    x <- crfile[,"sulfate"]
    y <- crfile[,"nitrate"]
    corr<-c(corr,cor(x,y,use="complete.obs"))
  }#for
  corr
}