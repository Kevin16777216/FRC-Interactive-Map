public class Line{
  private boolean isFinalized;
  private float m,b;
  private PVector pointA,pointB  = new PVector(0,0);
  public Line(boolean finalized, PVector pointA, PVector pointB){
    isFinalized = finalized;
    this.pointA = pointA;
    this.pointB  = pointB;
  }
  public void updatePoint(int point, PVector value){
    if (point == 1){
      pointA = value;
      return;
    }
    pointB = value;
  }
  public void render(){
    stroke(4);
    line((((width/2) - pointA.x) - cameraX) * zoom,(pointA.y + cameraY) * zoom ,(((width/2) - pointB.x)  -cameraX)* zoom,(pointB.y+cameraY) * zoom );
    stroke(1);
  }
  public void updateLine(){
    m = (pointA.x-pointB.x)/(pointA.y/pointB.y);
    b =  pointA.y - (m * pointA.x);
  }
  public boolean isNear(float x, float y){
    if( (y > min(pointA.y,pointB.y) && y < max(pointA.y,pointB.y)) && (x > min(pointA.x,pointB.x) && x < max(pointA.x,pointB.x))){
      return (abs(y - (x * m + b)) < SNAP_THRESHOLD);
    }
    return false;
  }
  public PVector finalSnapPoint(PVector point){
    return new PVector(point.x, point.x * m + b);
  }
}