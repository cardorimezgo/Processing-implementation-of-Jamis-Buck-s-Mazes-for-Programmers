int maze_l = 60;
int maze_w = 60;
int cell_size= 10;
float cent = width;
int count = 0;

Grid g = new Grid(maze_l, maze_w);
BinaryTree bt = new BinaryTree();
Sidewinder sw = new Sidewinder();
Colored_Grid cg = new Colored_Grid(maze_l, maze_w);

void setup()
{
  size(800, 800); 
  background(255, 255, 255);
  /// Algo ////
  bt.On(g); // Binary Tree Maze
  //sw.On(g); //Sidewinder Maze
  ////////////
  g.display_Maze();
  
}
// TEST: we can also change the distribution in space of each cell or size
void draw()
{
  cg.color_flood(count);
  count= count + 5;
}
