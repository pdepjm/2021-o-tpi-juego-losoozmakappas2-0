import wollok.game.*
import pokemon.*
import fondos.*
import piedras.*

class Nivel {
	const property fondo = null// new Fondo()
	const property pokemon = null// new Pokemon()
	const property piedra = null// new Piedra()
	const property siguiente = null// new Nivel()
	//const property anterior = new Nivel()
}

const nivelBosque = new Nivel(fondo = fondoBosque, pokemon = prueba, piedra = piedraHoja, siguiente = nivelElectrico)
const nivelElectrico = new Nivel(fondo = fondoTrueno, pokemon = prueba, piedra = piedraTrueno, siguiente = nivelBosque)

object actual {
	var property nivel = nivelBosque // nivel inicial
	
	method actualizar() {
		nivel = nivel.siguiente()
	} 
}