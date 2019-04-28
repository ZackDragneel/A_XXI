class Colores {

  color [] paleta = {int(#bc9826), int(#f03b28), int(#bcaaa8), int(#030512), int(#030512), int(#bfc7ba)};


  Colores() {
    
  }



  color elegirColor(float alfa_) {
    int x = int(random(paleta.length));
    println(color(red(paleta[x]), green(paleta[x]), blue(paleta[x]), alfa_));
    return color(red(paleta[x]), green(paleta[x]), blue(paleta[x]), alfa_);
  }
}
