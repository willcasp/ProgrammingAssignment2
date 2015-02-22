## This function creates a special "matrix" object that can cache its inverse

## working functions
##   get - gets the matrix
##   updateMatrix - updates the matrix
##   getInverse - gets the cached matrix
##   updateMatrixInverse - creates the cached matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  updateMatrix <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  updateMatrixInverse <- function(inverse) m <<- inverse
  getInverse <- function() m
  list(updateMatrix = updateMatrix, get = get,
       updateMatrixInverse = updateMatrixInverse,
       getInverse = getInverse)
}


## This funciton computes thje inverse of the special "matrix" returned by makeCacheMatrix
##   If the inverse has already been calculated, it will retrieve the inverse from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  ## m is not null, inversion exists, grab from cache
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$updateMatrixInverse(m)
  return(m)

}
