 
################################## LINGUAGEM NATURAL #########################################

install.packages("udpipe", dependencies = T) ## Este é um dos principais pacotes para linguagem natural
library(udpipe)


################################ CRIANDO UM ARQUIVO #########################################

FILE = "Este é o meu jeito ninja. TO CERTO" ## para fins didaticos vamos analisar somente essa frase

ID = 1L   ## como temos só "1 arquivo" vamos te somente um ID para ele 

arquivo = data.frame(FILE, ID) ## vamos converter nosso (file) e ID para o modelo banco de dados 

arquivo$FILE = as.character(arquivo$FILE)
## Aqui nos estamos pegando a coluna (file) aonde esta a nossa frase (em formado String) e convertendo para caracter

## Essa conversão vai fascilitar o tratamento de dados 


########################################## INSTALANDO O MODELO ####################################

modelo = udpipe_download_model(language = "portuguese-gsd")

## Aqui estamos baixando o modelo (portugues do Brasil) e colocando dentro da váriavel (modelo)


############################ CARREGANDO O MODELO ##############################

modelo = udpipe_load_model(file.choose())## estamos carregando o modelo que foi baixado na nossa pasta atual



############################## FAZENDO AS ANOTAÇÕES ##############################

anotar = udpipe_annotate(modelo, x = arquivo$FILE, doc_id = arquivo$ID)

## Para fazer as anotações usamos a função (udpipe_annotate) essa função vai receber 3 parametros, sendo eles

## 1 = O modelo do idioma, que no nosso caso está na váriavel (modelo)

## 2 = O texto que queremos, que no nosso caso esta na váriavel (arquivo) na coluna (FILE)

## 3 = O ID do texto, que no nosso caso está na váriavel (arquivo) na coluna (ID)


anotar ## Se olharmos a anotação foi gerada, mas ela esta desestruturada então devemos fazer uma estruturação

anotar = as.data.frame(anotar)

############################################# VENDO O RESULTADO DA NOSSA ANOTAÇÃO #########################

fix(anotar)




