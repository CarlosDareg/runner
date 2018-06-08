import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

int pantalla;

jugador heroe;
soporte s1,s2,techo;

suelo a1,a2;

Obstaculo o1,o2;

PImage fondo;
PImage base;

int currentFrame = 0;
PImage[] images = new PImage[10];
PImage alien;

byte countdown = 0;
int seconds, startTime;

float pasos;

void setup()
{
  size(1000,600);
  
  pantalla = 0;
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -50);
  
  a1 = new suelo(1400,random(300,550),2,1200);
  a2 = new suelo(3000,random(300,550),2,1200);
  
  heroe = new jugador(250,30,20,60);
  
  s1 = new soporte(230,300,10,600);
  s2 = new soporte(270,300,10,600);
  techo = new soporte(500,0,width,1);
  
  o1 = new Obstaculo(1010,random(height),30);
  o2 = new Obstaculo(1010,random(height),30);
  
  fondo = loadImage("fondo.png");
  base = loadImage("base2.jpg");
  
  alien = loadImage("alien.png");
  
  for(int i = 0; i< 10; i++)
  {
    images[i] = loadImage("A" + i + 1 + ".gif");
  }
  
  if(pantalla == 2)
  {
    //startTime = millis()/1000 + countdown;
  }
 
  pasos = 0.00f;
  
}

void draw()
{
  background(255);
  //box2d.step();
  
  switch(pantalla)
  {
    case 0:
    titulo();
    break;
    
    case 1:
    instrucciones();
    break;
    
    case 2:
    box2d.step();
    juego();
    fill(255);
    textSize(30);
    pasos = pasos + 0.1;
    textAlign(LEFT);
    text("Distancia recorrida: " + pasos,200,50);
    break;
    
    case 3:
    reinicio();
    break;
    
    default:
    reinicio();
    break;
  }
}

void keyReleased()
{
  if (key == ENTER)
  {
    pantalla ++;
  }
}
