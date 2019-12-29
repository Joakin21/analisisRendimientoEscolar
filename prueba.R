
#MyData <- read.csv(file="dataBase/20180214_Resumen_Rendimiento 2017_20180131.csv", header=TRUE, sep=";")
#extraer filas aleatorias de MyData

library(LaF)

columnasAleatorias <- function(file, n) {
  lf <- laf_open(detect_dm_csv(file, sep = ";", header = TRUE, factor_fraction = -1))
  return(read_lines(lf, sample(1:nrow(lf), n)))
}

MyData <- columnasAleatorias("dataBase/20180214_Resumen_Rendimiento 2017_20180131.csv", 3)