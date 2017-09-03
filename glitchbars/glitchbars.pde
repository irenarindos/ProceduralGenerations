PImage img;
float noiseLev= .0001;
int z;

void setup(){
  size(581, 750);
  background(1,1,1);
  smooth();
  noStroke();
  z = 0;
 
  img = loadImage("bust.jpg");
}

void draw() {
  //Load canvas pixels
  loadPixels(); 

  //Load image pixels
  img.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      
      //Grab the image pixel colors
      color pixelColor= color(red(img.pixels[loc]), green(img.pixels[loc]), blue(img.pixels[loc]));

      // Set the display pixel to the image pixel         
      pixels[loc] = perlinNoise(pixelColor);          
    }
  }
  updatePixels();
 // save("noise"+z+".jpg");  //To save frames for gif creation, etc
  z++;
  noiseLev= noiseLev+.0005;
}

color perlinNoise(color pc){
  float noiseVal = noise(red(pc)*noiseLev, green(pc)*noiseLev, blue(pc)*noiseLev); 
  return color(red(pc)*noiseVal,green(pc)*noiseVal,blue(pc)*noiseVal);
}

//grab random color and smear it for a while
//use CMYK
color cmykSmear(){
 
  return color(1,1,1);
}

color staticDistortion(color pixelColor){  
      color randomColor = color(random(255), random(255), random(255), 255);
      // percentage to mix
      float mixPercentage = .5 + random(10)/100;

      // Set the display pixel to the image pixel
      return lerpColor(pixelColor, randomColor, mixPercentage); 
}

void keyPressed(){
  save("glitchBust.jpg");  
}