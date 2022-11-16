Grid g = new Grid(8 , 8);
int cell_size= 50;
int cent = 100;

BinaryTree bt= new BinaryTree();
Sidewinder sw= new Sidewinder();

void setup()
{
  size(800,800); 
  background(255,255,255);
  //bt.On(g); // Binary Tree Maze
  sw.On(g); //Sidewinder Maze
  
}

void draw()
{
  display_Maze();
}

 void display_Maze()
 {
   for (int r = 0; r < g.rows; r++)
    {
      for (int c = 0; c < g.cols; c++)
      {  
         Cell cell = g.visit_each_cell(r,c);
         float x1 = cent + (cell.row * cell_size); 
         float y1 = cent + (cell.col * cell_size);
         float x2 = cent + ((cell.row + 1) * cell_size);
         float y2 = cent + ((cell.col + 1) * cell_size);
         
         if(cell.linked(Direction.NORTH) == false)
         {
           line(x1, y1, x2, y1);
         }
         if(cell.linked(Direction.WEST) == false)
         {
           line(x1, y1, x1, y2);    
         }
         if(cell.linked(Direction.EAST) == false)
         {
           line(x2, y1, x2, y2);         
         }
         if(cell.linked(Direction.SOUTH) == false)
         {
           line(x1, y2, x2, y2);
         }
      } 
    } 
 }
