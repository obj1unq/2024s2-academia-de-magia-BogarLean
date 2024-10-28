import muebles.*

object academia {
	const property muebles = {}

	method guardar(cosa) {
	  self.validarMueble(cosa)
	  const mueble = muebles.any({mueble => mueble.validarGuardar(cosa)})
	  mueble.guardar(cosa)
	}

	method validarMueble(cosa) {
	  return if (not self.hayAlMenenosUnMuebleParaGuardar(cosa)) {
		self.error("No se puede guardar " + cosa)
	  }
	}

	method hayAlMenenosUnMuebleParaGuardar(cosa) {
	  return not muebles.filter({mueble => mueble.validarGuardar(cosa)}).isEmpty()
	}
}
