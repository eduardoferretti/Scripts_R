# Install and load the igraph library
install.packages("igraph")
library(igraph)

# Create a sample network
edges <- data.frame(
  from = c("A", "A", "B", "C", "D", "E", "E"),
  to = c("B", "C", "D", "E", "A", "A", "B")
)

# Create a graph object from the edges data frame
graph <- graph_from_data_frame(edges, directed = FALSE)

# Plot the network and save it as an image file
png("network_graph.png", width = 800, height = 600, res = 100)
plot(graph, edge.arrow.size = 0.5, vertex.size = 30, vertex.label.cex = 1.2)
dev.off()


