public static float zoom = 1.0;
public static float SNAP_THRESHOLD = 1.0;
public float cameraX,cameraY = 0;
public PVector cursor;
public PVector realCursor;
public float inchesPerPixel;
public float cameraVelocity = 0.0;
public float Dx,Dy = 0.01;
Line top = new Line(true,new PVector(100,100),new PVector(600,100));
void setup(){
   size(2160,1360);
   
}
void draw(){
  clear();
  background(255,255,255);
  updateCamera();
  top.render();
  cursor = new PVector(mouseX,mouseY);
  realCursor = new PVector(cursor.x + cameraX, cursor.y +cameraY);
}
public void updateCamera(){
  if (abs(Dx) > EditorConstants.maxVelocityX){
      Dx = (Dx > 0) ? EditorConstants.maxVelocityX : -EditorConstants.maxVelocityX;
  }
  if (abs(Dy) > EditorConstants.maxVelocityY){
      Dy = (Dy > 0) ? EditorConstants.maxVelocityY : -EditorConstants.maxVelocityY;
  }
  cameraX += Dx ;
  cameraY += Dy ;
  Dx *= 0.9;
  Dy *= 0.9;
}
void keyPressed(){
  if (keyCode == LEFT) {
    if(Dx < 5 && Dx >= -1){
      Dx = -5;
    }else{
        Dx *= (Dx < 0) ? 1.3 : 0.7;
    }

  }
  if (keyCode == RIGHT) {
    if(Dx > -5 && Dx <= 1){
      Dx = 5;
    }else{
        Dx *= (Dx > 0) ? 1.3 : 0.7;
    }
  }
  if (keyCode == UP) {
    if(Dy > -5 && Dy <= 1){
      Dy = 5;
    }else{
        Dy *= (Dy > 0) ? 1.3 : 0.7;
    }
  }
  if (keyCode == DOWN) {
    if(Dy < 5 && Dy >= -1){
      Dy = -5;
    }else{
        Dy *= (Dy < 0) ? 1.3 : 0.7;
    }
  }
  if (key == 'a'){
    zoom *= 0.95;
  }
  if (key == 'z'){
    zoom *= 1 / 0.95;
  }
}