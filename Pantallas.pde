void titulo()
{
  background(#FFD6D6);
  textAlign(CENTER);
  textSize(60);
  fill(90,0,255);
  text("S P A C E  R U N N ER",width/2,100);
  textSize(20);
  text("PRESIONA ENTER PARA CONTINUAR",width/2,height/2);
  textSize(15);
  fill(0,0,255,50);
  text("Creado por: Carlos Daniel Regalado Aguirre",200,550);
}

void instrucciones()
{
  background(#090B3E);
  textAlign(CENTER);
  textSize(20);
  fill(255);
  text("Un dia mas en la estacion lunar",width/2,100);
  text("Estas aburrido asi que sales a 'pasear'",width/2,200);
  text("Recuerda que estas en el espacio",width/2,250);
  text("Procura esquivar a los aliens",width/2,300);
  text("Usa tu habilidad de salto con 'W' ",width/2, 400);
  text("Presiona ENTER para salir a 'pasear'",width/2, 500);
}

void juego()
{
  background(#090B3E);
  
  //image(fondo,0,0,1000,600);
  
  a1.display();
  a1.reset(2500,random(300,550));
  a2.display();
  a2.reset(2500,random(300,550));
  
  o1.display();
  o2.display();
  o1.dir(-30,0);
  o2.dir(-30,0);
  o1.reinicio(1010,random(300,550));
  o2.reinicio(1010,random(300,550));
  
  techo.display();
  
  heroe.display();
  heroe.over();
}

void reinicio()
{
  background(0,0,255);
  textAlign(CENTER);
  textSize(20);
  fill(255);
  text("Acabas de perder :'c",width/2,250);
  text("¿Deseas volver a pasear?",width/2,300);
  textSize(50);
  text("Distancia recorrida: " + pasos ,width/2,50);
  textSize(20);
  fill(random(255),random(255),random(255));
  text("Y/N",width/2,400);
  if(keyPressed)
  {
    if(key=='y'||key=='Y')
    {
      pantalla = 1;
      heroe.reset();
      pasos = 0;
    }
    if(key == 'n'||key == 'N')
    {
      exit();
    }
  }
}
