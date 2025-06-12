class BarcoPirata {
    const property tripulantes = []
    var mision
    const capacidad
    method cambiarMision(unaMision) {mision = unaMision}
    method agregarPirata(unPirata) {
        if (mision.cumpleRequisitos(unPirata) && capacidad > tripulantes.size()) {
            tripulantes.add(unPirata)
        }
    }
    method tieneSuficienteTripulacion() = capacidad * 0.9 <= tripulantes.size()
    method hayTripulanteQueTiene(unItem) = tripulantes.any({t => t.tieneUnItem(unItem)})
}

class Pirata {
    var nivelEbriedad
    var monedas
    const  property items = []
    method agregarItem(unItem) {items.add(unItem)}
    method tieneUnItem(unItem) = items.contains(unItem)
}

class Mision {
    method puedeCompletarMision(unBarco) = unBarco.tieneSuficienteTripulacion()
}

class BusquedadDelTesoro inherits Mision {
    method hayLlaveEnElBarco(unBarco) = unBarco.hayTripulanteQueTiene("llave")
    override method puedeCompletarMision(unBarco) {
        return super(unBarco) and self.hayLlaveEnElBarco(unBarco)
    }
    method esUtil(unPirata) = unPirata.tieneUnItem("mapa") or unPirata.tieneUnItem("brujula") or unPirata.tieneUnItem("grokXD")
}

