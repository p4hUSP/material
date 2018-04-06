library(magrittr)

# 1. Implementar o Conteúdo -----------------------------------------------

#Transfere os materias do repositório "materials" para o site
create_content <- function(){
  
  download_url <- "https://github.com/R4CS/material/archive/master.zip"
  
  file <- tempfile()
  
  res <- httr::GET(
    download_url,
    httr::write_disk(file)
  )

  unzip(file, exdir = "./temp")
  
  del_files <- list.files("./temp/material-master/content/")
  
  for(i in del_files){
    system(sprintf("rm -Rf .content/%s", i))
  }
  
  system('mv -v ./temp/material-master/content/* ./content/')
  system('rm -Rf ./temp')
  file.remove(file)
}

create_content()

#Instala o Hugo (0.22) e constrói o site
blogdown::install_hugo(version = "0.22", force = T)
blogdown::build_site()

