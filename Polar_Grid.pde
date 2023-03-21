void setup()
{
  size(400, 400);
  float cntr_x = width * (0.5);
  float cntr_y = height * (0.5);
  float x = 50;
  int segmnt = 5;
  float theta = (2*PI) / segmnt;
  double hyp = x / Math.cos(theta);
  float y2= (x-cntr_x)+cntr_y;

  line(cntr_x, cntr_y, cntr_x + x, y2);
  line(cntr_x, cntr_y, cntr_x + x, cntr_y);
  arc(50, 55, 50, 50, 0, HALF_PI);
}
