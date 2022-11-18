class Distances
{
  HashMap <Cell, Integer> cells ;
  Cell root;

  Distances(Cell _root)
  {  
    _root = root;
    cells = new HashMap();
    cells.put(root, 0); //Integer.valueOf(0)
  }
  
  int distance(Cell cell)
  {
    return cells.get(cell);
  }
  
  void set_dist(Cell cell, int dist)
  {
    cells.put(cell, dist);
  }
  
  Set<Cell> cells()
  {
    return cells.keySet();
  }
}
