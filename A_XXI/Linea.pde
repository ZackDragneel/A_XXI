class Linea
{
  float px1, py1;
  float pasos;
  boolean punteada;
  float longitud;
  float grueso;
  float angulo;
  Colores col;
  color c;

  Linea(float px1_, float py1_, boolean punteada_) {
    longitud = random((width+height)/2, width+height);
    px1 = px1_;
    py1 = py1_ ;
    punteada = punteada_;
    angulo = radians((random(360)));
    pasos = dist(px1, py1, px1+longitud*cos(angulo), py1+longitud*sin(angulo))/5;
    grueso = random(1, 3);
    col = new Colores();
    c = col.elegirColor(random(155,255));
  }

  void dibujar() {
    if (punteada) {

      for (int i=0; i<=pasos; i++) {
        float x = lerp(px1, px1+longitud*cos(angulo), i/pasos);
        float y = lerp(py1, py1+longitud*sin(angulo), i/pasos);
        push();
        noStroke(); 
        fill(c);
        ellipse(x, y, 2, 2);
        pop();
      }
    } else {
      push();
      strokeCap(SQUARE);
      strokeWeight(grueso);
      //line(px1,py1,px2,py2);
      line(px1, py1, px1+longitud*cos(angulo), py1+longitud*sin(angulo)); 
    }
  }

  void mover() {
  }
}
