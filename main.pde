PVector[] points = new PVector[8];
PVector[] pp = new PVector[8];
float angle = 0;

void drawFace(int i1, int i2, int i3, int i4, int[] col) {
  PVector p1 = pp[i1];
  PVector p2 = pp[i2];
  PVector p3 = pp[i3];
  PVector p4 = pp[i4];
  fill(col[0], col[1], col[2]);
  strokeWeight(0);
  int value = 0;
  value += (p2.x-p1.x)*(p1.y+p2.y);
  value += (p3.x-p2.x)*(p2.y+p3.y);
  value += (p4.x-p3.x)*(p3.y+p4.y);
  value += (p1.x-p4.x)*(p4.y+p1.y);
  if (value > 0) {
    beginShape();
    vertex(p1.x,p1.y);
    vertex(p2.x,p2.y);
    vertex(p3.x,p3.y);
    vertex(p4.x,p4.y);
    endShape();
  }
}

void setup() {
  size(500, 500);
  background(20);
  points[0] = new PVector(-50,50,50);
  points[1] = new PVector(50,50,50);
  points[2] = new PVector(50,-50,50);
  points[3] = new PVector(-50,-50,50);
  points[4] = new PVector(-50,50,-50);
  points[5] = new PVector(50,50,-50);
  points[6] = new PVector(50,-50,-50);
  points[7] = new PVector(-50,-50,-50);
}




void draw() {
  clear();
  stroke(255);
  strokeWeight(4);
  translate(width/2, height/2);
  scale(1,-1);
  
  float distance = 150;
  float[][] rotationZ = {
  {cos(angle),-sin(angle),0},
  {sin(angle),cos(angle),0},
  {0,0,1}};
  float[][] rotationX = {
  {1,0,0},
  {0,cos(angle),-sin(angle)},
  {0,sin(angle),cos(angle)}};
  float[][] rotationY = {
  {cos(angle),0,sin(angle)},
  {0,1,0},
  {-sin(angle),0,cos(angle)}};
  
  int index = 0;
  for (PVector v:points) {
    PVector rotated = matmul(v, rotationZ);
    rotated = matmul(rotated, rotationX);
    rotated = matmul(rotated, rotationY);
    float z = 100/(distance-rotated.z);
    float[][] project = {{z,0,0},{0,z,0}};
    PVector projected = matmul(rotated, project);
    pp[index] = projected;
    index++;
  }
  
  drawFace(0,1,2,3, new int[] {0,0,250}); //front
  drawFace(4,0,3,7, new int[] {0,0,200}); //left
  drawFace(1,5,6,2, new int[] {0,0,200}); //right
  drawFace(4,5,1,0, new int[] {0,0,150}); //top
  drawFace(3,2,6,7, new int[] {0,0,150}); //bottom
  drawFace(5,4,7,6, new int[] {0,0,250}); //rear
  
  angle += 0.01;
}
