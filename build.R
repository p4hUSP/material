library(magrittr)

# 1. Implementar o Conteúdo -----------------------------------------------

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

create_tutoriais()

#Construir o site
blogdown::install_hugo(version = "0.22", force = T)
blogdown::build_site()

