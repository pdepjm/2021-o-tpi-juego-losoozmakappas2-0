import wollok.game.*

class Piedra {
    const property vida
    const property danio
    const property elemento = ""
    const property position
    const property image = ""
}

// tipo de piedra -> elemento que transforma

// agua -> agua
const agua = new Piedra(vida = 100, danio = 20, elemento = "agua", position = game.at(2,2), image = "piedras/piedra_agua.png")

// dia -> planta / normal / hada
const dia = new Piedra(vida = 100, danio = 20, elemento = "dia", position = game.at(5,5), image = "piedras/piedra_dia.png")

// fuego -> fiego
const fuego = new Piedra(vida = 50, danio = 80, elemento = "fuego", position = game.at(4,4), image = "piedras/piedra_fuego.png")

// hielo -> hielo
const hielo = new Piedra(vida = 100, danio = 20, elemento = "hielo", position = game.at(5,5), image = "piedras/piedra_hielo.png")

// hoja -> planta
const hoja = new Piedra(vida = 100, danio = 20, elemento = "hoja", position = game.at(7,6), image = "piedras/piedra_hoja.png")

// lunar -> veneno / normal / psiquico / hada
const lunar = new Piedra(vida = 100, danio = 20, elemento = "lunar", position = game.at(5,5), image = "piedras/piedra_lunar.png")

// noche -> siniestro / fantasma
const noche = new Piedra(vida = 100, danio = 20, elemento = "noche", position = game.at(5,5), image = "piedras/piedra_noche.png")

// solar -> planta / electrico
const solar = new Piedra(vida = 100, danio = 20, elemento = "solar", position = game.at(5,5), image = "piedras/piedra_solar.png")

// trueno -> electrico
const trueno = new Piedra(vida = 100, danio = 20, elemento = "trueno", position = game.at(5,5), image = "piedras/piedra_trueno.png")