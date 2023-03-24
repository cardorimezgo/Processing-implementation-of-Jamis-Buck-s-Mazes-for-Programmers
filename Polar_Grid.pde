class Polar_Grid
{
  void draw_t()
  {
    float cntr_x = width * (0.5);
    float cntr_y = height * (0.5);

    int segmnt = 5;
    float theta = 360 / segmnt;
    float theta_rad = theta *(PI/180);
    float ring_height = 50;
    int cell_row = 2;
    float inner_rad = cell_row * ring_height;//short hypotenuse
    float outer_rad = (cell_row + 1) * ring_height; //long hypotenuse

    int seg_num = 0;
    // hypotenuse
    float a_x = cntr_x + (inner_rad * cos(-theta_rad * 1));
    float a_y = cntr_y + (inner_rad * sin(-theta_rad * 1));
    float b_x = cntr_x + (outer_rad * cos(-theta_rad * 1));
    float b_y = cntr_y + (outer_rad * sin(-theta_rad * 1));

    //adjacent side
    float c_x = cntr_x + (inner_rad * cos(theta_rad * seg_num));
    float c_y = cntr_y + (inner_rad * sin(theta_rad * seg_num));
    float d_x = cntr_x + (outer_rad * cos(theta_rad * seg_num));
    float d_y = cntr_y + (outer_rad * sin(theta_rad * seg_num));
    line(a_x, a_y, b_x, b_y); //hypotenuse
    line(c_x, c_y, d_x, d_y); //adjacent side

    float m = (c_y-cntr_y)/(c_x -cntr_x);
    float b = c_y - (m*c_x);
    float eq = (m*c_x) + b;

    noFill();
    arc(cntr_x, cntr_y, a_x, cntr_y-a_y, 0, HALF_PI); //inner arc
    point(cntr_x, cntr_y); //screen cntr
    println(eq);
  }
}
