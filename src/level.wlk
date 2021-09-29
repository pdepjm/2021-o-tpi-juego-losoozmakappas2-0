import wollok.game.*
import pieces.*

object level {
	method keysConfig() {
		// todo con la misma pieza para probarlo
		keyboard.down().onPressDo({i.setPosition(i.position().down(1))})
		keyboard.left().onPressDo({i.setPosition(i.position().left(1))})
		keyboard.right().onPressDo({i.setPosition(i.position().right(1))})
	}
	
	method next() = pieces.anyOne()
}