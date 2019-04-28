class Paralelogramo 
{
  float px, py;
  float w, h;
  float corte;
  float rotacion;
  float offsetx;
  float offsety;
  float dir;

  boolean vertical = true;
  boolean moviendo = true;

  PVector posInicial;
  PVector posFinal;
  PVector vel;

  PShape textura;

  PImage canvas;

  Colores col;
  color c;

  Paralelogramo(float px_, float py_, float w_, float h_) {
    posFinal = new PVector(px_, py_);
    posInicial = new PVector(random(px_*-1, px_*2), py_*-1);
    vel =  new PVector(0, 0);
    px = px_;
    py = py_;
    w = w_;
    h = h_;
    canvas = loadImage("canvas.jpg");
    corte = 25;
    rotacion = random(100);
    col = new Colores();
    c = col.elegirColor(random(155,255));

    if (height>width) {
      if (rotacion > 75 && rotacion < 90) {
        rotacion = radians(90);
        vertical = false;
      } else if (rotacion > 90) {
        rotacion = radians(45);
        vertical = false;
      } else {
        rotacion = radians(0);
        vertical = true;
      }
    }

    if (width>height) {
      if (rotacion > 75 && rotacion < 90) {
        rotacion = radians(0);
        vertical = true;
      } else if (rotacion > 90) {
        rotacion = radians(random(360));
        vertical = false;
      } else {
        rotacion = radians(90);
        vertical = false;
      }
    }
    push();
    rectMode(CENTER);
    shapeMode(CENTER);
    translate(posInicial.x, posInicial.y);
    rotate(rotacion);
    shearY(radians(corte));
    if (vertical) {
      if (py+dist(px, py, px+w/2, py+h/2)>height) {
        offsety = (py+dist(px, py, px+w/2, py+h/2)-height)+50;
      }
      if (py-dist(px, py, px-w/2, py-h/2)<0) {
        offsety = (py-dist(px, py, px-w/2, py-h/2)%height)-50;
      }
      if (px+w/2>width) {
        offsetx = (px+w/2-width)+50;
      }
      if (px-w/2<0) {
        offsetx = (px-w/2%width)-50;
      }
    }

    if (!vertical) {
      if (py+dist(px, py, px-w/2, py-h/2)>width) {
        offsety = (py+dist(px, py, px-w/2, py-h/2)-width);
        scale(0.7, 1);
      }
      if (py-dist(px, py, px+w/2, py+h/2)<0) {
        offsety = (py-dist(px, py, px+w/2, py+h/2)%width)-50;
        scale(0.7, 1);
      }
      if (px-w/2>height) {
        offsetx = (px-w/2-height)+50;
      }
      if (px+w/2<0) {
        offsetx = (px+w/2%height)-50;
      }
    }
    pop();
  }

  void dibujar() {
    push();
    noStroke();
    rectMode(CENTER);
    shapeMode(CENTER);
    tint(c);
    translate(posInicial.x, posInicial.y);
    rotate(rotacion);
    shearY(radians(corte));
    if (vertical) {
      //rect(0-offsetx, 0-offsety, w, h);
      textura = createShape(RECT, 0-offsetx-w/2, 0-offsety-h/2, w, h);
      textura.setTexture(canvas);
      shape(textura);
    }
    if (!vertical) {
      //rect(0-offsety, 0-offsetx, w, h);
      textura = createShape(RECT, 0-offsety-w/2, 0-offsetx-h/2, w, h);
      textura.setTexture(canvas);
      shape(textura);
    }
    pop();
  }

  void mover(float mx_, float my_) {
    float mapX = map(mx_, 0, width, 0, random(2, 10));
    float mapY = map(my_, 0, height, 0, random(2, 10));
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

  void comparar(Paralelogramo otro) {
    /*if (vertical && otro.vertical) {
     if ( otro.px + otro.w/2 >= px - w/2 && 
     otro.px-otro.w/2 <= px + w/2 &&     
     otro.py+otro.h/2 >= py-h/2 &&    
     otro.py-otro.h/2 <= py + h/2 ) {
     //col = color(0);
     line(otro.px, otro.py, px, py);
     println(true);
     }
     }*/
  }
}
