library(magrittr)
library(stringr)

tutoriais <- 1:13

create_tutoriais <- function(tutorial){
  
  dir.create(sprintf("./content/tutorial%s", tutorial))
  
  tutorial <- as.character(tutorial)
  
  download_url <- str_replace("https://raw.githubusercontent.com/ngiachetta/ProgCienciasSociais/master/tutorials/tutorialNUM.Rmd",
                              "NUM",
                              tutorial)
  
  dest_file <- str_replace("/content/tutorialNUM/", "NUM", tutorial)
  
  url(download_url)
}

purrr::walk(tutoriais, create_tutoriais)

dir.create()