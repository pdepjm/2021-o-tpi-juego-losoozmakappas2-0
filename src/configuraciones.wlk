import direcciones.*
import wollok.game.*
import niveles.*
import pokemon.*
import elementos.*
import piedras.*

object nivel {
	
	method configurarLimites() {
		keyboard.left().onPressDo({jugador.position(izquierda.proximaPos(jugador.position()))})
    	keyboard.right().onPressDo({jugador.position(derecha.proximaPos(jugador.position()))})
    	keyboard.up().onPressDo({jugador.position(arriba.proximaPos(jugador.position()))})
    	keyboard.down().onPressDo({jugador.position(abajo.proximaPos(jugador.position()))})
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
		//self.configurarFondo(nivel.fondo())
		self.configurarLimites()
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
		
		keyboard.l().onPressDo({
			// agregar sonidos, "animaciones" a la pelea
			if(jugador.estaAlLadoDe(actual.nivel().pokemon())) {
				const perdedor = jugador.luchar(actual.nivel().pokemon())
				if(perdedor == jugador) {
					// agregar dialogo de perdida
					game.stop()
				} else {
					game.removeVisual(perdedor)
					perdedor.position(game.at(-1,-1)) // lo muevo para poder agarrar la piedra
					game.addVisual(actual.nivel().piedra())
				}
				
			}
			
		})
	}
	
}