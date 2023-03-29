 enum Polar_Direction
{
  CW,
  CCW,
  INWARD;

  private static final HashMap<Integer, Polar_Direction>POL_DIR = new HashMap();

  static {  
    POL_DIR.put(0, CW);
    POL_DIR.put(1, CCW);
    POL_DIR.put(2, INWARD);
  }
}
