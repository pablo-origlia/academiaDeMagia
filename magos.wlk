object selene {
  var energia = 35
  var poder = 60
  var luzLunar = true
  
  method energia() = energia
  
  method poder() = poder
  
  method alternarLuzLunar() {
    luzLunar = not luzLunar
  }
  
  method entrenar() {
    energia += if (not luzLunar) 25 else 0
    poder *= if (luzLunar) 2 else 1
  }
}

object balthazar {
  var entrenamiento = 450
  var hechizos = 0
  
  method energia() = entrenamiento / 10
  
  method poder() = 35 - (hechizos * 3)
  
  method entrenar() {
    entrenamiento += 100
    hechizos += 1
  }
}

object iris {
  var poder = 35
  var salud = 2
  
  method energia() = 80
  
  method poder() = poder
  
  method entrenar() {
    salud += 1
  }
  
  method mejorar(unEscudo) {
    unEscudo.aumentarResistencia(if (salud.odd()) 150 else 80)
    unEscudo.aumentarDurabilidad(if (salud.odd()) 100 else 60 * salud)
  }
}

object aldric {
  var entrenamiento = 0
  var habilidad = 30
  var baston = bastonDeHielo
  
  method energia() = 65 + (20 * entrenamiento)
  
  method poder() = habilidad / 2
  
  method entrenar() {
    habilidad += baston.habilidad()
    entrenamiento += 1
  }
  
  method cambiarBaston(nuevoBaston) {
    baston = nuevoBaston
  }
}

object bastonDeHielo {
  method habilidad() = 40
}

object bastonDeFuego {
  method habilidad() = 60
}