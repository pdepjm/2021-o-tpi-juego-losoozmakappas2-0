import wollok.game.*
import piedras.*

// orden piedras: trueno -> agua -> fuego -> hielo -> hoja -> lunar -> dia -> noche
// orden elementos: electrico -> agua -> fuego -> hielo -> planta -> veneno -> hada -> siniestro

class Pokemon {
    var property vida = 0
    var property danio = 0

    var property elemento = ""
    var property position = game.center()
    var property image = ""

    method evolucionar(piedra) {
        self.elemento(piedra.elemento())
        self.vida(piedra.vida())
        self.danio(piedra.danio())
    }
    
    method luchar(rival) {
    	
    }

}

const jugador = new Pokemon(vida = 10, danio = 10, elemento = "electrico", position = game.at(7,0), image = "pokemons/pikachu.png")