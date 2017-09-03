int height = 1200;
int width = 800;
int rDepth = 6; //recursiveDepth
int triSize = 400;
int triWidth = triSize/2;

void setup() {
  size(1200, 800);
}
 
void draw() { 
  background(0); //black background
  fill(255,255,255,255);

  for(int i = -(int)triWidth; i <= width+triWidth*3; i+=triSize){
    for(int j = 0; j<=height+triSize; j+=triSize){
      //Draw initial large white triangle
      fill(255,255,255,255);
      triangle(i- (triWidth), j+ (triWidth), 
              i +(triWidth), j+ (triWidth),
              i, j-(triWidth));
      //Recursive overlay of black triangles
      fill(0,0,0);  
      drawTri(i, (j+triWidth), triWidth, rDepth);
    }
  }

  noLoop();
}

void drawTri(int centerX, int centerY, int triH, int recurseDepth){
  int triHeight = triH/2;
  if(recurseDepth <= 0) return;
  triangle(centerX, centerY , centerX + triHeight,centerY- triHeight*2,
        centerX - triHeight, centerY- triHeight*2);
  recurseDepth--;
  //Call for the 3 new tris
  drawTri(centerX-triHeight, centerY, triHeight, recurseDepth);
  drawTri(centerX+triHeight, centerY, triHeight, recurseDepth);
  drawTri(centerX, centerY-(2*triHeight), triHeight, recurseDepth);
}

//Save current image
void keyPressed(){
  save("sierpinskiTriangle.jpg");  
}