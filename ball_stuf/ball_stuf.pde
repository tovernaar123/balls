import controlP5.*;

ArrayList <partical> particals = new ArrayList<partical>();
int deaths;
int imunity = 25;
public PImage balls [] = new PImage[11];
public PImage back;
public boolean health_on = false;
public boolean attraction_on = false;
public boolean friction_on = false;
public boolean gravity_on = false;
public boolean colorchange_on = false;
public boolean coolision_friction_on = false;
public boolean ball_is_image = false;
public boolean on_button = false;
public float G  = 1;
public float lastSpeed = 1;
String bools[] = {
"health_on",  
"friction_on", 
"gravity_on",
"colorchange_on",
"ball_is_image",
"coolision_friction_on",
"attraction_on",
};
ControlP5 mainc;  
Button b[] = new Button[7];
Slider sp;
void setup() {
  int xsize = 100;
  int ysize = 100;
  mainc = new ControlP5(this); 
  for(int i =0; i < b.length; i++) {
  b[i] = mainc.addButton(bools[i]) 
  .setPosition(width-100,height-100-(i*ysize))
  .setSwitch(true)
  .setSize(xsize,ysize);
  }
  sp = mainc.addSlider("temp")
  .setPosition(width-102,height-100-(b.length*ysize))
  .setSize(100,45)
  .setRange(1,100);
  ;
  
  frameRate(30);
  fullScreen();
  back = loadImage("photo.jpg");
  back.resize(width, height);
  for (int i =0; i < balls.length; i++) {
    balls[i] = loadImage("Ball"+i+".png");
  }
  for (int i =0; i < 2; i++) {
    particals.add(new partical());
  }
}


void draw() {

  background(0);
  if(!display) {
  mainc.hide();
  }else {
   mainc.show(); 
  }
  for (int i =0; i < particals.size(); i++) {
    partical part = particals.get(i);

    //gravity
    if (gravity_on == true) {
      PVector gravity = new PVector(0, 1);
      gravity.mult(part.mass);
      part.force(gravity);
    }

    //friction
    if (friction_on == true ) {
      PVector friction = part.speed.copy();
      friction.normalize();
      float amount = -0.0005;
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
        part.hit = true;
      }
    }
    
    for (int p =0; p < particals.size(); p++) {
      if (part.hit(p) && p != i  ) {
        part.ifhit(p);
      }
      else if (p != i && attraction_on) {
      if(!part.hit) {
      partical part2 = particals.get(p);
      PVector posr1 = new PVector(part2.pos.x+part2.r,part2.pos.y+part2.r);
      PVector posr2 = new PVector(part.pos.x+part.r,part.pos.y+part.r);
      PVector atraction1 = PVector.sub(posr1,posr2);
      float dist = atraction1.mag();
      dist = map(dist,0, sqrt(width*width+height*height),500,2000);
      atraction1.normalize();
      atraction1.mult((G * part.mass * part2.mass) / dist * dist );
      part.force(atraction1);
      }else  {
      part.hit = false; 
        
      }
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


public void  controlEvent(ControlEvent event) {
on_button  = true;
}
public void colorchange_on(boolean x) {
if(!x) {
for(int i =0; i < particals.size(); i++) {
    partical part = particals.get(i);
    part.c =#0000ff;
     part.ci =0;
   }  
  
}
colorchange_on = x;  
}
public void temp(float x) {
for(int i =0; i < particals.size(); i++) {
 partical part = particals.get(i);
 part.speed.div(map(lastSpeed,1,100,1,10));
 float x2 = map(x,1,100,1,10);

 part.speed.mult(x2);
}
lastSpeed = x;
  
}
