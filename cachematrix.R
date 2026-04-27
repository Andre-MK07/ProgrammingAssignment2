         # This function creates a special "matrix object"
         # that can store (cache) its inverse once computed
makeCacheMatrix <- function(x = matrix()) {
  
  # This variable will store the inverse
  inverse <- NULL
  
  # Function to set a new matrix
  set <- function(y) {
    x <<- y              # update the matrix
    inverse <<- NULL     # reset cached inverse 
  }
  
  # Function to get the current matrix
  get <- function() {
    x
           }
  
  # Function to store the inverse
  setinverse <- function(solve_matrix) {
    inverse <<- solve_matrix
  }
  
  # Function to retrieve the cached inverse
  getinverse <- function() {
    inverse
  }
  
  # Return all functions as a list 
  list(
    set = set,
      get = get,
      setinverse = setinverse,
    getinverse = getinverse
  )
         }
      
          # This function computes the inverse of the matrix
        # BUT uses the cached version if it already exists
        cacheSolve <- function(x, ...) {
  
   # Try to get the cached inverse
  inverse <- x$getinverse()
  
  # If inverse already exists, return it immediately
  if (!is.null(inverse)) {
    message("getting cached data")  # tells you it's using cache
    return(inverse)
          }
  
  # Otherwise, compute the inverse
  data <- x$get()               # get the matrix
  inverse <- solve(data, ...)   # compute inverse
  
  # Store the computed inverse for future use
  x$setinverse(inverse)
  
  # Return the computed inverse
  inverse
         }
