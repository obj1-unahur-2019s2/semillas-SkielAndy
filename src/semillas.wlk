import parcelas.*

class Plantas {

	var property anioDeObtencion = 0
	var property altura = 0

	method horasDeSol()

	method esFuerte() = self.horasDeSol() > 10

	method daSemillas() = self.esFuerte()

	method espacio()

}

class Menta inherits Plantas {

	override method horasDeSol() = 6

	override method daSemillas() = super() or altura > 0.4

	override method espacio() = altura * 3

	method esIdeal(parcela) = parcela.superficie() > 6

}

class Soja inherits Plantas {

	override method horasDeSol() {
		return if (altura < 0.5) {
			6
		} else if (altura.between(0.5, 1)) {
			7
		} else {
			9
		}
	}

	override method daSemillas() {
		return super() or (anioDeObtencion > 2007 and altura > 1)
	}

	override method espacio() = altura / 2

	method esIdeal(parcela) = self.horasDeSol() == parcela.horasDeSolPorDia()

}

class Quinoa inherits Plantas {

	var property horasDeSol

	override method espacio() = 0.5

	override method daSemillas() = super() or (anioDeObtencion < 2005)

	method esIdeal(parcela) = not parcela.ideal()

}

class SojaTransgenica inherits Soja {

	override method daSemillas() = false

	override method esIdeal(parcela) = parcela.cantidadMaxima() == 1

}

class Hierbabuena inherits Menta {

	override method espacio() = super() * 2

}

