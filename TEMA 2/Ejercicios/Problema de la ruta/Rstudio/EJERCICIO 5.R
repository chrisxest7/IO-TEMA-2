library(igraph)

# Datos del grafo
edges5 <- data.frame(
  from = c("A","A","A","B","B","C","C","D","E"),
  to = c("B","C","F","C","D","D","F","E","F"),
  weight = c(7,9,14,10,15,11,2,6,9)
)

# Crear grafo no dirigido
g5 <- graph_from_data_frame(edges5, directed = FALSE)

# Graficar grafo
plot(g5, edge.label = E(g5)$weight, main = "Ejercicio 5 - Ruta más corta")

# Calcular ruta más corta
sp5 <- shortest_paths(g5, from = "A", to = "F", weights = E(g5)$weight)

# Mostrar resultados en consola
cat("Ruta más corta desde A hasta F:\n")
print(sp5$vpath)

# Calcular y mostrar distancia total mínima
dist5 <- distances(g5, v = "A", to = "F", weights = E(g5)$weight)
cat("\nDistancia total mínima:\n")
print(dist5)
