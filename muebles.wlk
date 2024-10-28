import cosas.*
class Mueble {
    const cosas = #{}

    method guardar(cosa) {
        self.validarGuardar(cosa)
        cosas.add(cosa)
    }

    method validarGuardar(cosa)
}

class Baul inherits Mueble {
    var property volumenMaximo = 15

    override method validarGuardar(cosa) {
        return if (cosa.volumen() >= self.volumenRestante()) {
            self.error("No hay espacio")
        }
    }

    method volumenRestante() {
      return volumenMaximo - cosas.volumen()
    }
}

class GabineteMagico inherits Mueble{
    override method validarGuardar(cosa) {
        return if (not cosa.esMagico()) {
            self.error(cosa + " no es mágico")
        }
    }
}

class ArmarioConvencional inherits Mueble {
    var property cantidadMaxima = 5

    override method validarGuardar(cosa) {
        return if (cantidadMaxima > self.cantidadRestante()) {
            self.error("No se pueden guardar más cosas")
        }
    }

    method cantidadRestante() {
      return cantidadMaxima - cosas.size()
    }
}

