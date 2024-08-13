Snake s;
Food c;
Boolean gameOver;
PFont tipografia;


void setup() {
  size(640,480);
  frameRate(10);
  s = new Snake();
  c = new Food();
  tipografia = createFont("Georgia",30);
  gameOver = false;
}

void draw() {
  background(0, 185, 85);
  stroke(255);
 
  if(gameOver == false){
    c.mostrar();
    s.mostrar();
    s.mover();
    s.validarBordes();
    s.muerte();
    
    if(s.eat(c.getPosition()) == true){
      c = new Food();
      text(s.getPuntos(),100,100);
      s.crecer();  
     }
     
     if(s.getF()){
        gameOver = true;
      }
      
  }else{
        fill(255);
        textFont(tipografia);
        textAlign(CENTER);
        textSize(100);
        text("Game over", width/2, height/2);
        textSize(20);
        text("Presione la tecla space para volver a jugar", width/2, height/2 + 50);
        text("Puntos: " + s.getPuntos(), width/2, height/2 + 100);
      }
}
