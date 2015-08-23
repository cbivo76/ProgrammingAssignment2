# returns a list of functions
# it caches an inverse of a matrix given as input parameter
#	makeCacheMatrix
# 	a <- makeCacheMatrix( matrix(c(1,2,12,13), nrow = 2, ncol = 2) );
# 	summary(a)
#	a$getMatrix();
#	cacheSolve(a)
#	cacheSolve(a)
 
makeCacheMatrix <- function(x = matrix()) {
       
	# Cached value, NULL if nothing
	m <- NULL
				        
	setMatrix <- function(newValue) {
		x <<- newValue
	        m <<- NULL
	}

	getMatrix <- function() {
	        x
	}

       	cacheInverse <- function(solve) {
	        m <<- solve
	}
										        getInverse <- function() {
	        m
	}
													        
	list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

cacheSolve <- function(y, ...) {
        inverse <- y$getInverse()
										        if(!is.null(inverse)) {
		message("getting cached data")
	        return(inverse)
	}

	data <- y$getMatrix()
	inverse <- solve(data)
        y$cacheInverse(inverse)
	inverse
}	
