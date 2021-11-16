import wollok.game.*
import elementos.*
import piedras.*
import niveles.*
import configuraciones.*

// orden piedras: trueno -> agua -> fuego -> hielo -> hoja -> lunar -> dia -> noche
// orden elementos: electrico -> agua -> fuego -> hielo -> planta -> veneno -> hada -> siniestro

class Pokemon {
	const elemento = new Elemento()
    var property vida = 0
    var property danio = 0
    var property position = game.center()
    var property image = ""
  
    const piedrasObtenidas = #{}
    
    method piedrasObtenidas(piedra){
    	piedrasObtenidas.add(piedra)
    }
    
    method piedrasObtenidas() = piedrasObtenidas
   
    method elemento() = elemento

    method evolucionar(nuevoElemento) {
        self.vida(nuevoElemento.vida())
        self.danio(nuevoElemento.danio())
    }
     
    method luchar(rival) {
    	rival.recibirDanio(self)    	
    }
    
    method recibirDanio(rival) {
    	vida = 0.max(vida - rival.danioAElemento(self.elemento()))
    	if(self.vida() == 0) {
    		self.perder()
    		rival.ganar()
    	} else {
    		self.luchar(rival)
    	}
    }
    
    method perder() // implementado segun pokemon
    method ganar() // implementado segun pokemon
    
    method danioAElemento(otroElemento) {
    	return self.danio() * self.elemento().factorElemental(otroElemento)
    }
    
    method colisionadoPor(rival){
    	rival.luchar(self)
    }

}

object jugador inherits Pokemon(elemento = elemElectrico,vida = 80, danio = 60, position = game.at(7,0), image = "pokemons/pikachu_izquierda.png") {
	override method perder() {
		game.say(self, "¡Rayos perdi la batalla y no obtuve una piedra!")
		nivel.perdiste()
	}

	override method ganar() {
    	game.say(self, "¡LE GANE!")
    }
}

class Rival inherits Pokemon {
	override method perder() {
		game.removeVisual(self)
		if(not game.hasVisual(actual.nivel().piedra())) {
			nivel.ubicarAleatoriamente(actual.nivel().piedra())
			game.addVisual(actual.nivel().piedra())
		}
	}
	
	override method ganar(){}
}

const otroPikachu = new Rival(elemento = elemElectrico,vida = 20, danio = 5, position = game.at(7,6), image = "pokemons/pikachu_derecha.png")

const chikorita = new Rival(elemento = elemPlanta, vida = 30, danio = 16, position = game.at(7,6), image = "pokemons/Chikorita.png")

const charmander = new Rival(elemento = elemFuego, vida = 10, danio = 10, position = game.at(3,6), image = "pokemons/charmander.png")

const vaporeon = new Rival(elemento = elemAgua, vida = 15, danio = 10, position = game.at(0,6), image = "pokemons/vaporeon.png")

const gengar = new Rival(elemento = elemSiniestro, vida = 1, danio = 1, position = game.at(9,1), image = "pokemons/gengar.png")

const charizard = new Rival(elemento = elemFuego, vida = 100, danio = 100, position = game.at(3,6), image = "pokemons/charizard.png")

const moltres = new Rival(elemento = elemFuego, vida = 50, danio = 40, position = game.at(3,6), image = "pokemons/moltres.png")

const zapdos = new Rival(elemento = elemElectrico,vida = 40, danio = 40, position = game.at(7,0), image = "pokemons/zapdos.png")

const flareon = new Rival(elemento = elemFuego, vida = 40, danio = 20, position = game.at(3,6), image = "pokemons/flareon.png")

const dragonnair = new Rival(elemento = elemAgua, vida = 100, danio = 100, position = game.at(0,6), image = "pokemons/dragonnair.png")

const bulbasaur = new Rival(elemento = elemPlanta, vida = 40, danio = 10, position = game.at(7,6), image = "pokemons/bulbasaur.png")
