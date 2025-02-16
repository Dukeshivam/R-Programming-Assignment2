setwd("C:/Users/Shivam Dey/OneDrive/Documents/GitHub/R-Programming-Assignment2/R-Programming-Assignment2")

makeVector <- function(x = numeric()) {
  m <- NULL  
  
  set <- function(y) {
    x <<- y  
    m <<- NULL  
  }
  
  get <- function() x
  
  setmean <- function(mean) m <<- mean
  
  getmean <- function() m
  
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x,...) {
  m <- x$getmean()  
  
  if (!is.null(m)) {
    message("Getting cached mean")
    return(m)  
  }
  
  data <- x$get()  
  if (length(data) == 0) {
    stop("Error: Vector is empty")  
  }
  
  m <- mean(data,1)  
  x$setmean(m)  
  
  return(m)
}

v <- makeVector(c(1, 2, 3, 4, 5))  

cachemean(v)  
cachemean(v)  


