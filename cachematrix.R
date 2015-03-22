## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## this function makeCacheMatrix creates a matrix and calculates its inverse and assignes to a variable
makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y){
x <<- y
inv <<- NULL
}

get <- function() x

setinverse <- function(ext_inv){
inv <<- ext_inv
}
getinverse <- function() {
inv <<- solve(x)
inv
 }
 
list(set = set, get =get, setinverse=setinverse, getinverse=getinverse)
 }



## Write a short comment describing this function
##this function takes the matrix created using makeCacheMatrix function and first checks if inverse of the matrix is calculated and is in cache
## if inverse is not in cache, it creates the inverse of the matrix locally and assigns it to the variable local_matrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)){
                print("getting cached inverse")
                return inv
        }
        
        local_matrix <- x$get()
        inv <- solve(local_matrix)
        print("calculating inverse fresh locally")
        return inv
}
