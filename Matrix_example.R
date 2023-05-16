# Create a matrix
matrix_data <- matrix(
  c(1, 2, 3, 4, 5, 6),   # Data elements
  nrow = 2,              # Number of rows
  ncol = 3,              # Number of columns
  byrow = TRUE           # Fill the matrix by row
)

# Save the matrix as a text file
write.table(matrix_data, file = "matrix_data.txt", sep = "\t", quote = FALSE)

