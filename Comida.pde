class Food {
  PVector position;
  int size;

  Food() {
    size = 20;
    position = new PVector(int(random(width/size)), int(random(height/size)));
    position.mult(size);
  }

  void mostrar() {
    fill(0, 255, 0);
    noStroke();
    rectMode(CENTER);
    rect(position.x + size/2, position.y + size/2, size, size);
  }

  PVector getPosition() {
    return position;
  }
}
