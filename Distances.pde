class Distances
{
  HashMap <Cell, Integer> cells ;
  Cell root;

  Distances(Cell root)
  {  
    this.root = root;
    cells = new HashMap();
    cells.put(root, 0); //Integer.valueOf(0)
  }
  
  int get_dist(Cell cell) //query distance of a given cell
  {
    return cells.get(cell);
  }
  
  void set_dist(Cell cell, int dist) //recording distance for a given cell
  {
    cells.put(cell, dist);
  }
  
  Set<Cell> cells() //get the list of all of the cells that are present
  {
    return cells.keySet();
  }
}
