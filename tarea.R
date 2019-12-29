N = 1000 #1000 datos a extraer
library(LaF) #libreria para extraer las filas aleatorias

#extrae n filas aleatorias del archivo
columnasAleatorias <- function(file, n) {
  lf <- laf_open(detect_dm_csv(file, sep = ";", header = TRUE, factor_fraction = -1))
  return(read_lines(lf, sample(1:nrow(lf), n)))
}
MyData <- columnasAleatorias("dataBase/20180214_Resumen_Rendimiento 2017_20180131.csv", N)

#se obtiene el total de alumnos
hombres_aprobados <- as.numeric(MyData$APR_HOM_TO)
hombres_reprobados <- as.numeric(MyData$REP_HOM_TO)
mujeres_aprobadas <- as.numeric(MyData$APR_MUJ_TO)
mujeres_reprobadas <- as.numeric(MyData$REP_MUJ_TO)
total_alumnos <- hombres_aprobados + hombres_reprobados + mujeres_aprobadas + mujeres_reprobadas
#se obtiene el total de aprobados
total_aprobados <-  hombres_aprobados + mujeres_aprobadas
#se obtiene el porcentaje de alumnos aprobados de todos los cursos
porcentaje_aprobados <- (total_aprobados * 100)/total_alumnos
#se obtiene el promedio de asistencia de todos los cursos
promedio_asistencia <- as.numeric(gsub(",", ".", gsub("\\.", "", MyData$PROM_ASIS)))
#graficar puntos de dispersion
plot(promedio_asistencia, porcentaje_aprobados)
#graficar regresion lineal
modelo <- lm(porcentaje_aprobados~promedio_asistencia)
abline(modelo, col="red")

#configurar path de dataBAse: setwd("C:/Users/Carlos/Desktop/Estadistica/regresion/proyecto")
 
