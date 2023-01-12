///1 - Pick random cell 
///2 - perform random walk avoiding any cell that we've already visited
///3 - When end up surrounded by visited cell, (hunt phase)scan left to right from 
//// - northwest corner until we encounter an unvisited cell, bordered by at least one
//// - visited cell
///4 - Make it current cell and link to any one of its neighboring visited cells 
///5 - Repeat random walk
///6 - Repeat until hunt phase cannot find any more unvisited cells
/////////////////////////////////////////////////////////////////////////////////////////

class Hunt_and_Kill
{
  void On(Grid g)
  {
    Cell start_cell = g.random_cell();
    //List<Cell> visited = new ArrayList<Cell>();
    int visited = 0;
    
    while (visited < g.g_size()) //hunt phase cannot find any more unvisited cells
    {
      Cell neighbor = get_ran_nebr(start_cell); 
      if(neighbor.links().isEmpty())
      {
        start_cell.link(neighbor);
        visited++;
      }
      else if (!neighbor.links().isEmpty() && ) //search from left-upper corner for unvisted cell with at least one neighbor
      cell = neighbor; ///think WE DOOOO NEED A VISITED LIST
      
    }
   
  }
  //function for checking the occupation of neighboring cells
  /*boolean free_nebrs()
  {
    
  }
  */
  
  Cell get_ran_nebr(Cell c)
  {
    Random rand = new Random();
    Direction[] dirs = new Direction[]{Direction.NORTH, Direction.SOUTH, Direction.EAST, Direction.WEST};
    List <Cell> neighbors = c.get_neighbors(dirs);
    int rand_int = rand.nextInt(neighbors.size());
    Cell neighbor = neighbors.get(rand_int);

    return neighbor;
  }
}
