## Put comments here that give an overall description of what your
## functions do

## function creates a R object which stores a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    
    set <- function(y){
      s <- NULL
      x <<- y
    }
  
    get <- function() x
    
    getsolve <- function() s
    
    setsolve <- function(solve) s <<- solve
    
    list(set = set, get = get,
         getsolve = getsolve, setsolve = setsolve)    
}


## returns the inverse of a matrix stored in the R object.  Returns cahced value if already present, 
## else computes, stores and returns the inverse matrix

cacheSolve <- function(x, ...) {
   s <- x$getsolve()
   if(!is.null(s)){
     message("getting cached data")
     return(s)
   }
   
   s <- solve(x$get())
   x$setsolve(s)
   s
}
