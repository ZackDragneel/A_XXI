class Compositor 
{
  Circulo circulo;
  ArrayList <Paralelogramo> paralelogramos;
  ArrayList <Linea> lineas;

  float px, py;
  float w, h;
  int cantidadPG;
  int cantidadL;

  PImage canvas;

  Compositor() {
    w = random(width/1.618, width/1.5);
    h = random(height/1.618, height/1.3);
    px = random(0, width-w);
    py = random(0, height-h);

    cantidadPG = int(random(2, 6));
    cantidadL = int(random(2, 4));
    
    canvas = loadImage("canvas.jpg");
    canvas.resize(width, height);
    
    paralelogramos = new ArrayList();
    lineas = new ArrayList();
    circulo = new Circulo(random(px+100, px + w-100), random(py+100, py+h-100), random(w/2, w/1.5));
    for (int i = 0; i<cantidadPG; i++) {
      paralelogramos.add(new Paralelogramo(random(px+50, px + w-50), random(py+50, py+h-50), random(w/6, w/3), random(h/2, h/1.2)));
    }

    for (int i = 0; i<cantidadL; i++) {
      lineas.add(new Linea(random(px+w/3, px+w-w/3), random(py+w/3, py+h-h/3), true));
    }
  }


  void componer() {
    background(canvas);
    pushStyle();
    noFill();
    //rect(px, py, w, h);
    popStyle();
    push();
    circulo.dibujar();
    for (Paralelogramo p : paralelogramos) {
      p.dibujar();
    }
    for (int i = 0; i<cantidadL; i++) {
      lineas.get(i).dibujar();
    }
    pop();
  }

  void mover() {

    for (Paralelogramo p : paralelogramos) {
      if (p.moviendo) {
        if (p.llega()) {
          //println(false);
          p.moviendo = false;
        }
      }
      p.mover(mouseX, mouseY);
    }
    if (circulo.moviendo) {
      if (circulo.llega()) {
        println(false);
        circulo.moviendo = false;
      }
    }
    circulo.mover(mouseX, mouseY);
  }
}
