## Fabio Emilio Lapiccirella

## makeCacheMatrix creates a list that includes:
## an invertible square matrix
## functions to:
## print the matrix, 
## calculate its inverse,
## print its inverse;

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<-y
    i <<-NULL
  }#end of set
  get <-function() x
  setinverse <- function(solve) i<<-solve
  getinverse <- function() i
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}#end of makeCacheMatrix


## cacheSolve is a function that reuses the inbuilt R function "solve" 
## to calculate the inverse of a matrix x;
## however, as opposed to the function "solve", it does not explicitly calculate 
## the inverse if it was previously calculated on the same matrix;

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <-x$getinverse()
  if(!is.null(i)){
    message("gettin' cache data")
    return(i)
  }#endif
  data<-x$get()
  i<-solve(data,...)
  x$setinverse(i)
  i
}#end of cacheSolve