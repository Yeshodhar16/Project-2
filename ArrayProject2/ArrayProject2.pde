float[] Xs = new float[100];
float[] Ys = new float[100];


PImage snowflake;
float[] snowXs = new float[1000];
float[] snowYs = new float[1000];

import processing.sound.*;
SoundFile file;
void setup()
{
  file=new SoundFile(this,"videoplayback (1).mp3");
  file.play();
  fullScreen();
  background(0);
  noStroke();
  Shapes();
  
  for(int i=0; i<1000; i++)
  {
     snowYs[i]=random(height);
     snowXs[i]=random(width);
  }
  
  
  for(int i=0; i<100;i++)
  {
  int tempX=(int)random(width);
  int tempY=(int)random(height);
    while(green(get(tempX,tempY))<120)
    {
     tempX=(int)random(width);
      tempY=(int)random(height);
      
    }
      Xs[i]=tempX;
      Ys[i]=tempY;
  }
  
  snowflake = loadImage("snowflake.png");
}

void draw()
{
  background(0);
  Shapes();
  Snow();
  for(int i=0; i<100; i++)
  {
  int tempX=(int)random(width);
  int tempY=(int)random(height);
    while(green(get(tempX,tempY))<199 || red(get(tempX, tempY))>200)
    {
     tempX=(int)random(width);
     tempY=(int)random(height);
      
    }
      Xs[i]=tempX;
      Ys[i]=tempY;
      fill(random(255),random(198),random(255));
      ellipse(Xs[i],Ys[i],10,10);
  }
   
  }
  


void Shapes()
{
  fill(27,200,0);
  triangle(width/2,height/8,width/2.4,height/3,width/1.7,height/3);
  triangle(width/2,height/5,width/2.4,height/2.25,width/1.7,height/2.25);
  triangle(width/2,height/3.5,width/2.4,height/1.7,width/1.7,height/1.7);
  fill(#674000);
  rect(width/2.1,height/1.7,100,200);
  
  
}

void Snow()
{
  for(int i=0; i<1000; i++)
  {
   image(snowflake,snowXs[i], snowYs[i], 10, 10);
   snowYs[i] = snowYs[i] + 2;
   if(snowYs[i]>height)
   {
     snowYs[i]=random(500);
   }
  }
}