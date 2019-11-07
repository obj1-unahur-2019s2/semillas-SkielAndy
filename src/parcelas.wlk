import semillas.*

class Parcelas {

	var property ancho
	var property largo
	var property horasDeSolPorDia = 0
	var property plantas = []

	method superficie() = ancho * largo

	method cantidadMaxima() {
		return if (ancho > largo) {
			self.superficie() / 5
		} else {
			self.superficie() / 3 + largo
		}
	}

	method tieneComplicaciones() {
		return plantas.any({ p => p.horasDeSol() < horasDeSolPorDia })
	}

	method esAptaParaParcela(planta) = (plantas.size() + 1 > self.cantidadMaxima()) or ((horasDeSolPorDia - planta.horasDeSol()) > 2)

	method agregarPlanta(planta) {
		if (self.esAptaParaParcela(planta)) {
			self.error("no se puede planta ")
		}
		plantas.add(planta)
	}
	method ideal()=plantas.any({ p => p.altura() > 1.5})
	method seAsociaBien(planta) = false
	method porcenajeDeBienAsociadas(){
		return plantas.count({p=>self.seAsociaBien(p)})/plantas.size()
	}
}

class Ecologicas inherits Parcelas {

	override method seAsociaBien(planta) {
		return not self.tieneComplicaciones() and planta.esIdeal(self)
	}

}

class Industriales inherits Parcelas {

	override method seAsociaBien(planta) {
		return self.cantidadMaxima() == 2 and planta.esFuerte()
	}

}

