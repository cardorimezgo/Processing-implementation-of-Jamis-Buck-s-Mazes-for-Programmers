// Reference: https://github.com/verhagen/mazes-for-programmers/blob/1310dd9659a984175c4d4db1eaaec179d0479078/src/main/java/com/github/verhagen/mazes4p/core/Grid.java#L22
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
        matrix[i][j]= new Cell(i,j);
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
        cell.put(Direction.NORTH, bound_cell(r , c - 1)); //assign NORTH to method from Cell class
        cell.put(Direction.SOUTH, bound_cell(r , c + 1)); //assign SOUTH to method from Cell class
        cell.put(Direction.EAST, bound_cell(r + 1 , c));  //assign EAST to method from Cell class
        cell.put(Direction.WEST, bound_cell(r - 1 , c));  //assign WEST to method from Cell class
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
  
  
  Cell visit_each_cell(int r , int c)
  {
    Cell cell = matrix[r][c];
    return cell;
  }
}              
