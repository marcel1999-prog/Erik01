area_circ <- function(radio) {
  if(!is.numeric(radio)) {
    paste(radio, "no es numerico")
  } else {
    radio * radio * pi
  }
}

area_circ(7)



calcular_IMC <- function(peso, altura_cm) {
  altura_m <- altura_cm / 100
  IMC <- peso / (altura_m^2)
  
  return(IMC)
}
imc_resultado <- calcular_IMC(70, 170)
imc_resultado


calcular_IMC_con_categoria <- function(peso, altura_cm) {
 
  altura_m <- altura_cm / 100
  
 
  IMC <- peso / (altura_m^2)
  if (IMC < 18.5) {
    categoria <- "Bajo peso"
  } else if (IMC >= 18.5 && IMC < 24.9) {
    categoria <- "Peso normal"
  } else if (IMC >= 25 && IMC < 29.9) {
    categoria <- "Sobrepeso"
  } else {
    categoria <- "Obesidad"
  }
  
  
  return(paste("IMC:", round(IMC, 2), "-", categoria))
}
resultado <- calcular_IMC_con_categoria(70, 170)
resultado






imc <- function(altura, peso) {
  resultado <- peso/(altura^2)
  
  if(rs <18.5) {print("bajo peso")}
  
  if(rs <=18.5 & rs >= 24.9 ) {print("peso normal")}
  
  if(rs >25 & rs <= 29.9) {print("sobre peso")}
  
  if(rs >=30) {print("obesidad")}
}

imc(altura = 1.70,73)



