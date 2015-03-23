## Example usage:
##
## > source("cachematrix.R")
## > cm = makeCacheMatrix(m)
## > sm = sm=cacheSolve(cm)
## > sm = cacheSolve(cm)
## getting cached data

## special matrix capable of caching its own inverse

makeCacheMatrix <- function(x = matrix()) {

	inverse <- NULL

	set <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        get <- function() x
        setinverse <- function(i) inverse <<- i
        getinverse <- function() inverse

        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## function which takes advantage of makeCacheMatrix

cacheSolve <- function(x, ...) {

	i <- x$getinverse()
        
	if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }

        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)

        i
}
