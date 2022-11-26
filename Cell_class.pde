import java.util.*; //<>// //<>//

class Cell
{
  int row, col;
  int north, south, east, west;
  HashMap<Cell, Boolean> links;
  HashMap<Direction, Cell> neighbors;

  Cell(int row, int col)
  {
    this.row = row;
    this.col = col;
    links  = new HashMap();
    neighbors = new HashMap();
  }

  void link(Cell cell) //connects current cell with cell parameter
  {
    links.put(cell, true);
    cell.links.put(this, true);
  }

  void unlink(Cell cell) //disconnects current cell with cell parameter
  {
    links.remove(cell);
    cell.links.remove(this);
  }

  Set<Cell> links() //Querying list of all cells connected to this cell
  {     
    return links.keySet();
  }

  boolean linked(Cell cell) //querying whether the current cell is linked to another given cell
  {
    return links.containsKey(cell);
  }

  boolean linked(Direction dir)// querying whether current cell is connected in specific direction
  {
    if (! neighbors.containsKey(dir))
    {
      return false;
    }
    Cell cell = neighbors.get(dir);
    return links.containsKey(cell);
  }

  void put(Direction dir, Cell cell)  //allocate direction to a cell
  {
    if (cell == null)
    {
      return;
    }
    neighbors.put(dir, cell);
  }

  Cell get_neighbor(Direction dir) //Gets neighbor in specific direction
  {
    Cell n = neighbors.get(dir);
    return n;
  }

  List<Cell> get_neighbors(Direction... dir) // Query list of cells that adjoin the input direction
  {
    List <Cell> n = new ArrayList <Cell>();
    for (Direction direction : dir)
    {
      if (neighbors.containsKey(direction))
      {
        n.add(neighbors.get(direction));
      }
    }
    return n;
  }


  void distances() //distance between root cell and rest of cells in HashMap
  {
    Distances distances = new Distances(this);
    //HashMap frontier = distances.cells;

    List <Cell> frontier = new ArrayList<Cell>(); //cell(s) that are next to the root
    frontier.add(this); //First frontier, start = 0

    while (!frontier.isEmpty())
    {
      List <Cell> new_frontier = new ArrayList <Cell> ();
      for (Cell c : frontier)
      { 
        //println(c);
        for (Cell c_linked : c.links()) // set of connected cells to frontier
        {
          
          println(c_linked);
          /*if (distances.get_dist(c_linked) == 0)  // CHECK has the cell been visited?
          {
            distances.set_dist(c_linked, +1);
            new_frontier.add(c_linked);
          }*/
        }
        //frontier = new_frontier;
      }
    }
  }

  @Override
    String toString()
  {
    return "("+row+","+col+")"+neighbors.keySet();
  }
}          
