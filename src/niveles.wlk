import wollok.game.*
import pokemon.*
import fondos.*
import piedras.*

class Nivel {
	const property fondo = null// new Fondo()
	const property pokemon = null// new Pokemon()
	const property piedra = null// new Piedra()
	var property siguiente = null// new Nivel()
	//const property anterior = new Nivel()
	var property pokemonesRivales = #{}
}

const nivelBosque = new Nivel(fondo = fondoBosque, pokemon = chikorita, piedra = piedraHoja, siguiente = nivelElectrico, pokemonesRivales =#{chikorita,charizard,bulbasaur})
const nivelElectrico = new Nivel(fondo = fondoTrueno, pokemon = otroPikachu, piedra = piedraTrueno, siguiente = nivelFuego,pokemonesRivales =#{otroPikachu,charizard,flareon})

//agregado
const nivelFuego = new Nivel(fondo = fondoVolcan, pokemon = charmander, piedra = piedraFuego, siguiente = nivelAgua, pokemonesRivales =#{charmander,moltres,bulbasaur})
const nivelAgua = new Nivel(fondo = fondoFort, pokemon = vaporeon, piedra = piedraAgua, siguiente = nivelNoche,pokemonesRivales =#{vaporeon,dragonnair,otroPikachu})
const nivelNoche = new Nivel(fondo = fondoJungla, pokemon = gengar, piedra = piedraNoche, siguiente = nivelBosque,pokemonesRivales =#{gengar,zapdos,charmander})


object actual {
	var property nivel = nivelBosque // nivel inicial
	
	//agregado
	//const niveles = [nivelBosque,nivelElectrico,nivelFuego,nivelAgua,nivelNoche]
	//var property nivel = niveles.anyOne()
	
	method elegirNivelAlAzar(){
		//nivel=niveles.anyOne()
	}
	
	method actualizar() {
		nivel = nivel.siguiente()
	} 
}

