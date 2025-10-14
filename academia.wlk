import magos.*

object academina {
  const property magos = #{}
  const property candidatos = #{}
  
  method puedeIngresar(unMago) = (unMago.energia() > 40) and (unMago.poder() >= 30)
  
  method reclutar(unMago) {
    if (self.puedeIngresar(unMago)) {
      magos.add(unMago)
      candidatos.remove(unMago)
    } else {
      candidatos.add(unMago)
    }
  }
  
  method evaluarCandidatos() {
    const pasantes = candidatos.filter({ c => self.puedeIngresar(c) })
    candidatos.removeAll(pasantes)
    magos.addAll(pasantes)
    return pasantes
  }
  
  method entrenar() {
    magos.forEach({ m => m.entrenar() })
  }
  
  method poder() = magos.sum({ m => m.poder() })
  
  method estaEnCondiciones() = magos.all({ m => m.energia() >= 45 })
  
  method magoMasPoderoso() = magos.max({ m => m.poder() })
  
  method magoMenosPoderoso() = magos.min({ m => m.poder() })
  
  method delta() = (self.magoMasPoderoso().energia() - self.magoMenosPoderoso()).abs()
  
  method poderes() = magos.filter({ m => m.energia() > 90 }).map({ m => m.poder() })
}

object escudo {
  var resistencia = 400
  var durabilidad = 600
  
  method aumentarResistencia(unValor) {
    resistencia += unValor
  }
  
  method aumentarDurabilidad(unValor) {
    durabilidad = (durabilidad + unValor).min(1000)
  }
}