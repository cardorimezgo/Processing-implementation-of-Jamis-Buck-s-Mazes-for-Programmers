// run each algo x num times
// accumulate num of dead_ends per algo
// report average of dead_ends 
class Dead_Ends
{
  void run ()
  {
    Maze_Algo maze_al =  new Maze_Algo();
    List <Object> algos = maze_al.GetList();
    BinaryTree bt = new BinaryTree();
    int runs = 3;
    
    for (int i = 0; i < algos.size(); i++)
    { 
      int p_h_cnt = 0;
      for (int j = 0; j < runs; j++)
      {
        algos.get(i); // NO SIRVE DE NADA
        p_h_cnt += dead_ends();
      }
      int avg = p_h_cnt / runs;
      println("algo:"+""+algos.get(i)+" "+"avg:"+""+avg);
    }
  }
  
  int dead_ends()
  {
    int cnt = 0;
    for (int r = 0; r < g.rows; r++)
    {
      for (int c = 0; c < g.cols; c++)
      {
        Cell cell = g.matrix[r][c];
        if (cell.links().size() == 1)
        {
          cnt++;
        }
      }
    }
    return cnt;
  }
}
