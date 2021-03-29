# Instalando os pacotes

#install.packages("geobr")

# GGPLOT2
#install.packages("ggplot2")

# SF
#install.packages("sf")

# GEOBR
#install.packages("geobr")

# RGDAL
#install.packages("rgdal")

# RASTER
#install.packages("raster")

# FIELDS
#install.packages("fields")

# GGPSPATIAL
#install.packages("ggpspatial")


# instalando mais de um pacote
# install.packages(c('geobr','rgdal'))


# VISUALIZANDO SE INSTALOU O GGPLOT2

# carregando o pacote
library(ggplot2)

# Construindo um gráfico de dispersão
# AES => define qual a coluna do eixo X e qual a coluna do eixo Y
ggplot(cars, aes(x=speed,y=dist))+geom_point(col='red')

