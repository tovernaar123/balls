ArrayList <partical> particals = new ArrayList<partical>();
int frames =0;
public boolean health_on = false;
public boolean friction_on = false;
public boolean gravity_on = false;
void setup() {
  fullScreen();

  for(int i =0; i < 10; i++) {
    particals.add(new partical());
    }

  
}
void draw() {
 frames +=1;
 background(0);
  for(int i =0; i < particals.size(); i++) {
  partical part = particals.get(i);
  if(part.health <= 0 && health_on) {
    particals.remove(i);
  }
  part.display();
  
  for(int p =0; p < particals.size(); p++) {
  partical partp = particals.get(p);
  if(part.hit(p) && p != i  ){
    part.phis(p);
    
    if(health_on) {
    partp.health -=1;
    part.health -=1;
    
    }
  }
  
     
  }
 
  part.update();
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
   PVector friction = p.speed.get();
   friction.normalize();
   float amount = -0.001;
   float speed = p.speed.mag();
   friction.mult(amount*speed*speed);
   p.force(friction); 
   }
 }
}
 
   
     
  
 
