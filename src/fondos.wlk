import wollok.game.*

class Fondo {
	const property image = ""
	const property limiteAbajo = 0
	const property limiteArriba = 0
	const property limiteIzq = 0
	const property limiteDerecha = 0
}

// piedra hoja
const fondoBosque = new Fondo(image = "fondos/grass.png", limiteAbajo = 0, limiteArriba = 6, limiteIzq = 0, limiteDerecha = 14)
// piedra lunar
const fondoLuna = new Fondo(image = "fondos/moon.png", limiteAbajo = 0, limiteArriba = 8, limiteIzq = 0, limiteDerecha = 14)
// piedra fuego
const fondoVolcan = new Fondo(image = "fondos/volcano.png", limiteAbajo = 0, limiteArriba = 6, limiteIzq = 0, limiteDerecha = 14)
// piedra agua
const fondoFort = new Fondo(image = "fondos/fort.png", limiteAbajo = 0, limiteArriba = 8, limiteIzq = 0, limiteDerecha = 14)
// piedra dia
const fondoDia = new Fondo(image = "fondos/keep_outer.png", limiteAbajo = 0, limiteArriba = 8, limiteIzq = 0, limiteDerecha = 14)
// piedra hielo
const fondoHielo = new Fondo(image = "fondos/moon.png", limiteAbajo = 0, limiteArriba = 8, limiteIzq = 0, limiteDerecha = 14)
// piedra noche
const fondoJungla = new Fondo(image = "fondos/jungle.png", limiteAbajo = 0, limiteArriba = 8, limiteIzq = 0, limiteDerecha = 14)
// piedra solar
const fondoSolar = new Fondo(image = "fondos/sand.png", limiteAbajo = 0, limiteArriba = 9, limiteIzq = 0, limiteDerecha = 14)
// piedra trueno
const fondoTrueno = new Fondo(image = "fondos/keep.png", limiteAbajo = 0, limiteArriba = 6, limiteIzq = 0, limiteDerecha = 14)