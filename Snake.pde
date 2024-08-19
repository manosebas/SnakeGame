class Snake {
  PVector position, speed;
  int size, puntos;
  boolean f;
  ArrayList<PVector> body = new ArrayList<PVector>();

  Snake() {
    f = false;
    size = 20;
    puntos = 0;
    position = new PVector(width/2, height/2);
    speed = new PVector(size, 0);
    body.add(new PVector(position.x, position.y));
  }

  void mostrar() {
    fill(0, 125, 70);
    stroke(0, 74, 20);
    strokeWeight(4);
    rectMode(CENTER);

    for (PVector c : body) {
      rect(c.x + size/2, c.y + size/2, size, size);
    }
  }

  void mover() {
    if (keyPressed) {
      if (key == 'w' && speed.y == 0) {
        speed.set(0, -size);
      } else if (key == 's' && speed.y == 0) {
        speed.set(0, size);
      } else if (key == 'a' && speed.x == 0) {
        speed.set(-size, 0);
      } else if (key == 'd' && speed.x == 0) {
        speed.set(size, 0);
      }
    }

    position.add(speed);
    body.add(new PVector(position.x, position.y));

    if (!eat(c.getPosition())) {
      body.remove(0);
    }
  }

  boolean eat(PVector food) {
    PVector head = body.get(body.size() - 1);
    return head.equals(food);
  }

  void muerte() {
    PVector head = body.get(body.size() - 1);
    for (int i = 0; i < body.size() - 1; i++) {
      PVector part = body.get(i);
      if (head.equals(part)) {
        f = true;
      }
    }
  }

  void crecer() {
    puntos++;
  }

  void validarBordes() {
    PVector head = body.get(body.size() - 1);
    if (head.x >= width || head.x < 0 || head.y >= height || head.y < 0) {
      f = true;
    }
  }

  int getPuntos() {
    return puntos;
  }

  boolean getF() {
    return f;
  }
}
