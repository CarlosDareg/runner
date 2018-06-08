class jugador
{
  int x,y,w,h;
  
  Body c;
  
  jugador(int x_, int y_, int w_, int h_)
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    Vec2 xyEnBox2 = box2d.coordPixelsToWorld(new Vec2(x,y));
    bd.position.set(xyEnBox2);
    c = box2d.createBody(bd);
    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    
    sd.setAsBox(box2dW, box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0;
    fd.restitution = 0;
    
    c.createFixture(fd);
    
  }
  
  void display()
  { 
    Vec2 pos = box2d.getBodyPixelCoord(c);
    float a = c.getAngle();
    
    //ingresar imagen de personaje.
    pushMatrix();
    translate(pos.x,pos.y);
    fill(255,0,0);
    rotate(-a);
    stroke(0);
    //rectMode(CENTER);
    //rect(0,0,w,h);
    imageMode(CENTER);
    currentFrame = (currentFrame+1) % 10;  // Use % to cycle through frames
    for (int x = -100; x < width; x += images[0].width) 
    { 
      image(images[(currentFrame) % 10], 0, 2);
    }
    popMatrix();
    
   mover();
    
  }
  
  
  void mover() {
    Vec2 move = new Vec2(0, 0);
    Vec2 pos = c.getWorldCenter();
 

    if ((keyPressed == true) && ((key == 'W') || (key == 'w'))) 
    {

        move.y += 3000;
    }
    
    c.applyForce(move, pos);
  }
  
  void restart()
  {
    
  }
  
  void reset()
  {
     c.setTransform(box2d.coordPixelsToWorld(250,30),0); 
  }
  
  
  void over()
  {
    Vec2 pos = box2d.getBodyPixelCoord(c);
    if((pos.y > 600 && pos.y < 610)||(pos.x<0||pos.x>1000))
    {
      pantalla ++;
    }
  }
  
  
}
