setwd("~/Documents/Classes/BigDATASpecialization/R Programming")

pollutantmean <- function(directory="./specdata", pollutant, id=1:332){
  mean_vector <- c()
  #if directory is not specdata
  #we assume directory is the CORRECT folder name for the file list
  if (grep(directory,"./specdata")!=TRUE){
    directory = paste("./",directory,sep="")
  }#if
 files<-list.files(directory)
 paths<-paste(directory,files,sep="/")
 for (i in id){
   crfile<-read.csv(paths[i], header=T, sep=",")
   #print(crfile)
   values<-na.omit(crfile[,pollutant])
   mean_vector <-c(mean_vector,values)
 }#for

 #output is the mean of the values in the CSV files related 
 #to the pollutant stored in the 'pollutant' parameter
 output <- mean(mean_vector)
 round(output,3)
}