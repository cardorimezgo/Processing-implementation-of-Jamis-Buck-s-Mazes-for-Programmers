int maze_l = 60;
int maze_w = 60;
int cell_size= 10;
float cent = width;
int count = 0;

Grid g = new Grid(maze_l, maze_w);

BinaryTree bt = new BinaryTree();
Sidewinder sw = new Sidewinder();
AldousBroder ab = new AldousBroder();
Wilson w = new Wilson();
Hunt_and_Kill hk = new Hunt_and_Kill();

Colored_Grid cg = new Colored_Grid(maze_l, maze_w);
Dead_Ends dead = new Dead_Ends();

void setup()
{
  size(800, 800); 
  background(255, 255, 255);
  /// Algo ////
  //bt.On(); // Binary Tree Maze
  //sw.On(); //Sidewinder Maze
  //ab.On(); // AldousBroder Maze
  //w.On(); // Wilson's Maze
  //hk.On(); // Hunt and kill Maze
  ////////////
  
  dead.run();
  //g.display_Maze();
}

void draw()
{
  //cg.color_flood(count);
  count= count + 10;
}
