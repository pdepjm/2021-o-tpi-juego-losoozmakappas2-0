class Elemento {
	var property vida = 0
	var property danio = 0
	var property nombre = "todavía no tengo un elemento"
	var property fuerteContra = #{}
	var property debilContra = #{}
	
	method esFuerteContra(elemento) = self.fuerteContra().contains(elemento)
	method esDebilContra(elemento) = self.debilContra().contains(elemento)
	
	method factorElemental(otroElemento) {
		// completar
		if(self.esFuerteContra(otroElemento)) {
			
		}
	}
}


object elemElectrico inherits Elemento(vida = 200, danio = 50, nombre = "electrico", fuerteContra = #{elemAgua}, debilContra = #{elemPlanta, elemFuego}) {}

object elemAgua inherits Elemento(vida = 200, danio = 40, nombre = "agua", fuerteContra = #{elemFuego}, debilContra = #{elemPlanta}) {}

object elemFuego inherits Elemento(vida = 130, danio = 90, nombre = "fuego", fuerteContra = #{elemHielo,elemPlanta,elemElectrico}, debilContra = #{elemAgua}) {}

object elemHielo inherits Elemento(vida = 180, danio = 30, nombre = "hielo", fuerteContra = #{elemPlanta, elemSiniestro}, debilContra = #{elemAgua, elemFuego}) {}

object elemPlanta inherits Elemento(vida = 200, danio = 40, nombre = "planta", fuerteContra = #{elemAgua, elemElectrico}, debilContra = #{elemVeneno, elemFuego}) {}

object elemVeneno inherits Elemento(vida = 150, danio = 80, nombre = "veneno", fuerteContra = #{elemFuego}, debilContra = #{elemElectrico}) {}

object elemHada inherits Elemento(vida = 170, danio = 70, nombre = "hada", fuerteContra = #{elemSiniestro}, debilContra = #{elemVeneno}) {}

object elemSiniestro inherits Elemento(vida = 190, danio = 70, nombre = "siniestro", fuerteContra = #{elemPlanta}, debilContra = #{elemHada, elemHielo}) {}