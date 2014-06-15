## The two following functions cache the inverse of a matrix which is assumed to 
##      be invertible. 

## The first function creates a special vector which is a list of: set the value of a matrix, 
##              get the value of the matrix, set the value of the inverse or the matreix,
##              get the value of the inverse of the matrix

makeCacheMatrix<-function(x=numeric()){
    s<-NULL
    set<-function(y){
        x<<-y
        s<<-NULL
    }
    get<-function()x
    setinverse<-function(solve) s<<-solve
    getinverse<- function() s
    list(set=set,get=get,
         setinverse=setinverse,
         getinverse=getinverse)
}


## This function retrurns the inverse of the matrix cached 

cacheSolve<-function(x,...){
    s<-x$getinverse()
    if(!is.null(s)){
        message("getting cached data")
        return(s)
    }
    mat<-x$get()
    s<-solve(mat)
    x$setinverse(s)
    s
        ## Return a matrix that is the inverse of 'x'
}
