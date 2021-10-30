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
    var property limiteIzq = self.position().left(1).x()
    var property limiteDerecha = self.position().right(1).x()
    var property limiteAbajo = self.position().down(1).y()
    var property limiteArriba = self.position().up(1).y()
    
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
    
    method estaAlLadoDe(pokemon) {
    	return (pokemon.limiteDerecha() == self.position().x() and self.position().y() == pokemon.position().y()) or 
    		   (pokemon.limiteIzq() == self.position().x() and self.position().y() == pokemon.position().y()) or
    		   (pokemon.limiteArriba() == self.position().y() and self.position().x() == pokemon.position().x()) or
    		   (pokemon.limiteAbajo() == self.position().y() and self.position().x() == pokemon.position().x())
    }

}

const jugador = new Pokemon(vida = 40, danio = 15, position = game.at(7,0), image = "pokemons/pikachu_izquierda.png")

const prueba = new Pokemon(elemento = elemElectrico, vida = 1, danio = 1, position = game.at(7,6), image = "pokemons/pikachu_derecha.png")
