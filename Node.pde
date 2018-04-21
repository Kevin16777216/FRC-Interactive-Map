public class Node {
  private PVector position;
  public Node(){
  }
  public Node(PVector position){
    this.position = position;
  }
  
  public boolean isSnap(){
    return sqrt(pow(mouseX - position.x,2) + pow(mouseY - position.y,2)) < SNAP_THRESHOLD * zoom;
  }
  
}