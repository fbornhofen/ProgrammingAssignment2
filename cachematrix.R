## Matrix with a caching 'solve' operation.

## Create a wrapper around a matrix that caches its inverse.

makeCacheMatrix <- function(origmatrix = matrix()) {
        inverse <- NULL
        set <- function(mat) {
                origmatrix <<- mat
                inverse <<- NULL
        }
        get <- function() origmatrix
        setinverse <- function(inv) inverse <<- inv
        getinverse <- function() inverse
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Return the inverse of the matrix wrapped by x. x caches the inverse matrix
## on the first call and only resets it when the original matrix changes.

cacheSolve <- function(x, ...) {
        if (is.null(x$getinverse())) {
                x$setinverse(solve(x$get()))
        }
        x$getinverse()
}
