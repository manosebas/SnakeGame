// Globales
Snake s;
Food c;
boolean gameOver, startScreen;
PFont tipografia;

void setup() {
  size(640, 480);
  frameRate(10);
  tipografia = createFont("Georgia", 30);
  startScreen = true;
  gameOver = false;
  noLoop(); // Detiene el loop hasta que se inicie el juego
}

void draw() {
  background(0, 185, 85);
  stroke(255);

  if (startScreen) {
    pantallaInicio();
  } else if (!gameOver) {
    c.mostrar();
    s.mostrar();
    s.mover();
    s.validarBordes();
    s.muerte();

    if (s.eat(c.getPosition())) {
      c = new Food();
      s.crecer();
    }

    if (s.getF()) {
      gameOver = true;
    }
  } else {
    pantallaGameOver();
  }
}

void pantallaInicio() {
  fill(255);
  textFont(tipografia);
  textAlign(CENTER);
  textSize(50);
  text("SNAKE GAME", width/2, height/2 - 50);
  textSize(20);
  text("Press ENTER to start", width/2, height/2 + 50);
}

void pantallaGameOver() {
  fill(255);
  textFont(tipografia);
  textAlign(CENTER);
  textSize(100);
  text("Game Over", width/2, height/2);
  textSize(20);
  text("Press SPACE to play again", width/2, height/2 + 50);
  text("Score: " + s.getPuntos(), width/2, height/2 + 100);
}

void keyPressed() {
  if (startScreen && key == ENTER) {
    iniciarJuego();
  } else if (gameOver && key == ' ') {
    iniciarJuego();
  }
}

void iniciarJuego() {
  s = new Snake();
  c = new Food();
  gameOver = false;
  startScreen = false;
  loop(); // Inicia el loop del juego
}
