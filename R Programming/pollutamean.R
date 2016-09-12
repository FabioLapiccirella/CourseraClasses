setwd("~/Documents/Classes/BigDATASpecialization/R Programming")

pollutantmean <- function(directory="./specdata", pollutant, id=1:332){
  #this is the return vector
  mean_vector <- c()
  #if directory is not specdata
  #we assume directory is the CORRECT folder name for the file list
  if (grep(directory,"./specdata")!=TRUE){
    directory = paste("./",directory,sep=""0)
  }#if
  
}