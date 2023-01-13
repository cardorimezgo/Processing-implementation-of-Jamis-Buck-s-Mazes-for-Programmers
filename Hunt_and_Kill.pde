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
    //int visited = 0;
    Random ran = new Random();

    while (visited.size() < g.g_size()) 
    {
      Cell neighbor = get_ran_nebr(current_cell);
      for (int i = 0; i < visited.size(); i++)
      { 
        if (visited.get(i)!= neighbor)
        {
        current_cell.link(neighbor);
        current_cell = neighbor;
        }
        else{break;}
      }  
       ///PODRIA NEIGHBOR YA ESTAR VISITADO PERO OTRO DE LOS NEIGHBORS NO ESTAR VISITADO
       /// TENDRIAMOS QUE CHECAR QUE LOS 4 PUNTOS CARDINALES ESTAN OCUPADOS
        for (int r = 0; r < g.rows; r++) //hunt phase cannot find any more unvisited cells
        {
          for (int c = 0; c < g.cols; c++)
          {
            Cell cell = g.visit_cell(r, c);
            if (cell.linked_ran_neighbor(cell).size() > 0 && cell.links().isEmpty())// neighbor linked current cell unlinked
            { 
              int rand_int = ran.nextInt(cell.linked_ran_neighbor(cell).size());
              Cell n = cell.linked_ran_neighbor(cell).get(rand_int);
              cell.link(n);
              current_cell = cell;
              visited++;
              break;
            }
          }
        }
      
    }

    /*
    while (visited < g.g_size()) 
     {
     Cell neighbor = get_ran_nebr(current_cell);
     if (neighbor.links().isEmpty())
     { 
     current_cell.link(neighbor);
     current_cell = neighbor;
     visited++;
     } else 
     { 
     for (int r = 0; r < g.rows; r++) //hunt phase cannot find any more unvisited cells
     {
     for (int c = 0; c < g.cols; c++)
     {
     Cell cell = g.visit_cell(r , c);
     if (cell.linked_ran_neighbor(cell).size() > 0 && cell.links().isEmpty())// neighbor linked current cell unlinked
     { 
     int rand_int = ran.nextInt(cell.linked_ran_neighbor(cell).size());
     Cell n = cell.linked_ran_neighbor(cell).get(rand_int);
     cell.link(n);
     current_cell = cell;
     visited++;
     break;
     }
     }
     }
     }
     }*/
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
