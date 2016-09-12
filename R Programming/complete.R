setwd("~/Documents/Classes/BigDATASpecialization/R Programming")

complete <- function(directory="./specdata", id=1:332){
  cmpldt = c()
  #if directory is not specdata
  #we assume directory is the CORRECT folder name for the file list
  if (grep(directory,"./specdata")!=TRUE){
    directory = paste("./",directory,sep="")
  }#if
  files<-list.files(directory)
  paths<-paste(directory,files,sep="/")
  for (i in id){
    crfile<-read.csv(paths[i], header=T, sep=",")
    cmpldt<-c(cmpldt,sum(complete.cases(crfile)))
 
  }#for
  output <- data.frame("id"=id,"nobs"=cmpldt)
}