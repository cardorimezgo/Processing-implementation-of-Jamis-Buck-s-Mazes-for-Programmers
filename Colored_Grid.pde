class Colored_Grid extends Grid
{
  Colored_Grid(int _rows, int _cols)
  {
    super(_rows, _cols);
  }

  void color_flood(int count)
  {
    Cell root = g.visit_cell(0, 0);
    HashMap dist = root.distances().cells;
    HashMap dist_sorted = sortByValue(dist);
    Iterator dist_itera = dist_sorted.entrySet().iterator();
    
    for (int i = 0; i < count; i++)
    {
      Map.Entry map_d = (Map.Entry)dist_itera.next();
      int val = (int)map_d.getValue();
      Cell cell = (Cell)map_d.getKey();
      float x_coord = cent + (cell.row * cell_size);
      float y_coord = cent + (cell.col * cell_size);

      fill(val*2, val*3, val*2);
      rect(x_coord, y_coord, cell_size, cell_size);
    }
  }

  HashMap<Cell, Integer> sortByValue(HashMap<Cell, Integer> sort)
  {
    List<Map.Entry<Cell, Integer>> list =
      new LinkedList<Map.Entry<Cell, Integer>>(sort.entrySet());

    Collections.sort(list, new Comparator<Map.Entry<Cell, Integer>>() {
      public int compare(Map.Entry<Cell, Integer> o1, 
        Map.Entry<Cell, Integer> o2)
      {
        return (o1.getValue()).compareTo(o2.getValue());
      }
    }
    );
    HashMap<Cell, Integer> temp = new LinkedHashMap<Cell, Integer>();
    for (Map.Entry<Cell, Integer> aa : list)
    {
      temp.put(aa.getKey(), aa.getValue());
    }
    return temp;
  }
}
