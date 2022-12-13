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
        float x2 = cent + ((cell.row + 1) * cell_size);
        float y2 = cent + ((cell.col + 1) * cell_size);
        
        int dist = d.distance(cell);
        fill(255, 0.5*dist , 0.2*dist);
        println(dist);
        rect(x1, y1, cell_size, cell_size);
      }
    }
  }

  /*
   Integer color_dist()
   {
     Cell root = cg.visit_cell(0, 0);
     Integer longest_path = root.distances().path_to(root.distances().max_dist()).cells.get(cell);
     println(root.distances().cells.get(longest_path));
     return root.distances().cells.get(longest_path);
   }
   
  void background_color_for(Cell cell)
  {
    Cell root = g.visit_cell(0, 0);
    float val = root.distances().cells.get(cell);
    println(val);
  }*/
}
