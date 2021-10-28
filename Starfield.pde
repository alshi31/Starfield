Particle[] starfield;
void setup()
{
  background(0);
  size(500, 500);
  starfield = new Particle[300];
  for (int i = 0; i < 5; i++)
  {
    starfield[i] = new OddballParticle();
  }
  for (int i = 5; i < starfield.length; i++)
  {
    starfield[i] = new Particle();
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < starfield.length; i++)
  {
    starfield[i].move();
    starfield[i].show();
  }
}
class Particle
{
  double X, Y, Speed, Angle;
  int Color, Opacity;
  float size;
  Particle()
  {
    X = (int)(Math.random() * 500);
    Y = (int)(Math.random() * 500);
    Speed = (int)(Math.random() * 8 + 1);
    Angle = (int)(Math.random() * 360);
    Color = (int)(Math.random() * 100+156);
    Opacity = (int)(Math.random() * 80 + 90);
    size = (float)(Math.random()* 4 + 5);
  }
  void move() 
  {
    X = X + (Math.cos(Angle) * Speed);
    Y = Y + (Math.sin(Angle) * Speed);
    if (X < 0 || X > 500 || Y < 0 || Y > 500)
    {
      X = (int)(Math.random() * 20) + 240;
      Y = (int)(Math.random() * 20) + 240;
      size = (int)(Math.random()*5+3);
    }
    if (size > 20)
    {
      size = 20;
      Speed = 5;
    }
  }
  void show()
  {
    size = size + 0.275;
    fill(Color, Opacity);
    ellipse((float)X, (float) Y, size, size);
  }
}

class OddballParticle extends Particle//inherits from Particle
{
  int x1, y1, color1, color2, color3, opacity1;
  OddballParticle()
  {
    x1 = y1 = 200;
    color1 = ((int)(Math.random() * 255));
    color2 = ((int)(Math.random() * 255));
    color3 = ((int)(Math.random() * 255));
    opacity1 = ((int)(Math.random() * 50+80));
  }
  void move() 
  {
    x1 = x1 + (int)(Math.random() * 10 - 5);
    y1 = y1 + (int)(Math.random() * 10 - 5);
  }
  void show()
  { 
    fill(color1, color2, color3);
    ellipse(x1, y1, 50, 50);
  }
}
