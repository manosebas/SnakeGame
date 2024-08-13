class Snake {
  PVector position, speed;
  int size, puntos;
  boolean f;
  
  ArrayList<PVector> body = new ArrayList<PVector>();
  
  Snake(){
    f = false;
    size = 30;
    puntos = 0;
    
    position = new PVector(width/2, height/2);
    speed = new PVector(1,1);
    
    body.add(new PVector(position.x, position.y));
  }
  
  void mostrar(){
    fill(0, 125, 70);
    stroke(0, 74, 20);
    strokeWeight(4);
    rectMode(CENTER);
    
    for(PVector c : body){
      rect( c.x + size/2, c.y + size/2, size, size);
    }
  }
  
  void mover() {
    if( key == 'w'){
      position.y -= speed.y * size;
    } else if( key == 's') {
      position.y += speed.y * size;
    } else if (key == 'a'){
      position.x -= speed.x * size;
    } else if( key =='d'){
      position.x += speed.x * size;
    }
    
    body.add(new PVector(position.x , position.y));
    body.remove(0);
  }
  
  boolean eat (PVector Food){
    PVector head = body.get(body.size() -1);
    float distance = dist(head.x, head.y, Food.x, Food.y);
    
    if(distance < 1){
      return true;
    } else {
      return false;
    }
  }
   
   void muerte(){
     PVector head = body.get(body.size()-1);
     
     for(int i = 0; i< ( body.size()-1); i++){
       PVector body = this.body.get(i);
       float distance = dist(body.x, body.y, head.x, head.y);
       
       if(distance < 1){
         f = true;
       }
     }
   }
   
    void crecer() {
      body.add(new PVector(position.x, position.y));
      puntos++;
    }
    
    void validarBordes(){
      PVector head = body.get(body.size()-1);
      if(head.x >width - size/2 || head.x < size/2 || head.y > height - size/2 || head.y < size/2){
        f = true;
      }
    }
    
    int getPuntos() {
      return puntos;
    }
    
    boolean getF(){
      return f;
    }
}
