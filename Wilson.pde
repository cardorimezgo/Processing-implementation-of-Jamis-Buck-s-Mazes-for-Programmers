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

    //univisited cell, creation of neighbor
    Cell current_cell = g.random_cell(); 
    List <Cell> neighbors = current_cell.get_neighbors(dirs);
    int rand_int = rand.nextInt(neighbors.size());
    Cell neighbor = neighbors.get(rand_int); //random neighbor

    while (unvisited > 0 )
    {
      if (!is_visited(visited, neighbor) && !loop_path(path, neighbor))
      {
        //todo:1 - no se ha visitado Y no se ha ciclado ---> continua sumando path
        path.add(neighbor);
        current_cell = neighbor;
        neighbors = current_cell.get_neighbors(dirs);
        neighbor = neighbors.get(rand.nextInt(neighbors.size())); 
        
      } else if (is_visited(visited, neighbor) && !loop_path(path, neighbor))
      {
        //todo:2 - se ha visitado Y no se ha ciclado  ---> cerrar path y conectar celdas
        //link cells in path list
        //mark respective cells as visited
        for(int i = 0; i < path.size(); i++)
        {
          //path.link()
        }
        path.clear();
        current_cell =g.random_cell();
        
      } else if (!is_visited(visited, neighbor) && loop_path(path, neighbor))
      {
        //todo:3 - se ha visitado y se he ciclado    ----> reset path, cambio de neighbor
        path.clear();
      }
      /*
    first:
       for (int j = 0; j < visited.size(); j++) 
       {
       Map.Entry map_visit = (Map.Entry)visitedIt.next();
       if (neighbor != map_visit) //(Cell)
       {
       for (int i = 0; i < path.size(); i++)
       {
       if (neighbor == path.get(i)) 
       {
       path.clear();
       neighbor = neighbors.get(rand_int);
       break first; // get out of the nested loop and get new nrighbor
       }
       path.add(neighbor);
       }
       current_cell = neighbor;
       neighbors = current_cell.get_neighbors(dirs);
       neighbor = neighbors.get(rand.nextInt(neighbors.size()));
       }
       current_cell.link(neighbor); // WE HAVE TO LINK ALL THE CELLS IN THE PATH
       }
       unvisited--;
       */
    }
  }
  /// podemos poner cuatro casos 
  // 1 - no se ha visitado Y no se ha ciclado ---> continua sumando path
  // 2 - se ha visitado Y no se ha ciclado  ---> cerrar path y conectar celdas
  // 3 - se ha visitado y se he ciclado    ----> reset path, cambio de neighbor 
  // 4 - no se ha visitado y se ha ciclado --->  reset path, cambio de neighbor
  // juntar en una 3 y 4

  /// check for match with visited cells
  boolean is_visited(HashMap _visited, Cell _neighbor)
  {
    Iterator visitedIt = _visited.entrySet().iterator();
    for (int j = 0; j < _visited.size(); j++)
    {
      Map.Entry map_visit = (Map.Entry)visitedIt.next();
      if (_neighbor == map_visit) //(Cell)
      {
        return true;
      }
    }
    return false;
  }

  boolean loop_path(List<Cell> _path, Cell _neighbor)
  {
    for (int i = 0; i < _path.size(); i++)
    {
      if (_neighbor == _path.get(i)) 
      {
        return true;
      }
    }
    return false;
  }
}
