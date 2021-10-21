import wollok.game.*
import piedras.*

// todo: cambiar imagenes, agregar pokemones estaticos

class Pokemon {
    var property vida
    var property danio

    var elemento = ""
    var property position = game.center()
    var property image = ""
	
    method setElemento(nuevoElemento) {
        elemento = nuevoElemento
    }

    method setVida(nuevosPuntos) {
        vida += nuevosPuntos
    } 

    method setDanio(nuevoDanio) {
        danio += nuevoDanio
    }

    method evolucionar(piedra) {
        self.setElemento(piedra.elemento())
        self.setVida(piedra.vida())
        self.setDanio(piedra.danio())
    }

}