class Polar_Grid extends Grid
{
  Polar_Grid(int rows) 
  {
    super(rows, 1);
  }

  void create_grid()
  {
    Polar_Cell[][] cell_rows = new Polar_Cell[rows][];
    Polar_Cell origine = new Polar_Cell(0, 0);
    cell_rows[0] = new Polar_Cell[]{origine};
    float row_height = 1.0f / rows;

    for (int i = 1; i < rows; i++)
    {
      float rad = (float)i /rows;
      float circum = 2 * (float)PI * rad;
      int prev_cnt = cell_rows[i - 1].length;
      float estimated_cell_width = circum / prev_cnt;
      int ratio = Math.round(estimated_cell_width / row_height);
      int cells = prev_cnt * ratio;
      Polar_Cell[] in_cell = new Polar_Cell[cells];

      for (int j = 0; j < cells; j++)
      {
        in_cell[j] = new Polar_Cell(i, j);
      }
      cell_rows[i] = in_cell;
    }
  }
  
  void configure_cells()
  {
    
  }

  void draw_polar_grid()
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

    for (int j = 0; j < maze_rad - margin; j ++) //Modify maze radius 
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
