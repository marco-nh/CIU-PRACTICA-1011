PShader shader;
float despz;
float w, h, rotX = 0;

int vel = 2;
void setup() {
  size(640, 360, P3D);
  noStroke();
  w = min(height, width) * .9;
  h = min(width, height) * .9; 
  smooth(4);
  shader = loadShader("shader.glsl");
}

void draw() {
  
   tint(#ffffff, 0.5);
  background(20);   
  colorMode(HSB, 255);
  pointLight(255, 128, 12.5, width / 2 + sin(despz), height / 2 + sin(despz), 0);
  rotX += .05;
  blendMode(ADD );

  
  for (float i = 50; i < 50 * 30.5; i+= 10){
    pushMatrix();
   
    translate(width/2-100,height/2,despz);
   
    box(i);
    popMatrix();
    pushMatrix();
   
    translate(width/2+100,height/2,despz);
   
    box(i);
    popMatrix();
    pushMatrix();
   
    translate(width/2,height/2+100,despz);
   
    box(i);
    popMatrix();
  }
  
  filter(shader); 
  shader.set("u_time", float(millis())/float(1000));
  shader.set("resolution", width, height);
  if(despz < -2000){
    vel *= -1;
  } else if (despz > 0){
    vel *= -1;
  }
  despz-= vel;
}

void mousePressed(){
  if(vel >= 10){
    vel = 2;
  }
  vel += 2;
}
