## Assignment 2, Coursera, R Programming
## these functions cache the inverse of a matrix

## the first function creates a special "matrix" object that can cache its inverse

makeCacheMatrix<-function(x=matrix()) { 
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function()x
  setinverse<-function(solve) m<<-solve
  getinverse<-function() m
  list(set=set, get=get,setinverse=setinverse, getinverse=getinverse)
}


## This second function computes the inverse of the matrix returned by above function, and if the matrix has already been calculated
##it retrieves the inverse from the cache.

cacheSolve<- function(x, ...) {
  m<-x$getinverse() ##Returns a matrix that is the inverse of x
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data, ...)
  x$setinverse(m)
  m
}
