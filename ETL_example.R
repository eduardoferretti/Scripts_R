library(dplyr)
library(RSQLite)
library(readxl)

# Step 1: Download the Excel file
download.file("http://example.com/example.xlsx", "example.xlsx")

# Step 2: Read the Excel file
data <- read_excel("example.xlsx")

# Step 3: Extract a single column using dplyr's pull() function
column <- data %>%
  pull(Column_Name)  # Replace "Column_Name" with the actual column name you want to extract

# Step 4: Upload the extracted column to a server using RSQLite
# Create a connection to an SQLite database
conn <- dbConnect(SQLite(), "example.db")

# Create a data frame with the extracted column
modified_data <- data.frame(Column_Name = column)

# Write the modified data to an SQLite table
dbWriteTable(conn, "modified_data", modified_data)

# Close the connection
dbDisconnect(conn)
