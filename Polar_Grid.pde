class Polar_Grid
{
  void draw_t()
  {
  float cntr_x = width * (0.5);
  float cntr_y = height * (0.5);
  
  int segmnt = 23;
  float theta = 360 / segmnt;
  float theta_rad = theta *(PI/180);
  float ring_height = 150;
  int cell_row = 3;
  float inner_rad = cell_row * ring_height;//cell.row
  float outer_rad = (cell_row + 1) * ring_height;
  
  
  double hyp = x / cos(theta_rad);
  double y = sin(theta_rad) * hyp;
  
  line(cntr_x, cntr_y, cntr_x + inner_radius * cos, cntr_y - (float)y);
  line(cntr_x, cntr_y, cntr_x + x, cntr_y);
  //arc(50, 55, 50, 50, 0, HALF_PI);
  println(theta+"---"+hyp+"---"+y+"---"+theta_rad);
  
}
}
