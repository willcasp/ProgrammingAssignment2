# Test
# tests grabbed from Zhihao Ding at www.zhihaoding.com
# generate a random square, non-singular matrix
test <- matrix(runif(9,1,100),3,3)
# generate the makeCacheMatrix object with this matrix
testCached <- makeCacheMatrix(test)
# from now on calculate or retrieve calculated inversion using the cacheSolve function

testInv <- cacheSolve(testCached)
testInv <- cacheSolve(testCached)
testInv <- cacheSolve(testCached)
testInv <- cacheSolve(testCached)
testInv <- cacheSolve(testCached)