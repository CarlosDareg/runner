class suelo
{
  float x,y,h,w;
  
  Body b;
  
  suelo(float x_, float y_, float h_, float w_)
  {
    x = x_;
    y = y_;
    h = h_;
    w = w_;
    
    PolygonShape sd = new PolygonShape();
    
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    
    sd.setAsBox(box2dW, box2dH);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.KINEMATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    b.createFixture(sd,1);
    
    b.setLinearVelocity(new Vec2(-50,0));
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(b);
    
    pushMatrix();
    translate(pos.x,pos.y);
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    imageMode(CENTER);
    image(base,0,300);
    popMatrix();
  }
  
  void reset(float x_, float y_)
  {
    Vec2 pos = box2d.getBodyPixelCoord(b);
    
    if(pos.x > -720 && pos.x < -700 && pos.y > 250 && pos.y < 600)
    {
      b.setTransform(box2d.coordPixelsToWorld(x_,y_),0);
      move();
       
    }
  }

  void move()
  {
    b.setLinearVelocity(new Vec2(-50,0));
  }
  
}
