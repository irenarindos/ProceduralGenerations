import java.util.Collections;

int width; 
int height;
int randW, randH;
int stripWidth = 2;
ArrayList<Integer> ys = new ArrayList<Integer>();
ArrayList<Integer> xs = new ArrayList<Integer>();

void setup() {
  width = 1600;
  height = 1200;
  size(1000, 700);
  
  noFill();
  blendMode(BLEND);
  background(255,255,255);
  stroke(0);

  //Range for random width and height divisions
  randW = (int) random(1, 22);
  randH = (int) random(1,22);
}

void draw(){
  fill(0,0,0); 
  
  //Generate the black grid
  for(int i= 0; i< randW; i++)
    drawWidthStrips();

  for(int i= 0; i< randH; i++)
    drawHeightStrips(); 

  //Color in grid cells
  handleIntersections();
  noLoop();
}

//Draw width strips and save yvals
void drawWidthStrips(){
    int yLoc = (int) random(0,height);
    rect(00, yLoc, width, stripWidth);  
    ys.add(new Integer(yLoc));
}

//Draw height strips and save xvals
void drawHeightStrips(){
    int xLoc = (int) random(0, width);
    rect(xLoc, 0, stripWidth, height);  
    xs.add(new Integer(xLoc));
}

//Using the h and w lists, figure out the cells
void handleIntersections(){
  Collections.sort(ys);
  Collections.sort(xs);
  
  int priorY = 0;
  int priorX =0;

  //Iterate over the cells, "color" them in
  for (int i = 0; i < ys.size(); i++) {
    Integer p = ys.get(i);
    priorX = 0;
      for (int j = 0; j < xs.size(); j++) {
        Integer o = xs.get(j);
          int w= o.intValue() - priorX;
          int h = p.intValue() - priorY; 

          manageColor();
          rect(priorX, priorY, w, h);
          
          priorX = o.intValue()+ stripWidth;
         
      }
      priorY = p.intValue()+ stripWidth;
  }
}

//Return random color from red, white, blue, black
void manageColor(){
  int result  = (int) random(1,10);
  switch(result){
  case 1: fill(255,0,0);//red
      break;
  case 2: fill(255,255,0);//yellow
        break;
  case 3:fill(0,0,0);//black
          break;
  case 4:fill(0,0,255);//blue
          break;
  default: fill(255,255,255);//white
        break;
  }
}

//Save current image
void keyPressed(){
  save("mondrian.jpg");  
}