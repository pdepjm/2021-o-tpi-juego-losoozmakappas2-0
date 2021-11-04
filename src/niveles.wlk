import wollok.game.*
import pokemon.*
import fondos.*
import piedras.*

class Nivel {
	const property fondo = null// new Fondo()
	const property pokemon = null// new Pokemon()
	const property piedra = null// new Piedra()
	var property siguiente = null// new Nivel()
	var property pokemonesRivales = #{}
}

const nivelBosque = new Nivel(fondo = fondoBosque, pokemon = chikorita, piedra = piedraHoja, siguiente = nivelElectrico, pokemonesRivales =#{chikorita,charizard,bulbasaur})
const nivelElectrico = new Nivel(fondo = fondoTrueno, pokemon = otroPikachu, piedra = piedraTrueno, siguiente = nivelFuego,pokemonesRivales =#{otroPikachu,charizard,flareon})
const nivelFuego = new Nivel(fondo = fondoVolcan, pokemon = charmander, piedra = piedraFuego, siguiente = nivelAgua, pokemonesRivales =#{charmander,moltres,bulbasaur})
const nivelAgua = new Nivel(fondo = fondoFort, pokemon = vaporeon, piedra = piedraAgua, siguiente = nivelNoche,pokemonesRivales =#{vaporeon,dragonnair,otroPikachu})
const nivelNoche = new Nivel(fondo = fondoJungla, pokemon = gengar, piedra = piedraNoche, siguiente = nivelBosque,pokemonesRivales =#{gengar,zapdos,charmander})

// nivelActual 
object actual {
	var property nivel = nivelBosque // nivel inicial
	
	method actualizar() {
		nivel = nivel.siguiente()
	} 
}

