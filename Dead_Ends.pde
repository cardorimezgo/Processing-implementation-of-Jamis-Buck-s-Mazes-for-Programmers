// run each algo x num times
// accumulate num of dead_ends per algo
// report average of dead_ends 
class Dead_Ends
{
  void run ()
  {
    List <Cell[][]> a = new ArrayList <Cell[][]> ();
    a.add(bt.On());
    a.add(sw.On());
    a.add(ab.On());
    a.add(w.On());
    a.add(hk.On());

    int runs = 3;

    for (int i = 0; i < a.size(); i++)
    { 
      int p_h_cnt = 0;
      for (int j = 0; j < runs; j++)
      {
        Cell[][] current = a.get(i);
        p_h_cnt += dead_ends();
      }
      int avg = p_h_cnt / runs;
      println("algo:"+""+a.get(i)+" "+"avg:"+""+avg);
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
