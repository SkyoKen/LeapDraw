public class handDraw {

  private boolean init;
  private ArrayList<PVector> old;
  private PVector old_position;
  private int size;

  private LeapMotion leap;

  public handDraw(LeapMotion leap) {

    this.init = true;   
    this.old = new ArrayList<PVector>();
    this.old_position = new PVector(0, 0, 0);
    this.size=0;

    this.leap=leap;
  }

  public void hdraw() {

    //手を数える
    this.size=this.leap.getHands().size();

    if ( this.size== 0) {
      this.init = true;
    } else if (this.size>=2) {
      background(bg);
    }

    PVector hand_position=new PVector(0, 0, 0);

    for (Hand hand : this.leap.getHands ()) {

      //右手じゃなければ、return
      if (!hand.isRight()) return;

      //手の座標を取る
      hand_position   = hand.getPosition();


      if (this.init) {

        this.old_position = hand_position;
        this.old.clear();
        for (int i=0; i < 3; i++) old.add(this.old_position);
        this.init = false;
      }

      stroke(0);
      strokeWeight(abs(hand_position.z - old_position.z));

      curve (
        this.old.get(0).x, this.old.get(0).y, 
        this.old.get(1).x, this.old.get(1).y, 
        this.old.get(2).x, this.old.get(2).y, 
        hand_position.x, hand_position.y
        );

      this.old_position = hand_position;
      this.old.remove(0);
      this.old.add(this.old_position);
    }
  }
}
