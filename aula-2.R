
# CARREGANDO OS PACOTES
library(ggplot2)
library(geobr)
library(raster)
library(fields)
library(ggspatial)

# DEFININDO O DIRETÓRIO PADRÃO
setwd('D:/Projetos/Projeto_Cientista_de_Dados/Intensivao_Analise_de_Dados_com_R')

# LENDO O ARQUIVO
read.csv('Arquivos/dados/dados_temperatura.csv')

# ATRIBUINDO OS DADOS A UMA VARIAVEL
dados.temp <- read.csv('Arquivos/dados/dados_temperatura.csv')
relevo.mg <- raster('Arquivos/dados/relevo_minas_gerais.tif')
mg <- read_state(code_state = 'MG')

modelo <- lm(formula = temp~lon+lat+alt,data = dados.temp)

relevo.df = as.data.frame(relevo.mg,xy=TRUE)

relevo.df <- na.omit (relevo.df)

names(relevo.df) <- c ('lon','lat','alt')

relevo.df$temp <-23.49-0.25*relevo.df$lon+0.48*relevo.df$lat-0.0053*relevo.df$alt

relevo.df$temp2 <- predict(modelo,relevo.df)

ggplot(relevo.df)+
  geom_raster(aes(x=lon,y=lat,fill=temp))+
  geom_sf(data = mg,fill='NA')+
  scale_fill_gradientn(colours = tim.colors(10))+
  annotation_scale()+
  annotation_north_arrow(location = 'tl',
                         style = north_arrow_fancy_orienteering())+
  labs(x=NULL,y=NULL,fill='[C]', title= 'TEMPERATURA DO AR')+
  theme_minimal()

# TENTANDO PEGAR OS DADOS DE SP
sp <- read_state( code_state = 'SP', year=2020 )




# SALVAR O ARQUIVO DENTRO DA PASTA
#write.csv(sp, "sao-paulo2.csv", row.names = FALSE)
