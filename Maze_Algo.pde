class Maze_Algo
{
  BinaryTree bt; 
  Sidewinder sw;
  AldousBroder ab;
  Wilson w;
  Hunt_and_Kill hk; 

  Maze_Algo()
  {
    bt = new BinaryTree();
    sw = new Sidewinder();
    ab = new AldousBroder();
    w = new Wilson();
    hk = new Hunt_and_Kill();
  }

  List <Object> algo_list()
  {
    List <Object> algo_l = new ArrayList<Object>();
    algo_l.add(bt);
    algo_l.add(sw);
    algo_l.add(ab);
    algo_l.add(w);
    algo_l.add(hk);
    return algo_l;
  }
}
