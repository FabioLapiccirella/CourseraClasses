datastructure <- function(data, col_num, state) {
  state_subset <- data[data[, 7]==state, ]
  outcome_arr <- state_subset[, col_num]
  min <- min(outcome_arr, na.rm=T)
  min_index <- which(outcome_arr == min)
  hosp_name <- state_subset[min_index, 2]
  return(hosp_name)
}

best<-function(state,outcome){
  setwd("~/Documents/Classes/BigDATASpecialization/rprog%2Fdata%2FProgAssignment3-data")
  ##read outcome data
  crmsrs<-read.csv("outcome-of-care-measures.csv",colClasses="character")
  states<-crmsrs$State
  vldst<-state%in%states
  ##check that state and outcome are valid
  if((outcome!="heart attack")&&(outcome!="heart failure")&&(outcome!="pneumonia")){
    stop("invalid outcome")
  }#if
  if(vldst==F){
    stop("invalid state")
  }#if
  crmsrs[, 11] <- as.numeric(crmsrs[, 11]) # heart attack
  crmsrs[, 17] <- as.numeric(crmsrs[, 17]) # heart failure
  crmsrs[, 23] <- as.numeric(crmsrs[, 23]) # pneumonia
  
  ##return hospital name in that state with lowest 30-day death rate
  if(outcome == "heart attack") {
    hosp_name <- datastructure(crmsrs, 11, state)
  } else if(outcome == "heart failure") {
    hosp_name <- datastructure(crmsrs, 17, state)
  } else {
    hosp_name <- datastructure(crmsrs, 23, state)
  }#if
  result <- hosp_name
  return(result)
}#best