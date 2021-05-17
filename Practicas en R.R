#####--------CREAR VARIABLES en R STUDIO------------
#https://www.youtube.com/watch?v=Gwuckx_Y0b8&list=PLbDLkhJ5sFvCWFbP4tAFALHkNWNFo_FiL&index=4
MANGO<-10
MANZANA<- 5
AGUACATE<-4

resultado<- 3*MANGO+2*MANZANA-1*AGUACATE
resultado

class(resultado)

nombre<-c("rafa")
class(nombre)



####----Vectores como columnas de una tabla de datos-------

pelicula<- c("pelicula 1","pelicula 2","pelicula 3","pelicula 4")
puntacion<-c(7,9,7,2)
posterior_2005<-(c(FALSE,FALSE,TRUE,TRUE))


puntacion*2 

p2<- c(1,2,3,4,5,6,7,8)
length(p2)
length(puntacion)

puntacion-p2


pelicula[3]
pelicula[c(1,4)]
pbaja<-puntacion<7
pbaja 

pelicula[pbaja]


#-------Cómo CREAR MATRICES en RStudio ------------

warner <- c(20,21,16,17,17,22,17,18,19)
d <- c(11,13,11,8,12,11,12,8,10)
f <- c(18,15,15,15,16,17,15,13,11)
length(warner)
length(d)
length(f)

pelis <- matrix(c(warner,d,f),
                    nrow = 9,
                    ncol = 3)

colnames(pelis) <-c("warner","disney","fox") 

pelis

rownames(pelis) <- c("2001","2002","2003","2004","2005","2006","2007","2008","2009")

pelis

pelis*pelis

pelis*d

#-----Seleccion de datos------
pelis[3,2]

pelis["2003","disney"]

pelis[c(3,4),c(1,2)]

pelis[c(3,4),c("disney","fox")]

pelis[3,]

#-------FACTORES en RSTUDIO------
tallas <- c("m","g","s","s","M","m")

plot(factor(tallas))

tallas_recodificado <- factor(tallas,
                              levels = c("g","m","M","s"),
                              labels = c("G","M","M","S"))

plot(factor(tallas_recodificado))

tallas_recodificado <- factor(tallas,
                              ordered = TRUE,
                              levels = c("s","m","M","g"),
                              labels = c("S","M","M","G"))
tallas_recodificado


#------Como CREAR un DATAFRAME en R STUDIO-------

pelis_df <- data.frame(pelicula,
           puntacion,
           posterior_2005)
pelis_df

names(pelis_df) <- c("NOMBRE","PUNTUACION","POSTERIOR")


pelis_df$NOMBRE

#ordenar por una columna


pelis_df


order(pelis_df$PUNTUACION) #nos da en base a su posicion en el data frame


orden_a <- order(pelis_df$PUNTUACION, decreasing = TRUE)
orden_a


#mayor a menor
df_ord <- pelis_df[orden_a,]
df_ord



#--------Qué son las LISTAS en R-----


lista_curso <- list(pelicula,
                    pelis)


names(lista_curso) <- c("vector","matriz")

lista_curso[['vector']] #[1]
names(lista_curso)

lista_curso[['vector']][2]

lista_curso[["matriz"]][2,1]



#agregar elementos a la lista


lista_curso[["nevo"]] <- pelis_df
  
lista_curso
  
lista_curso[["nevo"]] <- NULL


lista_curso
#------Instalacion de paquetes-----


library(ggplot2)
help(ggplot2)


#------importar datos de excel----


install.packages("readxl")
library(readxl)
# para importar archivos usando una ventana
## ruta del archivo
ruta <- file.choose()
ruta

##hojas del archivo de excel
excel_sheets(ruta)

#importar cuando empieza directamente en la primer hoja
"1a" <- read_excel(ruta)

#cuando queremo la segunda hoja

"2a" <- read_excel(ruta,
                   sheet = "Hoja2")


#para importar cuando no estan en la primera fila ni en la primer hoja

"3a" <- read_excel(ruta,
                   sheet = "Hoja3",
                   range = "C7:F17")



#importar desde file
#file-importdataset



#-----graficos-------

year <- c("00","01","02","03","04")
disney <- c(11,13,11,8,12)

plot(x=year,
     y=disney,
     main="disney",
     xlab = "year",
     ylab = "disney",
     col="red",
     pch=16,
     panel.first = grid()) #lineas de fondo


barplot(disney)

pie(disney)


library(ggplot2)

a <- data.frame(year,disney)

ggplot(data=a,
       mapping = aes(x=year,
                     y=disney))+
                    geom_point()+
                    labs(title = "Peliculas")

#--------histogramas--------
hist(disney,3)

data("mtcars")

mtcars

hist(mtcars$hp)

hist(mtcars$hp,
     breaks = 10) #cortes

hist(mtcars$hp,
     breaks = seq(50,350,50)) #primero numero donde empieza
                              #Segundo donde termina
                              #Tercero el intervalo
hist(mtcars$hp,
     breaks = seq(50,350,50),
     col="red",
     border = "green",
     main="histograma de autos",
     xlab="caballos de potencia",
     ylab = "conteo") 


##para ggplot2


ggplot(data=mtcars,
       mapping = aes(x=hp,))+
  geom_histogram(bins = 4) #bins que tan dividido queremos el histograma


ggplot(data=mtcars,
       mapping = aes(x=hp,
                     fill=factor(vs)))+
  geom_histogram(bins = 9,
position= "identity",
alpha=0.8)+
  labs(title = "Histograma de dos variables",
       fill="tipo de motor",
       x="caballos de fuerza",
       y="conteos",
       subtitle = "ejercicio ggplot2",
       caption="fuente de datos R")


class(mtcars)

#------Cómo hacer GRAFICAS DE BARRAS en R----------


#genera una  tabla con las variables y su conteo
table(mtcars$cyl)

barplot(table(mtcars$cyl),
        col="green",
        border="red",
        main="Mi grafico",
        sub = "Subtitutlo del grafico",
        xlab = "cantidadad de cilindros del motor",
        ylab = "conteo",
        horiz = FALSE)


#con ggplot
library(ggplot2)

ggplot(data = mtcars,
       mapping = aes(x=factor(cyl)))+
  geom_bar()+
  coord_flip() #para rotar la grafica


#funcion con dos factores

p <- ggplot(data = mtcars,
            mapping = aes(factor(cyl),
                          fill=factor(gear)))

#clasificadas 1 acumuladas
p+geom_bar(position = "stack", stat = "count")  

#clasificadas 2 separadas
p+geom_bar(position = "dodge", stat = "count") 

#clasificadas 2 acumuladas porcentajes

p+geom_bar(position = "fill", stat = "count") 


#------------Cómo IMPORTAR archivos CSV a R--------

library(readr)

ruta <- file.choose()
ruta
#cuando esta delimitado por comas
read_csv(ruta)

#cuando no tiene titulos
aa <- read_csv(ruta,
         col_names = FALSE)


#si queremos agregarle un titulo
colnames(aa) <- c("pais","año","vida","pob")

aa

#cuando la separacion esta en puntos y comas
conpyc <- read_csv2(ruta)
conpyc


#tambien se puede importar tesde file


#-----Cómo SUPERPONER varías GRÁFICAS----








