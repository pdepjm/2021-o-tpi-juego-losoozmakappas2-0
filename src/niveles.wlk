import wollok.game.*
import pokemon.*
import fondos.*
import piedras.*

class Nivel {
	const property fondo = new Fondo()
	const property pokemon = new Pokemon()
	const property piedra = new Piedra()
	const property siguiente = new Nivel()
	//const property anterior = new Nivel()
}

const nivelBosque = new Nivel(fondo = fondoBosque, piedra = piedraHoja, siguiente = nivelElectrico)
const nivelElectrico = new Nivel(fondo = fondoTrueno, piedra = piedraTrueno, siguiente = nivelBosque)

object actual {
	var property nivel = nivelElectrico // nivel inicial
	
	method actualizar() {
		nivel = nivel.siguiente()
	} 
}