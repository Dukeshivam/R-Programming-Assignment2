setwd("C:/Users/Shivam Dey/OneDrive/Documents/GitHub/R-Programming-Assignment2/R-Programming-Assignment2")

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  
  
 
  set <- function(y) {
    x <<- y
    inv <<- NULL  
  }

  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()  
  
  if (!is.null(inv)) {
    message("Getting cached inverse")
    return(inv)
  }
  
  mat <- x$get()  
  inv <- solve(mat, ...)
  x$setInverse(inv)  
  
  return(inv)
}



mat <- matrix(c(9,7,4,1), nrow = 2, ncol = 2)


cacheMat <- makeCacheMatrix(mat)


cacheSolve(cacheMat)  


cacheSolve(cacheMat) 

