import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;
color c;

int tileCount = 80;
int actRandomSeed = 0;

void setup() {
  size(640, 640);
}


void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  background(255);
  smooth();
  noFill();
  noStroke();

  randomSeed(actRandomSeed);
  
  translate(0, height * random(1.1, 1.4));
  rotate(-PI/2);

  for (int gridY=0; gridY<tileCount; gridY+=2) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      int posX = width/tileCount*gridX;
      int posY = height/tileCount*gridY;

      int toggle = (int) random(0,7);
      
      c = color(posX / 3, gridY, tileCount);
      
      if (toggle == 0 || toggle == 4 || toggle == 7) {
        fill(c);
        rect(posX, posY, posX*2, posY+height/tileCount*2);
      }
    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mousePressed() {
  actRandomSeed = (int) random(100000);
}

void keyReleased(){
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
