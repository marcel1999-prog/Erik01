
# importacion de base de datos --------------------------------------------



# importar csv -----------------------------------------------------------

csvdt <- read.csv(file = "data/LA MOLINA 2014 POTATO WUE (FB) - fb.csv")

tsvdt <- read.table("data/LA MOLINA 2014 POTATO WUE (FB) - fb.tsv", header = TRUE)



# importar xlsx -----------------------------------------------------------

library(openxlsx)

dtxlsx <- openxlsx::read.xlsx(xlsxFile = "data/LA MOLINA 2014 POTATO WUE (FB).xlsx"
                              ,sheet = "fb")



# importar por rstudio ----------------------------------------------------

library(readxl)
LA_MOLINA_2014_POTATO_WUE_FB_ <- read_excel("data/LA MOLINA 2014 POTATO WUE (FB).xlsx", 
                                            sheet = "fb")
View(LA_MOLINA_2014_POTATO_WUE_FB_)


# importar de google ssheets ----------------------------------------------

library(inti)#autentificar con google

library(googlesheets4)

url <- "https://docs.google.com/spreadsheets/d/15r7ZwcZZHbEgltlF6gSFvCTFA-CFzVBWwg3mFlRyKPs/edit?gid=172957346#gid=172957346"

gs <- as_sheets_id(url)
fb <- googlesheets4::range_read(ss=gs, sheet= "fb")

