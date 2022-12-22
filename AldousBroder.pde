// 1 - start anywhere in the grid you want
// 2 - choose a random neighbor. Move to that neighbor
// 3 - if it hasn’t previously been visited, link it to the prior cell
// 4 - Repeat until every cell has been visited
//////////////////////////////////////////////////////////////////////
import Direction;
class AldousBroder
{
  
  void On(Grid g)
  {
    g.create_grid();
    g.config_cells();
    
    Cell cell = g.random_cell();
    int unvisited = g.g_size() - 1;
    
    Random rand = new Random();
    int rand_int = rand.nextInt(3);
    Direction rand_d = Direction.Direction to(rand_int);
    
    while(unvisited > 0)
    {
      Cell neighbor = cell.get_neighbor(rand_d);
      
      if (!cell.linked(cell))
      cell.link(cell);
    }

  }
}
