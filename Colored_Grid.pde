class Colored_Grid extends Grid
{
  
  Colored_Grid(int _rows, int _cols)
  {
    super(_rows, _cols);
    
  }

  void display_Maze()
  {
    Dijkstra d= new Dijkstra();  

    for (int r = 0; r < g.rows; r++)
    {
      for (int c = 0; c < g.cols; c++)
      {  
        Cell cell = g.visit_cell(r, c);

        float x1 = cent + (cell.row * cell_size); 
        float y1 = cent + (cell.col * cell_size);
        
        int dist = d.distance(cell);        
        fill(dist*4  , dist*5 , dist*2);
        
        rect(x1, y1, cell_size, cell_size);stroke(0);
      }
    }
  }
  
}
