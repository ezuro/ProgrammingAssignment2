## Put comments here that give an overall description of what your
## functions do

## Similar to the function that return the mean as described in the example
## my function returns a list of functions to get and set a matrix and its inverse.   

makeCacheMatrix <- function(x = matrix()) {
  matrixInversion<-NULL
  
  setMatrix<-function(newMatrix){
    x<<-newMatrix
    matrixInversion<<-NULL
  }
  
  getMatrix<-function()x
  setInverse<-function(inverseM)matrixInversion<<-inverseM
  getInverse<-function()matrixInversion
  
  list(setMatrix=setMatrix,setInverse=setInverse,
       getMatrix=getMatrix,getInverse=getInverse)
  
  
}


## As the function described in the example

cacheSolve <- function(z, ...) {
  inverseMatrix<-z$getInverse()
  
  if (!is.null(inverseMatrix)) {
    message("Getting cached inversed matrix")
    return(inverseMatrix)
  }
  originalMatrix<-(z$getMatrix())
  inverseMatrix<-solve(originalMatrix)
  z$setInverse(inverseMatrix)
  inverseMatrix
  
}

## Test Data Example
z<-NULL
z<-makeCacheMatrix()
z$getMatrix() #The matrix is not yet defined
z$setMatrix(matrix(c(1,0,-2,3,1,-2,-5,-1,9),nrow =3,ncol = 3,byrow = TRUE )) #We define a new matrix
z$getInverse()#The inverse should not be defined yet
cacheSolve(z)
z$getInverse()# The inverse should be defined now
cacheSolve(z)#The inverse should be retrieved from the cache and the alert message should now appear
