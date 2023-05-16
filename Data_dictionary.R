# Create a sample data frame
data <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Name = c("John", "Jane", "Mike", "Sarah", "David"),
  Age = c(25, 32, 41, 29, 36),
  Salary = c(50000, 60000, 70000, 55000, 80000),
  stringsAsFactors = FALSE
)

# Create a function to generate the data dictionary
createDataDictionary <- function(data) {
  dict <- data.frame(
    Variable = names(data),
    Type = sapply(data, class),
    Description = NA,
    stringsAsFactors = FALSE
  )
  
  return(dict)
}

# Generate the data dictionary
dataDictionary <- createDataDictionary(data)

# Add descriptions to the data dictionary
dataDictionary$Description[1] <- "Unique identifier for each individual"
dataDictionary$Description[2] <- "Name of the person"
dataDictionary$Description[3] <- "Age of the person"
dataDictionary$Description[4] <- "Salary of the person"

# Print the data dictionary
print(dataDictionary)
