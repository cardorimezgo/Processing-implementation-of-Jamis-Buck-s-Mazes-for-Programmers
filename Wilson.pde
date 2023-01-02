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

  void On(Grid g)
  {
    //grid config
    g.create_grid();
    g.config_cells();

    int unvisited = g.g_size() - 1;
    Random rand = new Random();
    Direction[] dirs = new Direction[]{Direction.NORTH, Direction.SOUTH, Direction.EAST, Direction.WEST};

    ///creation of first visited cell & path initialiation
    Cell start_cell = g.random_cell();
    HashMap<Cell, Boolean> visited = new HashMap();
    visited.put(start_cell, true);
    List <Cell> path = new ArrayList();
    Iterator visitedIt = visited.entrySet().iterator();

    while (unvisited > 0 )
    {
      Cell current_cell = g.random_cell(); 
      List <Cell> neighbors = current_cell.get_neighbors(dirs);
      int rand_int = rand.nextInt(neighbors.size());
      Cell neighbor = neighbors.get(rand_int); //random neighbor

      for (int j = 0, j < visited.size(); j++)
      {
        Map.Entry map_visit = (Map.Entry)visitedIt.next();
        if (neighbor != (Cell)map_visit)
        {
          for (int i = 0; i < path.size(); i++)
          {
            if (neighbor == path.get(i)) // WILL CONTINUE BEING THE SAME NEIGHBOR??
            {
              path.clear();
              break;
            }
          }
          path.add(neighbor);
          current_cell = neighbor;
        }
        current_cell.link(neighbor); // WE HAVE TO LINK ALL THE CELLS IN THE PATH
      }
      unvisited--;
    }
  }
}
