# Instalar librería si no está instalada
# install.packages("igraph")

library(igraph)

# Crear grafo
edges <- data.frame(
  from = c("A", "A", "B", "B", "C", "C", "D"),
  to = c("B", "C", "C", "D", "D", "E", "E"),
  weight = c(4, 2, 1, 5, 8, 10, 2)
)

g <- graph_from_data_frame(edges, directed = FALSE)

# Graficar
plot(g, edge.label = E(g)$weight, main = "Ejercicio 1 - Grafo Ruta más corta")

# Calcular ruta más corta
sp <- shortest_paths(g, from = "A", to = "E", weights = E(g)$weight)

# Mostrar ruta más corta en consola
cat("Ruta más corta desde A hasta E:\n")
print(sp$vpath)

# Calcular y mostrar distancia total
distance <- distances(g, v = "A", to = "E", weights = E(g)$weight)
cat("\nDistancia total mínima:\n")
print(distance)

