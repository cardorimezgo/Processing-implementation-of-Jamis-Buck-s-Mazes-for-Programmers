import java.util.*;

class Grid
{
  int rows, cols;
  Cell[][] matrix;
  Random rand;

  Grid(int _rows, int _cols)
  {
    rows = _rows;
    cols = _cols;
    rand = new Random();
    matrix = new Cell[_rows][_cols];
  }

  void create_grid()
  {
    for (int i = 0; i < rows; i++)
    {  
      for (int j = 0; j < cols; j++)
      {
        matrix[i][j]= new Cell(i, j);
      }
    }
  }

  void config_cells()
  {    
    for (int r = 0; r < rows; r++)
    {
      for (int c = 0; c < cols; c++)
      {
        Cell cell = matrix[r][c];
        cell.put(Direction.NORTH, bound_cell(r, c - 1)); //assign NORTH to method from Cell class
        cell.put(Direction.SOUTH, bound_cell(r, c + 1)); //assign SOUTH to method from Cell class
        cell.put(Direction.EAST, bound_cell(r + 1, c));  //assign EAST to method from Cell class
        cell.put(Direction.WEST, bound_cell(r - 1, c));  //assign WEST to method from Cell class
      }
    }
  }

  Cell bound_cell(int r, int c) //North/East bounds
  {
    if (r < 0 || r > rows - 1 || c < 0 || c > cols -1)
    {
      return null;
    }
    return matrix[r][c];
  }

  Cell random_cell()
  {
    int rand_r = rand.nextInt(rows);
    int rand_c = rand.nextInt(cols);
    return matrix[rand_r][rand_c];
  }

  int g_size()
  {
    return rows * cols;
  }


  Cell visit_cell(int r, int c)
  {
    Cell cell = matrix[r][c];
    return cell;
  }

  void display_Maze(boolean _color)
  {
    Dijkstra d= new Dijkstra();

    for (int r = 0; r < g.rows; r++)
    {
      for (int c = 0; c < g.cols; c++)
      {  
        Cell cell = visit_cell(r, c);

        float x1 = cent + (cell.row * cell_size); 
        float y1 = cent + (cell.col * cell_size);
        float x2 = cent + ((cell.row + 1) * cell_size);
        float y2 = cent + ((cell.col + 1) * cell_size);
        
        if (_color)
        {
          rect(x1, y1, cell_size, cell_size);
        }
        else
        {
        if (cell.linked(Direction.NORTH) == false)
        {
          line(x1, y1, x2, y1);
        }
        if (cell.linked(Direction.WEST) == false)
        {
          line(x1, y1, x1, y2);
        }
        if (cell.linked(Direction.EAST) == false)
        {
          line(x2, y1, x2, y2);
        }
        if (cell.linked(Direction.SOUTH) == false)
        {
          line(x1, y2, x2, y2);
        }
        /// Dijkstra /////////////////////////////
        //d.distance(cell, (x1+x2)/2, (y1+y2)/2);
        //d.shortest_path(cell, (x1+x2)/2, (y1+y2)/2);
        d.longest_path( cell, (x1+x2)/2, (y1+y2)/2);
        //////////////////////////////////////////
        }
      }
    }
  }

  void background_color_for(Cell cell)
  {
  }
}              
