class Maze_Algo
{
  private List<algoRunner> algoList = new ArrayList<algoRunner>();
  
  public void addAlgo(algoRunner a)
  {
    algoList.add(a);
  }
  
  public void runAlgo()
  {
    for(algoRunner a : algoList)
    {
      a.run();
    }
    algoList.clear();
  }
}
