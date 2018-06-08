class Obstaculo
{
  Body p;
  float r;
  
  Obstaculo(float x, float y, float r_)
  {
    r = r_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.KINEMATIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    p = box2d.world.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0;
    fd.restitution = 0.5;
    
    p.createFixture(fd);
      
    p.setLinearVelocity(new Vec2(-10,0));
  }
  
  void reinicio(int x, float y)
  {
    Vec2 pos = box2d.getBodyPixelCoord(p);
    if(pos.x < -5)
    {
      reset(x , y);
    }
  }
  
  void reset(int x_, float y_)
  {
    p.setTransform(box2d.coordPixelsToWorld(x_,y_),0);
    //p.setLinearVelocity(new Vec2(0,0));
    //box2d.setGravity(0,-20);
  }
  
  
  
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(p);
    
    //float a = p.getAngle();
    pushMatrix();
      translate(pos.x,pos.y);
      //rotate(-a);
      fill(0,255,0);
      noStroke();
      ellipse(0,0,r*2,r*2);
      imageMode(CENTER);
      image(alien,0,0,100,100);
    popMatrix();
    
  }
  
  
  void dir(int z1, int z2)
  {
    p.setLinearVelocity(new Vec2(z1,z2));
  }
}
