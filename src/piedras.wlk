import wollok.game.*
import elementos.*
///agregado
import niveles.*
import configuraciones.*
import pokemon.*


class Piedra {
    const property elemento = new Elemento()
    var property position = game.at(0, 0)
    var property image = ""
    
    //agregado
    method colisionadoPor(pokemon){
    	if(pokemon.elemento().equals(self.elemento())){
    		pokemon.evolucionar(self.elemento())
    		pokemon.piedrasObtenidas(self)
    		game.say(pokemon,"Con esta piedra puedo Evolucionar")
    		game.removeVisual(self)
    	}else{
    		game.say(pokemon, "¡Con esta piedra no puedo evolucionar!")
    		pokemon.piedrasObtenidas(self)
    		game.removeVisual(self)
    	}
    	actual.actualizar() 
    	//actual.nivel(nivelElectrico)
    	//actual.elegirNivelAlAzar()
    	
    	if(jugador.piedrasObtenidas().size()<5){ 
    	//game.schedule (5000, {=>game.clear() nivel.configurarTeclas() nivel.cargarNivel(actual.nivel())})
    	nivel.pasarALaSiguienteBatalla(actual.nivel())
    	}
    }
} 

// tipo de piedra -> elemento que transforma

// agua -> agua
const piedraAgua = new Piedra(elemento = elemAgua, position = game.at(2,2), image = "piedras/piedra_agua.png")

// dia -> planta / normal / hada
const piedraDia = new Piedra(elemento = elemHada, position = game.at(5,5), image = "piedras/piedra_dia.png")

// fuego -> fiego
const piedraFuego = new Piedra(elemento = elemFuego, position = game.at(4,4), image = "piedras/piedra_fuego.png")

// hielo -> hielo
const piedraHielo = new Piedra(elemento = elemHielo, position = game.at(5,5), image = "piedras/piedra_hielo.png")

// hoja -> planta
const piedraHoja = new Piedra(elemento = elemPlanta, position = game.at(7,6), image = "piedras/piedra_hoja.png")

// lunar -> veneno / normal / psiquico / hada
const piedraLunar = new Piedra(elemento = elemVeneno, position = game.at(5,5), image = "piedras/piedra_lunar.png")

// noche -> siniestro / fantasma
const piedraNoche = new Piedra(elemento = elemSiniestro, position = game.at(5,5), image = "piedras/piedra_noche.png")

// solar -> planta / electrico
const piedraSolar = new Piedra(elemento = elemElectrico, position = game.at(5,5), image = "piedras/piedra_solar.png")

// trueno -> electrico
const piedraTrueno = new Piedra(elemento = elemElectrico, position = game.at(5,5), image = "piedras/piedra_trueno.png")


