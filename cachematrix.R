## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#library(MASS) is used to calculate inverse for non squared as well as squared matrices
library(MASS)
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function()x                    #function to get matrix
  setInv <- function(inverse)inv <<- inverse
  getInv <- function() {
    inver<-ginv(x)
    inver%*%x   #function to get inverse ofmatrix
  }
  list(set = set, get = get, 
       setInv = setInv, 
       getInv = getInv)
}

cacheSolve <- function(x, ...) {
  inv <- x$getInv()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data,...)
  x$setInv(inv)
 inv
        }

   

