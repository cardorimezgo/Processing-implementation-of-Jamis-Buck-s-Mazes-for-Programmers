class BinaryTree
{
  void On(Grid grid)
  {
    grid.create_grid();
    grid.config_cells();

    Direction[] dirs = new Direction[]{Direction.SOUTH, Direction.EAST};
    Random random = new Random();
    
    for (int r = 0; r < grid.rows; r++)
    {
      for (int c = 0; c < grid.cols; c++)
      {
        Cell cell = grid.visit_each_cell(r, c);        
        List <Cell> n = cell.get_neighbors(dirs); ///get_neighbors returns a list of cells
        if (n.size() == 0)
        {
          return;
        }
        int neighbor_ran = random.nextInt(n.size()); //neighbors can't be empty
        n.get(neighbor_ran).link(cell);
      }
    }
  }
}
