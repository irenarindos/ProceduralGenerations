int numTrees = 150; //number of trees

void setup() {
  size(1200, 800);
}
 
void draw() {
  /*Black trees on white background
  background(255);
  stroke(0,0,0,120);
  */
  
  //White trees on black background
  background(0);
  stroke(255,255,255,80);
  
  int treeSize;
  float xStep = width/numTrees;
  print(xStep);
  
  //Draw trees from left to right, at varied x location and w/ varied height
  for(int i = 0; i <numTrees; i++){
     int fudgeFactor = (int) random(-20, 20); 
     pushMatrix();
      translate(fudgeFactor + i * xStep, 1.1*height);
      treeSize = (int)random(30,310); 
      strokeWeight(0);
      branch(treeSize);
     popMatrix();
  }
  noLoop();
}

void branch(float len) {
  //Prick random angle for each branch.
  float theta = random(0,PI/4);

  line(0, 0, 0, -len);
  translate(0, -len);
  len *= 0.66;

  //Rotate and draw branches
  if (len > 4) {
    pushMatrix();
     rotate(theta);
     branch(len);
    popMatrix();
    pushMatrix();
     rotate(-theta);
     branch(len);
    popMatrix();
  }
}

//Save current image
void keyPressed(){
  save("lsystem.jpg");  
}