ArrayList <partical> particals = new ArrayList<partical>();
int frames =0;
int deaths;
int imunity = 25;
public PImage ball;
PVector speed_total = new PVector(0,0);
public boolean health_on = false;
public boolean friction_on = true;
public boolean gravity_on = false;
public boolean colorchange_on = true;
public boolean coolision_friction_on = false;
public boolean ball_is_image = true;
void setup() {
  fullScreen();
  ball = loadImage("Ball.png");
  for(int i =0; i < 1; i++) {
    particals.add(new partical());
    }

  
}
void draw() {
 frames +=1;
 background(0);
  for(int i =0; i < particals.size(); i++) {
    partical part = particals.get(i);
   //PVector speed_copy  = part.speed.copy();
   //speed_copy.set(abs(speed_copy.x),abs(speed_copy.y));
   //speed_total.add(speed_copy);
  if(part.health <= 0 && health_on) {
    particals.remove(i);
    deaths ++;
  }
  part.display();
  
  for(int p =0; p < particals.size(); p++) {
 
  partical partp = particals.get(p);
  
  if(part.hit(p) && p != i  ){
    part.phis(p);
    if(colorchange_on) {
    part.c = ranc();
    partp.c = ranc();
    }
    if(health_on) {
    //imunity
    if(partp.frames_alive > imunity) {
      partp.health -=1;
    }
    
    if(part.frames_alive > imunity) {
    part.health -=1;
    }
    
    }
  }
  
     
  }
 
  part.update();
  }
  //println(speed_total.x+ speed_total.y);
  //speed_total.set(0,0);
  if(health_on) {
  fill(255);
  textSize(100);
  text(deaths,0,100);
  }
  for(partical p : particals) {
   //gravity
   if(gravity_on == true) {
   PVector gravity = new PVector(0,0.3);
   gravity.mult(p.mass);
   p.force(gravity); 
   }
   
   //friction
   if(friction_on == true ) {
   PVector friction = p.speed.copy();
   friction.normalize();
   float amount = -0.01;
   float speed = p.speed.mag();
   friction.mult(amount*speed*speed);
   p.force(friction); 
   }
 }
}
color ranc() {
 return color(  random(0,255) , random(0,255) , random(0,255) ); 
  
  
  
}  
   
     
  
 
