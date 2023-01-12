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
    //List<Cell> visited = new ArrayList<Cell>();
    Cell start_cell = g.random_cell();
    Cell neighbor = get_ran_nebr(start_cell); 
    int visited = 0;
    Random ran = new Random();
    
    while (visited < g.g_size()) //hunt phase cannot find any more unvisited cells
    {  
      if (neighbor.links().isEmpty())
      {
        start_cell.link(neighbor);
        start_cell = neighbor;
        visited++;
      } else 
      {
        for (int r = 0; r < g.rows; r++)
        {
          for (int c = 0; c < g.cols; c++)
          {
            Cell cell = g.visit_cell(r, c);
            if (cell.linked_ran_neighbor(cell).size() > 0 && cell.links().isEmpty())// neighbor linked current cell unlinked
            {
              int rand_int = ran.nextInt(cell.linked_ran_neighbor(cell).size());
              Cell n = cell.linked_ran_neighbor(cell).get(rand_int);
              cell.link(n);
              ///////////// SUSTITUTE NEIGHBOR 
              break;
            }
          }
        }
      }
    }
  }

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
