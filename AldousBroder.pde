// 1 - start anywhere in the grid you want
// 2 - choose a random neighbor. Move to that neighbor
// 3 - if it hasn’t previously been visited, link it to the prior cell
// 4 - Repeat until every cell has been visited
//////////////////////////////////////////////////////////////////////

class AldousBroder
{ 
  
  void On(Grid g)
  {
    g.create_grid();
    g.config_cells();
    
    int unvisited = g.g_size() - 1;
    Random rand = new Random();
    Direction[] dirs = new Direction[]{Direction.NORTH,Direction.SOUTH,Direction.EAST, Direction.WEST};
    Cell cell = g.random_cell();
    
    while(unvisited > 0)
    {
      
      //Direction rand_d = Direction.to(rand_int);
      List<Cell> neighbors = cell.get_neighbors(dirs);
      int rand_int = rand.nextInt(neighbors.size());
      Cell neighbor = neighbors.get(rand_int);
      
      //Cell neighbor = cell.get_neighbor(rand_d);
      //println(neighbors+"----"+rand_d+" "+cell+"___"+cell.get_neighbor(rand_d));
      if(!cell.linked(neighbor))
      //if (cell.get_neighbor(rand_d) != null && !cell.linked(neighbor))
      {
        cell.link(neighbor);
        unvisited--;      
      }
      cell = neighbor;
    }
  }
  
}
