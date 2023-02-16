/// - create stack (list) with push(add) and pop(remove) features
///1 - random start
///2 - push cell onto stack (cell at top of stack = current cell)
///3 - search for unvisited neighbors & choose one at random
///4 - carve path, push cell onto stack 
///5 - continue until dead-end
///6 - pop dead-end cell off the stack (previous cell becomes current cell)
///7 - continue until every cell has been visited
///8 - stack should end empty. backtracking and poping cells until we arrive at origin cell
///////////////////////////////////////////////////////////////////////////////////////////

class Recursive_Backtracker
{

  void On()
  {
    //grid config
    g.create_grid();
    g.config_cells();

    List<Cell> stack = new ArrayList<Cell>();
    stack.add(g.random_cell());
    Cell current_cell = stack.get(stack.size()-1);
    Random ran = new Random();
    Cell neighbor = get_ran_nebr(current_cell);
    
    while(stack.size() != 0)
    {
      not_visit_n(current_cell, stack);
      
      if (not_visit_n(current_cell, stack).size() == 0)//dead-end
      {
        current_cell = stack.get(stack.size()-2);
      }
    }
  }
}
