import processing.svg.*; //<>//

int maze_l = 3;
int maze_w = 3;
int cell_size= 60;
float cent = width;
int count = 0;

Grid g = new Grid(maze_l, maze_w);

BinaryTree bt = new BinaryTree();
Sidewinder sw = new Sidewinder();
AldousBroder ab = new AldousBroder();
Wilson w = new Wilson();
Hunt_and_Kill hk = new Hunt_and_Kill();

Colored_Grid cg = new Colored_Grid(maze_l, maze_w);
//Dead_Ends dead = new Dead_Ends();
Maze_Algo m_a = new Maze_Algo();

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
  //dead.run();
  
  m_a.GetList().get(0); //calling all the elements in the list
  println(m_a.GetList().size());
  ////////////
  g.display_Maze();

}

void draw()
{
  //cg.color_flood(count);
  count= count + 10;
}
