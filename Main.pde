int maze_l = 20;
int maze_w = 20;
int cell_size= 50;
float cent = width;

Grid g = new Grid(maze_l, maze_w);
BinaryTree bt= new BinaryTree();
Sidewinder sw= new Sidewinder();

void setup()
{
  size(1200, 1200); 
  background(255, 255, 255);
  strokeWeight(7); //maze line thickness

  //bt.On(g); // Binary Tree Maze
  sw.On(g); //Sidewinder Maze
  text_style();
  //g.display_Maze();
}

void draw()
{
}

void text_style()
{
  PFont f;
  f = createFont("Arial", 20, true);  
  fill(0, 0, 0);
  textFont(f);
}
