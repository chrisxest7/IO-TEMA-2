library(igraph)

# Datos del grafo
edges3 <- data.frame(
  from = c("A","A","B","B","C","C","D"),
  to = c("B","C","C","D","D","E","E"),
  weight = c(5,3,2,6,7,4,2)
)

# Crear grafo no dirigido
g3 <- graph_from_data_frame(edges3, directed = FALSE)

# Graficar
plot(g3, edge.label = E(g3)$weight, main = "Ejercicio 3 - Ruta más corta")

# Calcular ruta más corta
sp3 <- shortest_paths(g3, from = "A", to = "E", weights = E(g3)$weight)

# Mostrar ruta más corta en consola
cat("Ruta más corta desde A hasta E:\n")
print(sp3$vpath)

# Calcular y mostrar distancia total mínima
dist3 <- distances(g3, v = "A", to = "E", weights = E(g3)$weight)
cat("\nDistancia total mínima:\n")
print(dist3)
