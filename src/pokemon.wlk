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
    var property limiteIzq = self.position().left(1).x()
    var property limiteDerecha = self.position().right(1).x()
    var property limiteAbajo = self.position().down(1).y()
    var property limiteArriba = self.position().up(1).y()
    
    //agregado
    const piedrasObtenidas=#{}
    
    method piedrasObtenidas(piedra){
    	piedrasObtenidas.add(piedra)
    }
    
    method piedrasObtenidas() = piedrasObtenidas
    
    //
    
    method elemento() = elemento

    method evolucionar(nuevoElemento) {
        self.vida(nuevoElemento.vida())
        self.danio(nuevoElemento.danio())
    }
    
    method luchar(rival) { // dos pokemons luchan y devuelve el perdedor
    	if(self.elemento().esFuerteContra(rival.elemento())) { // mi elemento gana
    		if(rival.elemento().esDebilContra(self.elemento())) { // se cumplen las 2
    			rival.recibirDanio(self.danio() * 2)
    			self.recibirDanio(rival.danio() / 2)
    		} else { // se cumple solo mas fuerte
    			rival.recibirDanio(self.danio() * 1.5)
    			self.recibirDanio(rival.danio())
    		}
    	} else if(self.elemento().esDebilContra(rival.elemento())) { // mi elemento pierde
    		if(rival.elemento().esFuerteContra(self.elemento())) { // se cumplen las 2
    			rival.recibirDanio(self.danio() / 2)
    			self.recibirDanio(rival.danio() * 2)
    		} else { // se cumple solo mas debil
    			rival.recibirDanio(self.danio() / 1.5)
    			self.recibirDanio(rival.danio())
    		}
    	} else { // no gana ninguno
    		rival.recibirDanio(self.danio())
    		self.recibirDanio(rival.danio())
    	}
    	
    	if(self.vida() < rival.vida()) return self else return rival
    }
    
    method recibirDanio(danioRecibido) {
    	vida = 0.max(vida - danioRecibido)
    }
    
    method estaAlLadoDe(pokemon) {
    	return (pokemon.limiteDerecha() == self.position().x() and self.position().y() == pokemon.position().y()) or 
    		   (pokemon.limiteIzq() == self.position().x() and self.position().y() == pokemon.position().y()) or
    		   (pokemon.limiteArriba() == self.position().y() and self.position().x() == pokemon.position().x()) or
    		   (pokemon.limiteAbajo() == self.position().y() and self.position().x() == pokemon.position().x())
    }
    
    //agregado
    /* 
    method colisionadoPor(jugador){
    	//const perdedor = jugador.luchar(actual.nivel().pokemon())
    	const perdedor = jugador.luchar(self)
			if(perdedor == jugador) {
					// agregar dialogo de perdida
				game.stop()
			} else {
				game.removeVisual(perdedor)
				game.say(jugador, "¡LE GANE!")
				//perdedor.position(game.at(-1,-1)) // lo muevo para poder agarrar la piedra
				//game.addVisual(actual.nivel().piedra())
				nivel.ubicarAleatoriamente(actual.nivel().piedra())
				game.addVisual(actual.nivel().piedra())
			}
    }
    */
    method colisionadoPor(jugador){
    	//const perdedor = jugador.luchar(actual.nivel().pokemon())
    	//const perdedor = jugador.luchar(self)
    	//Self en este caso es el rival del jugador
			jugador.luchar(self)
				if(jugador.vida()<self.vida()) {
					// agregar dialogo de perdida
					game.removeVisual(self)
					game.say(jugador, "¡Rayos perdi la batalla y no obtuve una piedra!")	
					actual.actualizar() 
					nivel.pasarALaSiguienteBatalla(actual.nivel())
					//game.stop()
				} else {
					game.removeVisual(self)
					game.say(jugador, "¡LE GANE!")
					//perdedor.position(game.at(-1,-1)) // lo muevo para poder agarrar la piedra
					//game.addVisual(actual.nivel().piedra())
					nivel.ubicarAleatoriamente(actual.nivel().piedra())
					game.addVisual(actual.nivel().piedra())
				}
				
			
    }

}

const jugador = new Pokemon(elemento = elemElectrico,vida = 80, danio = 60, position = game.at(7,0), image = "pokemons/pikachu_izquierda.png")

const otroPikachu = new Pokemon(elemento = elemElectrico,vida = 20, danio = 5, position = game.at(7,6), image = "pokemons/pikachu_derecha.png")

const chikorita = new Pokemon(elemento = elemPlanta, vida = 30, danio = 16, position = game.at(7,6), image = "pokemons/Chikorita.png")

//agregado
const charmander = new Pokemon(elemento = elemFuego, vida = 10, danio = 10, position = game.at(3,6), image = "pokemons/charmander.png")

const vaporeon = new Pokemon(elemento = elemAgua, vida = 15, danio = 10, position = game.at(0,6), image = "pokemons/vaporeon.png")

const gengar = new Pokemon(elemento = elemSiniestro, vida = 1, danio = 1, position = game.at(9,1), image = "pokemons/gengar.png")

const charizard = new Pokemon(elemento = elemFuego, vida = 100, danio = 100, position = game.at(3,6), image = "pokemons/charizard.png")

const moltres = new Pokemon(elemento = elemFuego, vida = 50, danio = 40, position = game.at(3,6), image = "pokemons/moltres.png")

const zapdos = new Pokemon(elemento = elemElectrico,vida = 40, danio = 40, position = game.at(7,0), image = "pokemons/zapdos.png")

const flareon = new Pokemon(elemento = elemFuego, vida = 40, danio = 20, position = game.at(3,6), image = "pokemons/flareon.png")

const dragonnair = new Pokemon(elemento = elemAgua, vida = 100, danio = 100, position = game.at(0,6), image = "pokemons/dragonnair.png")

const bulbasaur = new Pokemon(elemento = elemPlanta, vida = 40, danio = 10, position = game.at(7,6), image = "pokemons/bulbasaur.png")
