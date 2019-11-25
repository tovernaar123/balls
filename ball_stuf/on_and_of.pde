public boolean display = true;
void keyPressed() {

if( key == CODED) {
  
  
}else{
if(key == 'G' ||key == 'g') {
  display = !display ;
}

if(key == 'W' ||key == 'w') {
  noLoop();
  particals.removeAll(particals);  
  loop();
}
}
}  
  

  



  
