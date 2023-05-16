# Install and load the required packages
install.packages("DiagrammeR")
library(DiagrammeR)

# Create a new empty graph
graph <- create_graph()

# Add nodes to the graph
graph %>% add_node("A") %>% add_node("B") %>% add_node("C") %>% add_node("D") %>% add_node("E")

# Add edges to the graph
graph %>% add_edge("A", "B") %>% add_edge("A", "C") %>% add_edge("B", "D") %>% add_edge("C", "D") %>% add_edge("D", "E")

# Render and display the graph
render_graph(graph)

