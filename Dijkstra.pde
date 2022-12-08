class Dijkstra
{
  Cell root = g.visit_cell(0, 0); // Cell (0,0) as start of maze
  Cell goal = g.visit_cell(g.rows - 1, g.cols - 1); // maze's End/Goal 

  //Assign distance to each cell from root
  void distance(Cell cell, float x, float y) 
  {
    text(root.distances().cells.get(cell), x, y);
  }
  
  //Shortest Path
  void shortest_path(Cell cell, float x, float y)
  {
    Integer dist_to_goal = root.distances().path_to(goal).cells.get(cell);
    if (dist_to_goal != null )
    {
      text(dist_to_goal, x, y);
    }
  }
  
  //Longest Path
  void longest_path(Cell cell, float x, float y)
  {
    Integer longest_path = root.distances().path_to(root.distances().max_dist()).cells.get(cell);
    if (longest_path != null )
    {
      text(longest_path, x, y);
    }
  }
}
