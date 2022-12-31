/////- loop-erased random walk:if the path it is forming happens to intersect
/////- with itself and form a loop, it erases that loop before continuing on
// 1 - choose a point on the grid—any point—and mark it visited
// 2 - choose any unvisited cell in the grid and does one of these loop-erased
//// - random walks until it encounters a visited cell
// 3 - at that point add the path it followed to the maze, marking as visited
//// - each of the cells along that path
// 4 - the process repeats until all the cells in the grid have been visited
/////////////////////////////////////////////////////////////////////////////////

class Wilson
{
  HashMap<Cell, Boolean> visited = new HashMap();
  
  void On(Grid g)
  {
    //grid config
    g.create_grid();
    g.config_cells();
    
    int unvisited = g.g_size() - 1;
    Random rand = new Random();
    Direction[] dirs = new Direction[]{Direction.NORTH,Direction.SOUTH,Direction.EAST, Direction.WEST};
    
    ///creation of first visited cell, neighbor & path initialiation
    Cell start_cell = g.random_cell();
    visited.put(start_cell , true);
    List <Cell> path = new ArrayList();
    
    
    while(unvisited > 0 )
    { // neighbor and start_cell must be equals the first iteration for the while loop to resume
      while(!been_visited(neighbor)) // size of hashmap visited < visited.size()
      {
      Cell current_cell = g.random_cell(); 
      List <Cell> neighbors = current_cell.get_neighbors(dirs);
      int rand_int = rand.nextInt(neighbors.size());
      neighbor = neighbors.get(rand_int); //random neighbor
      for (int i = 0; i < path.size(); i++)
      {
        if (neighbor == path.get(i))
        {
          path.clear();
          break;
        }
      }
      path.add(neighbor);
      current_cell = neighbor;
      }
      
      if(neighbor.links().isEmpty()) // link all visited cells 
      {
        cell.link(neighbor);
        unvisited--;
      }
      
      
    }
  }
  
  boolean been_visited(Cell c)
  {
     if (visited.get(c))
     return true;
     
     else
     return false;
     
  }
}
