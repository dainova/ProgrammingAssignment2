## About Matrix inv. http://www.purplemath.com/modules/mtrxinvr.htm
## Caching result will increase performance.

##  makeCacheMatrix creates a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of inverse of the matrix
## 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix())    {
    inv  <- NULL
    set  <- function(y) {
         x <<- y
         inv <<- NULL
                        }

    get <- function() x
    setinverse  <- function(inverse) inv  <<- inverse
    getinverse  <- function() inv
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## The following function returns the inverse of the matrix. 
## Check first if inv already computed and stored in cache
## If not calculate value and set it in cache

cacheSolve <- function(x, ...) {
    inv  <- x$getinverse()
    if (!is.null(inv)) {
        message("getting cached data.")
        return(inv)
                               }
    data <- x$get()
    inv  <- solve(data)
    x$setinverse(inv)
    inv
}




## Test

## > x = rbind(c(1, -1/4), c(-1/4, 1))
## > m = makeCacheMatrix(x)
## > m$get()
##       [,1]  [,2]
## [1,]  1.00 -0.25
## [2,] -0.25  1.00


## First noo cache  
## > cacheSolve(m)
##           [,1]      [,2]
## [1,] 1.0666667 0.2666667
## [2,] 0.2666667 1.0666667

## Get cache
## > cacheSolve(m)
## getting cached data.
##           [,1]      [,2]
## [1,] 1.0666667 0.2666667
## [2,] 0.2666667 1.0666667
## > 