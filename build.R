library(magrittr)
library(stringr)
library(readr)

#função para baixar o conteúdo do repositório de materiais
create_tutoriais <- function(){
  
  download_url <- "https://github.com/R4CS/material/archive/master.zip"
  
  file <- tempfile()
  
  res <- httr::GET(
    download_url,
    httr::write_disk(file)
  )
    
  
  unzip(file, exdir = "./temp")
  
  system('mv ./temp/material-master/content/tutorial* ./content/')
  system('rm -Rf ./temp')
  file.remove(file)
}

#Construir o site
blogdown::build_site()