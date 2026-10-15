int n = 8;
PFont font;

BTree tree = new BTree();
 
void setup() {
  size(1200, 600);

  font = loadFont("AlBayan-16.vlw");
  textFont(font, 16);
  textAlign(LEFT, CENTER);
  stroke(192, 0, 0);
  newTree();
}

void mousePressed() {
  if(mouseButton == LEFT) {
    if(tree.value == -1) {
      int x=(int)(100.*mouseX/width);
      tree.insert(x);
      fill(255);
      ellipse(32, 32, radius, radius);
      fill(0);
      text(x, 32, 32);
    }  
    else {
      tree.remove(tree.value);
      fill(255);
      ellipse(32, 32, radius, radius);
      fill(0);
      text(tree.value, 32, 32);
    }  
  } 
}

void mouseReleased() {
  drawTree();
}

void mouseMoved() {
  tree.findNode();
  if(tree.value != -1) {
    fill(92);
    ellipse(tree.x, tree.y, radius, radius);
    fill(0);
    text(tree.value, tree.x, tree.y);
  } 
  else drawTree();
}

void keyPressed() {
  if(key=='c') {
    background(200);
    tree.clear();
  }
  else if(key=='v' || key ==' ') { 
    drawTree();
    tree.printTree();
  }  
  else if(key=='b') {  
    newTree();
  }  
  else if(key=='t') {  
    traversal++;
    if(traversal==3) traversal=0;
    drawMode();
  }  
  else if(key=='d') {  
    if(textcolor==0) textcolor=1;
    else textcolor=0;
    drawTree();
  }  
}

void newTree() {
  tree.clear();
  for(int i=0; i<n; i++) 
    tree.insert((int)random(99));
  drawTree();
}

/*
  println("Contains 1: " + tree.contains(1));
  println(tree.root);
  println(tree.insert(1));
  println("Contains 1: " + tree.contains(1));
*/
 
void draw() {
}

void drawMode() {
  int x=20, y=50;
  textFont(font, 24);
  textAlign(LEFT, CENTER);
  noStroke();
  fill(132);
  rect(10, height-y-12, 102, 26);
  fill(0);
  if(traversal==0) text("inorder(t)", x, height-y);
  else if(traversal==1) text("preorder(t)", x, height-y);
  else if(traversal==2) text("postorder(t)", x, height-y);    
  text((int)(100.*mouseX/width)+"  insert", x+100, height-y);
  text("clear tree:c new tree:b draw tree:v or space", x, height-24);
  stroke(192, 0, 0);
  textFont(font, 16);
  textAlign(CENTER, CENTER);
}

void drawTree() {
  background(200);
  tree.assignPosition();
  tree.drawTree();  
  drawMode();
}
