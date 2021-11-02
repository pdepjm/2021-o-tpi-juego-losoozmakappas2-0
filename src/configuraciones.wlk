import direcciones.*
import wollok.game.*
import niveles.*
import pokemon.*
import elementos.*
import piedras.*

//agregado
import fondos.*

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
		//game.boardGround(nivel.fondo().image())
		game.addVisual(nivel.fondo())
		game.addVisual(jugador)
		//self.ubicarAleatoriamente(nivel.pokemon())
		//game.addVisual(nivel.pokemon())
			nivel.pokemonesRivales().forEach { rival =>  
			game.addVisual(rival)
			self.ubicarAleatoriamente(rival) 
		}
		
    	
    	/* 
    	game.onCollideDo(jugador, {
        	piedra => if(piedra.equals(actual.nivel().piedra())) {
        		jugador.evolucionar(piedra.elemento())
        		game.removeVisual(piedra)
        	}
        	
        	//game.clear()
        	//self.cargarNivel(actual.nivel().siguiente())
        	//actual.actualizar()
    	})
    	
    	*/
    	game.onCollideDo(jugador, {elementoDelTablero => elementoDelTablero.colisionadoPor(jugador) estadoFinal.actualizarEstadoDelJugador()})
	}
	
	method configurarTeclas() {
		
		keyboard.s().onPressDo({
			game.say(jugador, "Vida: " + jugador.vida().toString() + 
			"\n Daño: " + jugador.danio().toString() +  
			"\n Elemento: " + jugador.elemento().nombre() + jugador.piedrasObtenidas().size().toString())
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
	
	//agregado
	method ubicarAleatoriamente(elementoDelTablero){
		var posicion = new Position (x=1.randomUpTo(14),y=1.randomUpTo(6))
		if(game.getObjectsIn(posicion).isEmpty())
			elementoDelTablero.position(posicion)
		else
			self.ubicarAleatoriamente(elementoDelTablero)			
		
	}
	
	method pasarALaSiguienteBatalla(nuevoNivel){
		game.schedule (2000, {=>game.clear() self.configurarTeclas() self.cargarNivel(nuevoNivel)})
	}
	
	method ganaste(){
		game.clear()
		game.title("Pokemon")
		game.width(15)
		game.height(10)
		//game.boardGround(fondoGanador.image())
		game.addVisual(fondoGanador)

		//keyboard.p().onPressDo{self.inicio()}
		//keyboard.f().onPressDo{game.stop()}
	}
		
	method perdiste(){
		game.clear()
		game.title("Pokemon")
		game.width(15)
		game.height(10)
        game.addVisual(fondoGameOver)
        actual.nivel(nivelBosque) // volver alnivel inicial
		keyboard.p().onPressDo{self.configurarTeclas() self.cargarNivel(actual.nivel())}
		keyboard.f().onPressDo{game.stop()}
		
	}
}

//agregado
object estadoFinal{
	
	method actualizarEstadoDelJugador(){
		if (jugador.piedrasObtenidas().size()==5){
			nivel.ganaste()
		} else if(jugador.vida()==0){
			nivel.perdiste()
		}
	}
}