int pointSize = 4;
float x;
float y;
float noiseScale = 0.015;
int z = 1;

void setup() {
  int width = 1000;
  int height = 700;
  size(1000, 700);
  
  noFill();
  blendMode(BLEND);
  background(255,255,255);
  //background(1,1,1);
  colorMode(HSB, 100);
  noStroke();
  x= -400;
  y =-400;
  frameRate(60);
}

void draw(){   
  drawCirclePoints( x,y, z, (6*z));
  z=z+6;
  //if(z> 500)
 //save("circlesWavy"+z+".jpg");  //save frames
}

void keyPressed(){
  save("circlesWavy"+z+".jpg");
}

void drawCirclePoints(float centerX, float centerY, int radius, float numPoints){
      fill(0, 0, 00, 70);
      float radianUnit = (2* PI)/ numPoints;
      for(int i = 0; i< numPoints; i++){
        float t = radianUnit * i;
        float x = radius * cos(t)+ centerX;
        float y = radius * sin(t)+centerY;
        float noiseVal = noise(x*.0015, y*.0015);
        ellipse(x, y*noiseVal, pointSize, pointSize);
      }  
}