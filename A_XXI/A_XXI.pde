Compositor compositor;

void setup() {
  size(650, 815);
  //size(1300, 1930);
  //size(815,650);
  //fullScreen();
  background(225);
  compositor = new Compositor();
  
  
}

void draw() {
  compositor.componer();
  compositor.mover();
}

void mousePressed() {
  setup();
}
