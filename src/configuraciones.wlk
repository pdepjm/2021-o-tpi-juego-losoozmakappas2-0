import direcciones.*
import wollok.game.*
import niveles.*
import pokemon.*
import elementos.*
import piedras.*

object nivel {
	
	method configurarDirecciones(fondo) {
		keyboard.left().onPressDo({jugador.position(izquierda.proximaPos(jugador.position(), fondo))})
    	keyboard.right().onPressDo({jugador.position(derecha.proximaPos(jugador.position(), fondo))})
    	keyboard.up().onPressDo({jugador.position(arriba.proximaPos(jugador.position(), fondo))})
    	keyboard.down().onPressDo({jugador.position(abajo.proximaPos(jugador.position(), fondo))})
	}
	
	method configurarElementos() {
		inicializar.electrico()
		inicializar.agua()
		inicializar.fuego()
		inicializar.hielo()
		inicializar.planta()
		inicializar.veneno()
		inicializar.hada()
		inicializar.siniestro()
	}
	
	method cargarNivel(nivel) {
		self.configurarDirecciones(nivel.fondo())
		game.boardGround(nivel.fondo().image())
		game.addVisual(jugador)
		game.addVisual(nivel.pokemon())
    	
    	game.onCollideDo(jugador, {
        	piedra => if(piedra.equals(actual.nivel().piedra())) {
        		jugador.evolucionar(piedra.elemento())
        		game.removeVisual(piedra)
        	}
        	
        	//game.clear()
        	//self.cargarNivel(actual.nivel().siguiente())
        	//actual.actualizar()
    	})
	}
	
	method configurarTeclas() {
		keyboard.s().onPressDo({
			game.say(jugador, "Vida: " + jugador.vida().toString() + 
			"\n Daño: " + jugador.danio().toString() +  
			"\n Elemento: " + jugador.elemento().nombre())
		})
		
		keyboard.p().onPressDo({
			game.say(jugador, jugador.elemento().nombre())
		})
		
		keyboard.l().onPressDo({
			if(jugador.estaAlLado(actual.nivel().pokemon())) {
				const perdedor = jugador.luchar(actual.nivel().pokemon())
				if(perdedor == jugador) {
					// hacer algo mas
					game.stop()
				} else {
					game.removeVisual(perdedor)
					game.addVisual(actual.nivel().piedra())
				}
				
			}
		})
	}
	
}