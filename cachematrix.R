##makeCacheMatrix: Essentially what my function does is that it creates a matrix object that caches its inverse.
##cacheSolve: what the second function does is that it computes inverse of matrix returned by makeCacheMatrix

A <- matrix(c(2,3,4,5),2,2)
solve(A)
A1 <- makeCacheMatrix(A)
cacheSolve(A1) 

makeCacheMatrix <- function(y = matrix()) {
  i <- NULL
  set <- function(z) {
    y <<- z
    i <<- NULL
  }
  get <- function() y
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
cacheSolve <- function(y) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("got cached data")
    return(i)
  }
  data <- y$get()
  i <- solve(data)
  y$setinverse(i)
  i
}