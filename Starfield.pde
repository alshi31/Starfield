Particle[] starfield;
void setup()
{
  background(0);
  size(700, 700);
  starfield = new Particle[500];
  for (int i = 0; i < 25; i++)
  {
    starfield[i] = new OddballParticle();
  }
  for (int i = 25; i < starfield.length; i++)
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
    X = (int)(Math.random() * 700);
    Y = (int)(Math.random() * 700);
    Speed = (int)(Math.random() * 8 + 1);
    Angle = (int)(Math.random() * 360);
    Color = (int)(Math.random() * 100+156);
    Opacity = (int)(Math.random() * 95 + 95);
    size = (float)(Math.random()* 7 + 5);
  }
  void move() 
  {
    X = X + (Math.cos(Angle) * Speed);
    Y = Y + (Math.sin(Angle) * Speed);
    if (X < 0 || X > 700 || Y < 0 || Y > 700)
    {
      X = (int)(Math.random() * 20) + 340;
      Y = (int)(Math.random() * 20) + 340;
      size = (int)(Math.random()*6+3);
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
    noStroke();
    ellipse((float)X, (float) Y, size, size);
  }
}

class OddballParticle extends Particle//inherits from Particle
{
  int x1, y1, color1, color2, color3, opacity1;
  OddballParticle()
  {
    x1 = y1 = 350;
    color1 = ((int)(Math.random() * 255));
    color2 = ((int)(Math.random() * 255));
    color3 = ((int)(Math.random() * 255));
    opacity1 = ((int)(Math.random() * 50+80));
  }
  void move() 
  {
    x1 = x1 + (int)(Math.random() * 15 - 7.5);
    y1 = y1 + (int)(Math.random() * 15 - 7.5);
    if (x1 < -25 || x1 > 525 || y1 < -25 || y1 > 525)
    {
      x1 = 350;
      y1 = 350;
    }
  }
  void show()
  { 
    fill(color1, color2, color3);
    ellipse(x1, y1, 25, 25);
  }
}
