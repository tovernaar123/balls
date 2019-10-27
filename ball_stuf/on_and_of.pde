void keyPressed() {

if( key == CODED) {
  
  
}else{
if(key == 'G' ||key == 'g') {
if ( gravity_on == true ) {
  gravity_on = false; 
} else {
gravity_on = true;  
  
}
  
}
if(key == 'F' ||key == 'f') {
 if(friction_on == true) {
  friction_on = false; 
   
 }else {
 friction_on = true;  
   
 }
}
 
 
if(key == 'B' ||key == 'b') {
 if(ball_is_image == true) {
  ball_is_image = false; 
   
 }else {
 ball_is_image = true;  
   
 }  
  
  
} 
 if(key == 'C' ||key == 'c') {
 if(colorchange_on == true) {
   colorchange_on = false; 
   for(int i =0; i < particals.size(); i++) {
    partical part = particals.get(i);
    part.c =#0000ff;
     part.ci =0;
   }
 }else {
   colorchange_on = true;  
   
 }  
  
  
} 

if(key == 'W' ||key == 'w') {
  particals.removeAll(particals);  
   }
   
   
 }
   
 
  
  
} 
  



  
