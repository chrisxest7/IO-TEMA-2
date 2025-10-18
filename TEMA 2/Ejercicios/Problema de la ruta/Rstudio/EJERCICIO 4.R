library(igraph)

# Datos del grafo
edges4 <- data.frame(
  from = c("A","A","B","B","C"),
  to = c("B","C","C","D","D"),
  weight = c(2,6,3,5,1)
)

# Crear grafo no dirigido
g4 <- graph_from_data_frame(edges4, directed = FALSE)

# Graficar
plot(g4, edge.label = E(g4)$weight, main = "Ejercicio 4 - Ruta más corta")

# Calcular ruta más corta
sp4 <- shortest_paths(g4, from = "A", to = "D", weights = E(g4)$weight)

# Mostrar ruta más corta en consola
cat("Ruta más corta desde A hasta D:\n")
print(sp4$vpath)

# Calcular y mostrar distancia total mínima
dist4 <- distances(g4, v = "A", to = "D", weights = E(g4)$weight)
cat("\nDistancia total mínima:\n")
print(dist4)
