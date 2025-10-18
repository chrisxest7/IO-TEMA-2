library(igraph)

# Datos del grafo
edges2 <- data.frame(
  from = c("A", "A", "B", "B", "C", "D", "E"),
  to = c("B", "C", "D", "E", "D", "F", "F"),
  weight = c(3, 2, 4, 6, 1, 5, 2)
)

# Crear grafo no dirigido
g2 <- graph_from_data_frame(edges2, directed = FALSE)

# Graficar
plot(g2, edge.label = E(g2)$weight, main = "Ejercicio 2 - Ruta más corta")

# Calcular ruta más corta
sp2 <- shortest_paths(g2, from = "A", to = "F", weights = E(g2)$weight)

# Mostrar resultados
cat("Ruta más corta desde A hasta F:\n")
print(sp2$vpath)

# Distancia total mínima
dist2 <- distances(g2, v = "A", to = "F", weights = E(g2)$weight)
cat("\nDistancia total mínima:\n")
print(dist2)

