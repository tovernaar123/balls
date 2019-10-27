ArrayList <partical> particals = new ArrayList<partical>();
int deaths;
int imunity = 25;
public PImage balls [] = new PImage[11];
public PImage back;
PVector speed_total = new PVector(0, 0);
public boolean health_on = false;
public boolean friction_on = false;
public boolean gravity_on = true;
public boolean colorchange_on = true;
public boolean coolision_friction_on = false;
public boolean ball_is_image = true;


void setup() {
  frameRate(30);
  fullScreen();
  back = loadImage("photo.jpg");
  back.resize(width, height);
  for (int i =0; i < balls.length; i++) {
    balls[i] = loadImage("Ball"+i+".png");
  }
  for (int i =0; i < 1; i++) {
    particals.add(new partical());
  }
}


void draw() {
  background(back);
  for (int i =0; i < particals.size(); i++) {
    partical part = particals.get(i);

    //gravity
    if (gravity_on == true) {
      PVector gravity = new PVector(0, 0.5);
      gravity.mult(part.mass);
      part.force(gravity);
    }

    //friction
    if (friction_on == true ) {
      PVector friction = part.speed.copy();
      friction.normalize();
      float amount = -1;
      float speed = part.speed.mag();
      friction.mult(amount*speed*speed);
      part.force(friction);
    }
    
    if (part.health <= 0 && health_on) {
      particals.remove(i);
      deaths ++;
    }
    part.display();
    
    for (int p =0; p < particals.size(); p++) {
      if (part.hit(p) && p != i  ) {
        part.ifhit(p);
      }
    }
    part.update();
  }

  if (health_on) {
    fill(255);
    textSize(100);
    text(deaths, 0, 100);
  }
  textSize(100);
  fill(255);
  text(round(frameRate), 100, 100);
}
color ranc() {
  return color(  random(0, 255), random(0, 255), random(0, 255) );
}  
