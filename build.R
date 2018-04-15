library(magrittr)

# 1. Implementar o Conteúdo -----------------------------------------------

#Transfere os materias do repositório "materials" para o site
create_content <- function(){
  
  download_url <- "https://github.com/R4CS/material/archive/content.zip"
  
  file <- tempfile()
  
  res <- httr::GET(
    download_url,
    httr::write_disk(file)
  )

  unzip(file, exdir = "./temp")
  
  del_files <- list.files("./temp/material-content/")
  
  system('mv -v ./temp/material-content/* ./content/')
  system('rm -rf ./temp')
  file.remove(file)
}

create_content()

# #Instala o Hugo (0.22) e constrói o site
blogdown::install_hugo(version = "0.22", force = T)
blogdown::hugo_build()
