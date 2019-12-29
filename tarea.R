N = 1000
MyData <- read.csv(file="dataBase/20180214_Resumen_Rendimiento 2017_20180131.csv", header=TRUE, sep=";")

#total_alumnos = APR_HOM_TO + REP_HOM_TO + APR_MUJ_TO +REP_MUJ_TO
hombres_aprobados <- as.numeric((MyData$APR_HOM_TO)[1:N])
hombres_reprobados <- as.numeric((MyData$REP_HOM_TO)[1:N])
mujeres_aprobadas <- as.numeric((MyData$APR_MUJ_TO)[1:N])
mujeres_reprobadas <- as.numeric((MyData$REP_MUJ_TO)[1:N])

total_alumnos <- hombres_aprobados + hombres_reprobados + mujeres_aprobadas + mujeres_reprobadas
#total_aprobados = APR_HOM_TO + APR_MUJ_TO
total_aprobados <-  hombres_aprobados + mujeres_aprobadas

porcentaje_aprobados <- (total_aprobados * 100)/total_alumnos

#prom asistencia numerico
promedio_asistencia <- as.numeric(gsub(",", ".", gsub("\\.", "", (MyData$PROM_ASIS)[1:N])))

#puntos de dispersion
plot(promedio_asistencia, porcentaje_aprobados)

#regresion lineal
modelo <- lm(porcentaje_aprobados~promedio_asistencia)
abline(modelo, col="red")

#configurar: setwd("C:/Users/Carlos/Desktop/Estadistica/regresion/proyecto")
 
