## reproducible code:
network = rbind(c(1,2,2477),
                c(1,3,1169),
                c(1,4,1916),
                c(2,5, 945),
                c(2,6,1243),
                c(3,2, 951),
                c(3,4,1080),
                c(3,6,2429),
                c(4,6, 545),
                c(4,7, 537),
                c(5,8, 893),
                c(6,5, 623),
                c(6,7,1473),
                c(6,8,2238),
                c(7,8, 936)
                )

network = as.data.frame(network)
names(network) = c("from", "to", "cost")

#install.packages('igraph')
require(igraph)

network.graph <- graph.data.frame(network, directed=FALSE)

print(network.graph, e=TRUE, v=TRUE) #este sacarlo de la function

#tkid is the id of the tkplot that will open
tkid <- tkplot(network.graph) #este se puede sacar de function

# grab the coordinates from tkplot
l <- tkplot.getcoords(tkid)

tk_close(tkid, window.close = T) #esto tambien sacar de function

#plot(net, layout=1)
plot(network.graph, layout=l, edge.label=network$cost, edge.curved=0.1)

# compute the min distances from '234' to all other vertices
distances.from.1 <- shortest.paths(network.graph, v='1', weights=E(network.graph)$cost)
distances.from.1 #sacar de function

# print min distance from '1' to '8'
route.from.1.to.8 = get.shortest.paths(network.graph, from='1', to='8', weights=E(network.graph)$cost)
route.from.1.to.8$vpath[[1]] #sacar de function

# distancia minima
distances.from.1[8]







