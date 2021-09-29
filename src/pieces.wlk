import wollok.game.*

class Piece {
	const image = ""
	var position = game.at(3, 10)
	
	method image() = image
	method position() = position
	
	method setPosition(newPosition) {
		position = newPosition
	}
	
	method rotate(){
		
	}
}

object background {
	method image() = "background.png"
}

const i = new Piece(image = "pieces/I.png")
const l = new Piece(image = "pieces/I.png")
const j = new Piece(image = "pieces/I.png")
const z = new Piece(image = "pieces/I.png")
const s = new Piece(image = "pieces/I.png")
const o = new Piece(image = "pieces/I.png")
const pieces = #{i, l, j, z, s, o}