class partical {
  float r = random(5,25);
  PVector speed = new PVector(random(-10,10),random(-10,10) );
  PVector pos   = new PVector(random(r+speed.x,width-r-speed.x),random(r+speed.y,height-r-speed.y)); 
  PVector acc   = new PVector(0,0);
  int health = 50;
  String f;
  float mass = r*r * PI*1;
  color c = #0000ff; 
  int frames_alive;
 void force(PVector force) {
   PVector f = PVector.div(force,mass);
   acc.add(f);
  
 }
  void update() {
  speed.add(acc);
  pos.add(speed);
  acc.mult(0);

  
  }
  
  void display() {
  frames_alive++;
  
  if ( pos.y+r+speed.y > height || pos.y-r+speed.y < 0 ) {
     if(pos.y+r+speed.y > height) {
     pos.y = height-r-speed.y;
     } else {
     pos.y = 0+r+speed.y; 
       
     }
     speed.y *= - 1;
  }
  
  if ( pos.x+r+speed.x  > width || pos.x-r+speed.x   <0) {
    
     
     if(pos.x+r+speed.x > width) {
     pos.x = width-r-speed.x;
     }else {
     pos.x = 0+r+speed.x;  
       
     }
      speed.x *= -1;
  }
  
 
  if(ball_is_image){
  imageMode(CENTER);
  image(ball,pos.x,pos.y,r*2,r*2);
  }else {
   ellipseMode(RADIUS);
   fill(c);
   ellipse(pos.x,pos.y,r,r); 
  }
  if(health_on) {
  fill(0 );
  f = str(health);
  textSize(r);
  text(health,pos.x-textWidth(f)/2,pos.y);  
  fill(255); 
  }


  }

 boolean hit(int other) {
 float d;

 partical p = particals.get(other);
 pos.add(speed);
 p.pos.add(speed); 
 d = p.pos.dist(pos);
 pos.sub(speed);
 p.pos.sub(speed);
 if(d < r + p.r ) {
   return true;
   
 } else {
   return false;
   
 }
 
}



void phis(int other) {
  
partical p = particals.get(other);
float speeddifx = speed.x - p.speed.x;
float speeddify = speed.y - p.speed.y;

float posdifx   = pos.x - p.pos.x;
float posdify   = pos.y - p.pos.y;
if(speeddifx * posdifx  + speeddify * posdify <= 0) {
float angle = angle(pos,p.pos); 

float m1 = mass;
float m2 = p.mass;

PVector u1 = speed.rotate(angle);
PVector u2 = p.speed.rotate(angle);

PVector speednew1 = new PVector((u1.x * (m1 - m2) + 2 * u2.x * m2) / (m1+m2), u1.y);
PVector speednew2 = new PVector((u2.x * (m2 - m1) + u1.x * 2 * m1) / (m1+m2), u2.y);

speednew1.rotate(-angle);
speednew2.rotate(-angle);
speed = speednew1;
p.speed = speednew2;
if(coolision_friction_on == true ) {
   PVector friction = p.speed.copy();
   friction.normalize();
   float amount = -0.1;
   float speed = p.speed.mag();
   friction.mult(amount*speed*speed);
   p.force(friction); 
   }
if(coolision_friction_on == true ) {
   PVector friction = speed.copy();
   friction.normalize();
   float amount = -0.1;
   float speed = this.speed.mag();
   friction.mult(amount*speed*speed);
   force(friction); 
   }
}

}








float angle(PVector a, PVector b) {
return -atan2(a.y -b.y , a.x - b.x );
}

  
  

}
