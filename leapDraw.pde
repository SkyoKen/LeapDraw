import de.voidplus.leapmotion.*;


color bg = 125; 
LeapMotion leap;
handDraw hd;

void setup() {
  
  size(800, 500);
  background(bg);
  leap = new LeapMotion(this);
  hd=new handDraw(leap);
  strokeWeight(1);
  stroke(0);
  noFill();
  
}

void draw() {
  hd.hdraw();
}
void leapOnInit() {
  println("Leap Motion Init");
}
void leapOnConnect() {
  println("Leap Motion Connect");
}
void leapOnDisconnect() {
  println("Leap Motion Disconnect");
}
void leapOnExit() {
  println("Leap Motion Exit");
}
