int maze_l = 8;
int maze_w = 8;
int cell_size= 50;
float cent = width / 0.5;
PFont f;
Grid g = new Grid(maze_l, maze_w);

BinaryTree bt= new BinaryTree();
Sidewinder sw= new Sidewinder();


void setup()
{
  size(800, 800); 
  background(255, 255, 255);
  strokeWeight(7); //maze line thickness

  f = createFont("Arial", 20, true);  
  fill(0, 0, 0);
  textFont(f);

  //bt.On(g); // Binary Tree Maze
  sw.On(g); //Sidewinder Maze
  display_Maze();
}

void draw()
{
  
}

void display_Maze()
{
  Cell root = g.visit_each_cell(0,0); // Cell (0,0) as start of maze
  for (int r = 0; r < g.rows; r++)
  {
    for (int c = 0; c < g.cols; c++)
    {  
      Cell cell = g.visit_each_cell(r, c);

      float x1 = cent + (cell.row * cell_size); 
      float y1 = cent + (cell.col * cell_size);
      float x2 = cent + ((cell.row + 1) * cell_size);
      float y2 = cent + ((cell.col + 1) * cell_size);

      if (cell.linked(Direction.NORTH) == false)
      {
        line(x1, y1, x2, y1);
      }
      if (cell.linked(Direction.WEST) == false)
      {
        line(x1, y1, x1, y2);
      }
      if (cell.linked(Direction.EAST) == false)
      {
        line(x2, y1, x2, y2);
      }
      if (cell.linked(Direction.SOUTH) == false)
      {
        line(x1, y2, x2, y2);
      }
      text(root.distances().cells.get(cell),(x1+x2)/2, (y1+y2)/2); //draw Dijkstra's distance numbers
    }
  }
  
}
