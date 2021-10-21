public class createTicket {
  PVector pos;
  float r;
  color end;
  
  createTicket(float x, float y, float r) {
    pos = new PVector(x,y);
    this.r = r;
    end = color(255,0,0);
  }
  
  public void show() {
    rectMode(CENTER);
    fill(end);
    push();
    fill(255);
    textSize(40);
    text(age,50,50);
    text(day,50,100);
    text(discount,50,150);
    pop();
    rect(pos.x,pos.y,r,r*2/3);
  }
}
