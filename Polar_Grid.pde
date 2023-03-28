class Polar_Grid extends Grid
{
  Polar_Grid(int rows, int cols) 
  {
    super(cols, rows);
  }

  void draw_t()
  {
    float cntr_x = width * (0.5);
    float cntr_y = height * (0.5);

    float segmnt = 7; // float instead of int to avoid floating-point rounding errors
    float theta = 360 / segmnt;
    float theta_rad = theta * (PI/180);
    float ring_len = 50;
    int maze_rad = (int)(cntr_x / ring_len); //maze radius
    int cell_row = 0; //num. of first drawn cell, from center -> outwards
    int margin = 1;
    
    for (int j = 0; j < maze_rad - margin ; j ++) //Modify maze radius 
    {
      for (int i = 0; i < segmnt; i++) // generate cells
      {
        float inner_rad = cell_row * ring_len;//short hypotenuse
        float outer_rad = (cell_row + 1) * ring_len; //long hypotenuse

        // hypotenuse 
        float a_x = cntr_x + (inner_rad * cos(-theta_rad * (i + 1)));
        float a_y = cntr_y + (inner_rad * sin(-theta_rad * (i + 1)));
        float b_x = cntr_x + (outer_rad * cos(-theta_rad * (i + 1)));
        float b_y = cntr_y + (outer_rad * sin(-theta_rad * (i + 1)));

        // adjacent side
        float c_x = cntr_x + (inner_rad * cos(theta_rad * i));
        float c_y = cntr_y + (inner_rad * sin(theta_rad * i));
        float d_x = cntr_x + (outer_rad * cos(theta_rad * i));
        float d_y = cntr_y + (outer_rad * sin(theta_rad * i));
        
        // arc drawn cw
        float start_angle = -theta_rad * (i + 1);
        float end_angle = -theta_rad * i;

        line(a_x, a_y, b_x, b_y); //hypotenuse
        line(c_x, c_y, d_x, d_y); //adjacent side

        noFill();
        arc(cntr_x, cntr_y, inner_rad * 2, inner_rad * 2, start_angle, end_angle); //inner arc. inner and outer radius multiplied by 2, to get diameter
        arc(cntr_x, cntr_y, outer_rad * 2, outer_rad * 2, start_angle, end_angle); //outer arc. inner and outer radius multiplied by 2, to get diameter        
      }
      cell_row++;
    }
  }
}
