#Answer 1



if (!require(Matrix)) {
  install.packages("Matrix")
}
library(Matrix)

# Create a 1000x1000 matrix filled with random values
A <- matrix(runif(1000*1000), nrow = 1000, ncol = 1000)

# Using a loop
start_time <- Sys.time()  # Start time

column_norms_loop <- numeric(ncol(A))  # Initialize a vector to store the column norms

for (i in 1:ncol(A)) {
  column_norms_loop[i] <- norm(as.matrix(A[, i]))  # Calculate the norm of the i-th column
}

end_time <- Sys.time()  # End time
loop_time <- end_time - start_time  # Calculate the execution time

# Using sapply
start_time <- Sys.time()  # Start time

column_norms_sapply <- sapply(seq_len(ncol(A)), function(i) norm(as.matrix(A[, i])))

end_time <- Sys.time()  # End time
sapply_time <- end_time - start_time  # Calculate the execution time

# Compare the execution times
loop_time
sapply_time




#Answer 2



n <- 1000
m <- 1000

A <- matrix(runif(n*m), nrow = n, ncol = m)
B <- matrix(rnorm(n*m), nrow = n, ncol = m)
x <- runif(m)

ABtx <- drop(A %% (B %% x))
ABtx



#Answer 3


# Load the file containing the matrix
load("C:/Users/arpit/Downloads/ques3.Rdata")



det_A <- det(mat)
trace_A <- sum(diag(mat))

if (det_A != 0) {
  
  p <- 200  
  ans <- (det_A^(1/p)) * factorial(p) * (2.7^p) / (p * p * trace_A)
} else {

  ans <- NaN
}

# Print the result
ans


#Answer 4


n <- 50
m <- 1e3

A <- matrix(runif(n*m), nrow = n, ncol = m)

# Calculate column norms using apply() and norm()
col_norms <- apply(A, 2, norm, type = "2")

# Normalize the column norms
p_vec <- col_norms / sum(col_norms)

# Sample a column index with probabilities p_vec
chosen <- sample.int(m, size = 1, prob = p_vec)
chosen



#Answer 5


autoreg_fast <- function(n, rho) {
  errors <- rnorm(n)
  out <- numeric(n)
  out[1] <- errors[1]
  
  for (t in 2:n) {
    out[t] <- rho * out[t-1] + errors[t]
  }
  
  return(out)
}
n <- 100
rho <- 0.8
sequence <- autoreg_fast(n, rho)
sequence


# Answer 6



install.packages("Rcpp")
library(Rcpp)

cppFunction('NumericVector sumsC(NumericMatrix mat, int s) {
  int ncol = mat.ncol();
  NumericVector sums(s);
  
  for (int i = 0; i < s; i++) {
    for (int j = 0; j < ncol; j++) {
      sums[i] += mat(j, i);
    }
  }
  
  return sums;
}')

sel_sums <- function(mat) {
  p <- ncol(mat)
  s <- sample(1:p, size = 1)
  result <- sumsC(mat, s)
  return(result)
}

mat <- matrix(1:9, nrow = 3, ncol = 3)
output <- sel_sums(mat)
print(output)

