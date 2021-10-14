import wollok.game.*
import piedras.*

class Pokemon {
	var property ptosDeVida
	var property danio
	
	var elemento = ""
	var property position = game.center()
	method image() = "sprite_MainChara_Regimys_All.png"
	
	method setPosition(newPosition) {
		position = newPosition
	}
	
	method cambiarElemento(nuevoElemento) {
		elemento = nuevoElemento
	}
	
	method cambiarPtosDeVida(puntos) {
		ptosDeVida += puntos
	} 
	
	method cambiarDanio(nuevoDanio) {
		danio += nuevoDanio
	}
	
	method tocarPiedra(piedra) {
		self.cambiarElemento(piedra.elemento())
		self.cambiarPtosDeVida(piedra.vida())
		self.cambiarDanio(piedra.danio())
	}
	
}