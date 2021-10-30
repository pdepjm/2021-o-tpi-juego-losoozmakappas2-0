class Elemento {
	var property vida = 0
	var property danio = 0
	var property nombre = "todavía no tengo un elemento"
	var property fuerteContra = #{}
	var property debilContra = #{}
	
	method esFuerteContra(elemento) = self.fuerteContra().contains(elemento)
	method esDebilContra(elemento) = self.debilContra().contains(elemento)
}

const elemElectrico = new Elemento()

const elemAgua = new Elemento()

const elemFuego = new Elemento()

const elemHielo = new Elemento()

const elemPlanta = new Elemento()

const elemVeneno = new Elemento()

const elemHada = new Elemento()

const elemSiniestro = new Elemento()

// primero instancio los elementos y luego los inicializo, para que no de error 

object inicializar {
	method electrico() {
		elemElectrico.vida(200)
		elemElectrico.danio(50)
		elemElectrico.nombre("electrico")
		elemElectrico.fuerteContra(#{elemAgua})
		elemElectrico.debilContra(#{elemPlanta})
	}
	
	method agua() {
		elemAgua.vida(220)
		elemAgua.danio(40)
		elemAgua.nombre("agua")
		elemAgua.fuerteContra(#{elemFuego})
		elemAgua.debilContra(#{elemPlanta})
	}
	
	method fuego() {
		elemFuego.vida(130)
		elemFuego.danio(90)
		elemFuego.nombre("fuego")
		elemFuego.fuerteContra(#{elemHielo, elemPlanta})
		elemFuego.debilContra(#{elemAgua})
	}
	
	method hielo() {
		elemHielo.vida(180)
		elemHielo.danio(30)
		elemHielo.nombre("hielo")
		elemHielo.fuerteContra(#{elemPlanta, elemSiniestro})
		elemHielo.debilContra(#{elemAgua, elemFuego})
	}
	
	method planta() {
		elemPlanta.vida(200)
		elemPlanta.danio(40)
		elemPlanta.nombre("planta")
		elemPlanta.fuerteContra(#{elemAgua})
		elemPlanta.debilContra(#{elemVeneno, elemFuego})
	}
	
	method veneno() {
		elemVeneno.vida(150)
		elemVeneno.danio(80)
		elemVeneno.nombre("veneno")
		elemVeneno.fuerteContra(#{elemFuego})
		elemVeneno.debilContra(#{elemElectrico})
	}
	
	method hada() {
		elemHada.vida(170)
		elemHada.danio(70)
		elemHada.nombre("hada")
		elemHada.fuerteContra(#{elemSiniestro})
		elemHada.debilContra(#{elemVeneno})
	}
	
	method siniestro() {
		elemSiniestro.vida(190)
		elemSiniestro.danio(70)
		elemSiniestro.nombre("siniestro")
		elemSiniestro.fuerteContra(#{elemPlanta})
		elemSiniestro.debilContra(#{elemHada, elemHielo})
	}
}