class Distances
{
  HashMap <Cell, Integer> cells;
  Cell root;

  Distances(Cell root)
  {  
    this.root = root;
    cells = new HashMap();
    cells.put(root, 0); //Integer.valueOf(0)
  }

  void add_d(Cell cell, int dist)
  {
    if (isKnown(cell))
    {
      throw new IllegalArgumentException("not added");
    }
    if (dist == 0)
    {
      root = cell;
    }
    cells.put(cell, Integer.valueOf(dist));
  }

  int get_dist(Cell cell) //query distance of a given cell
  {
    if (! cells.containsKey(cell))
    {
      return -1;
    }
    return cells.get(cell).intValue();
  }

  void set_dist(Cell cell, int dist) //recording distance for a given cell
  {
    cells.put(cell, dist);
  }

  boolean isKnown(Cell cell)
  {
    return cells.containsKey(cell);
  }

  Set cells() //get the list of all of the cells that are present
  {
    return cells.keySet();
  }

  Distances path_to(Cell goal)
  {
    Cell current = goal;
    Distances breadcrumbs = new Distances(root);
    breadcrumbs.cells.put(current , cells.get(current));
    
    while(current != root)
    {
      for(Cell neighbor : current.links())
      {
        if(cells.get(neighbor) < cells.get(current))
        {
          breadcrumbs.cells.put(neighbor , cells.get(neighbor));
          current = neighbor;
        }
      }
    }
    return breadcrumbs;
  }

  @Override
    String toString()
  {
    return "??"+cells.keySet();
  }
}
