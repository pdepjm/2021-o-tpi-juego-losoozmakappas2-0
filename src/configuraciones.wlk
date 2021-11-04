import direcciones.*
import wollok.game.*
import niveles.*
import pokemon.*
import elementos.*
import piedras.*
import fondos.*

object nivel {
	
	method configurarLimites() {
		keyboard.left().onPressDo({jugador.position(izquierda.proximaPos(jugador.position()))})
    	keyboard.right().onPressDo({jugador.position(derecha.proximaPos(jugador.position()))})
    	keyboard.up().onPressDo({jugador.position(arriba.proximaPos(jugador.position()))})
    	keyboard.down().onPressDo({jugador.position(abajo.proximaPos(jugador.position()))})
	}
	
	method cargarNivel(nivel) {
		self.configurarLimites()
		game.addVisual(nivel.fondo())
		game.addVisual(jugador)
		nivel.pokemonesRivales().forEach{ rival =>  
			game.addVisual(rival)
			self.ubicarAleatoriamente(rival)
		}
    	game.onCollideDo(jugador, {elementoDelTablero => elementoDelTablero.colisionadoPor(jugador) estadoFinal.actualizarEstadoDelJugador()})
	}
	
	method configurarTeclas() {
		keyboard.s().onPressDo({
			game.say(jugador, "Vida: " + jugador.vida().toString() + 
			"\n Daño: " + jugador.danio().toString() +  
			"\n Elemento: " + jugador.elemento().nombre() + jugador.piedrasObtenidas().size().toString())
		})
	}
	
	method ubicarAleatoriamente(elementoDelTablero){
		const posicion = new Position (x=1.randomUpTo(14),y=1.randomUpTo(6))
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
		game.addVisual(fondoGanador)
		keyboard.r().onPressDo({
			self.cargarNivel(nivelBosque)
		})
	}
		
	method perdiste(){
		game.clear()
		game.title("Pokemon")
		game.width(15)
		game.height(10)
        game.addVisual(fondoGameOver)
        actual.nivel(nivelBosque) // volver al nivel inicial
		keyboard.p().onPressDo({
			self.configurarTeclas()
			self.cargarNivel(actual.nivel())
			jugador.vida(80)
		})
		keyboard.f().onPressDo{game.stop()}
		
	}
}

object estadoFinal{
	method actualizarEstadoDelJugador(){
		if (jugador.piedrasObtenidas().size() == 5){
			nivel.ganaste()
		} else if(jugador.vida() == 0){
			nivel.perdiste()
		}
	}
}