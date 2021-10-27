import direcciones.*
import wollok.game.*
import niveles.*
import pokemon.jugador

object nivel {
	
	method configurarDirecciones(fondo) {
		keyboard.left().onPressDo({ jugador.position(izquierda.proximaPos(jugador.position(), fondo))})
    	keyboard.right().onPressDo({ jugador.position(derecha.proximaPos(jugador.position(), fondo))})
    	keyboard.up().onPressDo({ jugador.position(arriba.proximaPos(jugador.position(), fondo))})
    	keyboard.down().onPressDo({ jugador.position(abajo.proximaPos(jugador.position(), fondo))})
	}
	
	method cargarNivel(nivel) {
		self.configurarDirecciones(nivel.fondo())
		game.boardGround(nivel.fondo().image())
		game.addVisual(jugador)
		game.addVisual(nivel.pokemon())
		game.addVisual(nivel.piedra())
		
		game.onCollideDo(jugador, {
        piedra => jugador.evolucionar(piedra)
        game.clear()
        self.cargarNivel(actual.nivel().siguiente())
        actual.actualizar()
    })
	}
	
	method removerNivel(nivel) {
		game.removeVisual(jugador)
		game.removeVisual(nivel.piedra())
	}
	
	method configurarTeclas() {
		keyboard.s().onPressDo({
			game.say(jugador, "Vida: " + jugador.vida().toString() + "\n Daño: " + jugador.danio().toString() +  "\n Elemento: " + jugador.elemento())
		})
	}
	
}