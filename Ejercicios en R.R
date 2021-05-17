#--------------------Ejercicios en R---------------------------

#Comando para ver el directorio
getwd()
#Todos los archivo en la carpeta
dir()
#Variables creadas
ls() 


#creamos la variable peso
peso<-56
peso
#Creamos la variable altura
altura<-1.61
altura

#Creamos la variabole IMC

IMC<-peso/(altura**2)
IMC

#Creamos vectores de variables
genero<-c("h","m","m","h","m","h","m","h","m","m")
genero

edad<-c(23,45,34,39,60,52,44,59,32,40)
edad

glusemia<-c("123","230","180","164","210","220","193","202","152","185")
torales<- c("no", "si", "no", "no", "si", "no", "si", "si", "no", "no")
#Creamos una base de datos
mispacientes<- data.frame(genero,edad)
mispacientes

#ordenamos de menor a mayor por edad
mispacientes[order(mispacientes$edad),]
#ordenamos de MAYOR a menor por edad
mispacientes[order(mispacientes$edad,decreasing = TRUE),]


max(edad) # nos muestra el valor máximo de edad
min(edad) # nos muestra el valor mínimo de edad
mean(edad) # nos muestra la media
sd(edad) # nos muestra la media
mean(edad) # nos muestra la media
round(sd(edad),2)# redondea la desviacion(y cualquier variable).
quantile(edad)#me da los cuantiles



barplot(mispacientes$edad)

mispacientes$colesterol <- c(230,241,190,150,201,278,262,190,220,184 )
mispacientes$colesterolrango[mispacientes$colesterol <= 200] <- '<=200'
mispacientes$colesterolrango[mispacientes$colesterol > 200 & mispacientes$colesterol <= 260] <- '201-260'
mispacientes$colesterolrango[mispacientes$colesterol >260] <- '>260'


a<-read.table("pacientes.txt",                 # Archivo de datos TXT indicado como string o ruta completa al archivo
           header = TRUE,       # Si se muestra el encabezado (TRUE) o no (FALSE)
           sep = "",             # Separador de las columnas del archivo
           dec = ".")   
#ver los encabezados
names(mispacientes)
names(mispacientes)[3]
#primeros datos
head(mispacientes)
#ultimos datos
tail(mispacientes)

mispacientes$genero
#buscar por ubicacion
mispacientes[3,2]
#fila 3 columnas 2 a la 3
mispacientes[3,2:3]
#filas y columnas
mispacientes[c(3,5), 2:3]
#nos da todas las filas
mispacientes[,c(2,3)]


mispacientes[2:4,]

mispacientes[c(2,4), c(2)]


#crea una matriz de datos con dos columnas
fumadores <- matrix(c(23, 134, 34, 167, 41, 130), ncol=2)
#renombrar columnas
colnames(fumadores) <- c("Fumadores", "No fumadores")
#renombrar filas
rownames(fumadores) <- c("Obesos", "sobrepeso", "normal")

fumadores

a<-as.data.frame(fumadores)

a$Otra<-c("1","2","3")
