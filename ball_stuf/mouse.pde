//void mouseDragged() {
//if(!on_button) {
//particals.add(new partical());
//partical part = particals.get(particals.size()-1);
//part.pos.x = mouseX;
//part.pos.y = mouseY;
//part.speed.mult(map(lastSpeed,1,100,1,5));
//}
  
//}
void mousePressed() {
if(!on_button) {
particals.add(new partical());
partical part = particals.get(particals.size()-1);
part.pos.x = mouseX;
part.pos.y = mouseY;
part.speed.mult(map(lastSpeed,1,100,1,5));
}
on_button  = false;
  
}
