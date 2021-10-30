import wollok.game.*
import elementos.*
import piedras.*

// orden piedras: trueno -> agua -> fuego -> hielo -> hoja -> lunar -> dia -> noche
// orden elementos: electrico -> agua -> fuego -> hielo -> planta -> veneno -> hada -> siniestro

class Pokemon {
	const elemento = new Elemento()
    var property vida = 0
    var property danio = 0
    var property position = game.center()
    var property image = ""
    
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
    	vida -= danioRecibido
    }
    
    // cambiar
    method estaAlLado(pokemon) {
    	return self.derecha(pokemon) or 
    		   self.izquierda(pokemon) or
    		   self.arriba(pokemon) or
    		   self.abajo(pokemon)
    }
    
	method derecha(pokemon) = self.position() == pokemon.position().right(1)
	method izquierda(pokemon) = self.position() == pokemon.position().left(1)
	method arriba(pokemon) = self.position() == pokemon.position().up(1)
	method abajo(pokemon) = self.position() == pokemon.position().down(1)

}

const jugador = new Pokemon(vida = 40, danio = 15, position = game.at(7,0), image = "pokemons/pikachu_izquierda.png")

const prueba = new Pokemon(elemento = elemElectrico, vida = 1, danio = 1, position = game.at(7,6), image = "pokemons/pikachu_derecha.png")
