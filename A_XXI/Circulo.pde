class Circulo 
{
  Colores col;
  color c;
  
  float px, py;
  float tam;
  float dir;

  PVector posInicial;
  PVector posFinal;
  PVector vel;

  boolean moviendo = true;

  PShape textura;

  PImage canvas = loadImage("canvas.jpg");

  Circulo(float px_, float py_, float tam_) {
    posFinal = new PVector(px_, py_);
    posInicial = new PVector(random(px_*-1, px_*2), py_*-1);
    vel = new PVector(0, 0);
    px = px_;
    py = py_;
    tam = tam_;    
    col = new Colores();
    c = col.elegirColor(random(175,255));
   
  }

  void dibujar() {
    pushStyle();
    noStroke();
    fill(c);
    if (px+tam/2>width) {
      px-=px+tam/2-width;
    }
    if (px-tam/2<0) {
      px+=px+tam/2;
    }
    if (py+tam/2>height) {
      py-=py+tam/2-height;
    }
    if (py-tam/2<0) {
      py+=py+tam/2;
    }
    ellipse(posInicial.x, posInicial.y, tam, tam);
    //textura = createShape(ELLIPSE, posInicial.x, posInicial.y, tam, tam);
    //textura.setTexture(canvas);
    //shape(textura);
    popStyle();
  }


  void mover(float mx_, float my_) {
    float mapX = map(mx_, 0, width, 0, random(5, 10));
    float mapY = map(my_, 0, height, 0, random(5, 10));
    vel.x = mapX;
    vel.y = mapY;
    dir = atan2(posFinal.y-posInicial.y, posFinal.x-posInicial.x);
    if (moviendo) {
      posInicial.add(vel.x*cos(dir), vel.y*sin(dir));
    }
  }


  boolean llega() {
    return(dist(posInicial.x, posInicial.y, posFinal.x, posFinal.y) < 3);
  }
}
