import fondos.*

object izquierda {
	method proximaPos(actualPos, fondo) {
		if(actualPos.x() == fondo.limiteIzq()){
			return actualPos
		} else {
			return actualPos.left(1)
		}
	}
}

object derecha {
	method proximaPos(actualPos, fondo) {
		if(actualPos.x() == fondo.limiteDerecha()){
			return actualPos
		} else {
			return actualPos.right(1)
		}
	}
}

object arriba {
	method proximaPos(actualPos, fondo) {
		if(actualPos.y() == fondo.limiteArriba()){
			return actualPos
		} else {
			return actualPos.up(1)
		}
	}
}

object abajo {
	method proximaPos(actualPos, fondo) {
		if(actualPos.y() == fondo.limiteAbajo()){
			return actualPos
		} else {
			return actualPos.down(1)
		}
	}
}