import wollok.game.*

class Piedra {
	const property vida
	const property danio
	const property elemento = ""
	const property position
	method image() = "ygyu"
}

const agua = new Piedra(vida = 100, danio = 20, elemento = "agua", position = game.at(0,0))
const fuego = new Piedra(vida = 50, danio = 80, elemento = "fuego", position = game.at(4,4))