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
    //grid config
    g.create_grid();
    g.config_cells();  

    Cell current_cell = g.random_cell();
    List<Cell> visited = new ArrayList<Cell>();
    visited.add(current_cell);
    Random ran = new Random();
    Cell neighbor = get_ran_nebr(current_cell);

    while (visited.size() < g.g_size())  
    { //println(visited.size());
      println(check_nsew(current_cell, visited).size());
      if (check_nsew(current_cell, visited).size() == 0) //all surrounding cells visited
      {
        for (int r = 0; r < g.rows; r++) //hunt phase
        {
          for (int c = 0; c < g.cols; c++)
          {
            Cell cell = g.visit_cell(r, c);
            if (check_nsew(cell, visited).size() != 0 ) 
            { 
              visited.add(cell);
              int rand_int = ran.nextInt(check_nsew(cell, visited).size());
              Cell n = check_nsew(cell, visited).get(rand_int); 
              cell.link(n);
              visited.add(n);
              current_cell = n;
              break;
            }
          }
        }
      } else
      {
        for (int i = 0; i < visited.size(); i++)
        { 
          if (visited.get(i)!= neighbor)
          {
            current_cell.link(neighbor);
            current_cell = neighbor;
            visited.add(neighbor);
            neighbor = get_ran_nebr(current_cell);
            break;
          }
        }
      }
    }
  }
}

//check for not_visited neighbors 
List<Cell> check_nsew(Cell c, List <Cell> v)
{  
  Direction[] dirs = new Direction[]{Direction.SOUTH, Direction.EAST, Direction.WEST, Direction.NORTH};
  List <Cell> nsew = c.get_neighbors(dirs); 
  List <Cell> not_visited = new ArrayList<Cell>(); 

  for (int i = 0; i < nsew.size(); i++)
  { 
    int cnt = 0;
    for ( int j = 0; j < v.size(); j++)
    {
      if (nsew.get(i) != v.get(j))
      {
        cnt++;
      }
    }
    if (cnt == v.size())
    {
      not_visited.add(nsew.get(i));
    }
  }
  return not_visited;
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
