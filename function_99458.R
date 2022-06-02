
install.packages(igraph)
library('igraph')
function_99458 <- function(w){network = rbind(c(1, 2, 2477),
                                              c(1, 3, 1169),
                                              c(1, 4, 1916),
                                              c(2, 5,  945),
                                              c(2, 6, 1243),
                                              c(3, 2,  951),
                                              c(3, 4, 1080),
                                              c(3, 6, 2429),
                                              c(4, 6,  545),
                                              c(4, 7,  537),
                                              c(5, 8,  893),
                                              c(6, 5,  623),
                                              c(6, 7, 1473),
                                              c(6, 8, 2238),
                                              c(7, 8,  936),
                                              c(1, 6,    w)
                                              )

  network = data.frame(network)
  names(network) = c("from", "to", "distance")

  network.graph <- graph.data.frame(network)
  plot(network.graph, edge.label=network$distance)

  distances_from_1 <- shortest.paths(network.graph, 
                                           v='1', 
                                           weights=E(network.graph)$distance)

  total_optimal_distance <- distances_from_1[8]

  return(total_optimal_distance)
  }
