
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

library(agricolae)



# DCA ---------------------------------------------------------------------



# Definir los niveles de fertilización nitrogenada y el número de repeticiones
fertilizacion <- c(0, 50, 100)  # Dosis de fertilización (kg/ha)
repeticiones <- 5  # Número de repeticiones

# Crear el diseño completamente al azar (DCA)
# Para 15 unidades experimentales (3 tratamientos x 5 repeticiones)
tratamientos <- rep(fertilizacion, each = repeticiones)
unidades_experimentales <- 1:length(tratamientos)  # Identificar las unidades experimentales

# Crear un marco de datos con los tratamientos y las unidades experimentales
dca <- data.frame(Unidad = unidades_experimentales, Fertilizacion = tratamientos)

# Mostrar el diseño experimental
print(dca)
# Randomizar el orden de los tratamientos
set.seed(123)  # Fijar la semilla para la reproducibilidad
dca$Fertilizacion <- sample(dca$Fertilizacion)

# Mostrar el diseño experimental randomizado
print(dca)


# DBCA --------------------------------------------------------------------
# fertilizante: 0, 50, 100
# cultivar: canchan y peruanita
trt<-c(3, 2) # factorial 3x2


outdesign <-design.ab(trt, r=4, design = "rcbd")
book<-outdesign$book

book %>% str()

ds <- book %>% 
  mutate(ferti = case_when(
    A %in% 1 ~ "0"
    ,  A %in% 2 ~ "50"
    ,  A %in% 3 ~ "100"
  )) %>% 
  mutate(cultivar = case_when(
    B %in% 1 ~ "canchan"
    ,  B %in% 2 ~ "peruanita"
  )) 


ds %>% 
  openxlsx::write.xlsx(file = "dbca.xlsx")

































