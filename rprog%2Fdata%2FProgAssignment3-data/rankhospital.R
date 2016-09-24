rankhospital <- function(state,outcome,num="best"){
  setwd("~/Documents/Classes/BigDATASpecialization/rprog%2Fdata%2FProgAssignment3-data")
  ## Read outcome data
  crmsrs<-read.csv("outcome-of-care-measures.csv",colClasses="character")
  states<-crmsrs$State
  vldst<-state%in%states
  ha<-11
  hf<-17
  pn<-23
  crmsrs[,ha]<-as.numeric(crmsrs[,ha],na.rm=T)
  crmsrs[,hf]<-as.numeric(crmsrs[,hf],na.rm=T)
  crmsrs[,pn]<-as.numeric(crmsrs[,pn],na.rm=T)
  ## Check that state and outcome are valid
  if((outcome!="heart attack")&&(outcome!="heart failure")&&(outcome!="pneumonia")){
    stop("invalid outcome")
  }#if
  if(vldst==F){
    stop("invalid state")
  }#if
  ## Return hospital name in that state with the given rank
  if(outcome=="heart attack"){
    result <- subset(crmsrs,State==state,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack==num)
  }else if(outcome=="heart failure"){
    result <- subset(crmsrs,State==state,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure==num)
  }else if(outcome=="pneumonia"){
    result <- subset(crmsrs,State==state,Hospital.30.Day.Readmission.Rates.from.Pneumonia==num)
  }#if
  result$Hospital.Name
  ## 30-day death rate
}#rankhospital