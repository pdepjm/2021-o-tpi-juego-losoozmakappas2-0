import niveles.*

object izquierda {
	method proximaPos(actualPos) {
		if(actualPos.x() == actual.nivel().fondo().limiteIzq() or 
		  (actualPos.x() == actual.nivel().pokemon().limiteDerecha() and 
		  actualPos.y() == actual.nivel().pokemon().position().y())) {
			return actualPos
		} else {
			return actualPos.left(1)
		}
	}
}

object derecha {
	method proximaPos(actualPos) {
		if(actualPos.x() == actual.nivel().fondo().limiteDerecha() or 
		  (actualPos.x() == actual.nivel().pokemon().limiteIzq() and 
		  actualPos.y() == actual.nivel().pokemon().position().y())) {
			return actualPos
		} else {
			return actualPos.right(1)
		}
	}
}

object arriba {
	method proximaPos(actualPos) {
		if(actualPos.y() == actual.nivel().fondo().limiteArriba() or 
		  (actualPos.y() == actual.nivel().pokemon().limiteAbajo() and 
		  actualPos.x() == actual.nivel().pokemon().position().x())) {
			return actualPos
		} else {
			return actualPos.up(1)
		}
	}
}

object abajo {
	method proximaPos(actualPos) {
		if(actualPos.y() == actual.nivel().fondo().limiteAbajo() or 
		  (actualPos.y() == actual.nivel().pokemon().limiteArriba() and 
		  actualPos.x() == actual.nivel().pokemon().position().x())) {
			return actualPos
		} else {
			return actualPos.down(1)
		}
	}
}