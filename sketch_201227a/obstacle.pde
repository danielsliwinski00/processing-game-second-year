class obstacle {

  int metX;
  int metY;
  int counter;

  PImage met1 = loadImage("meteor1.png");
  PImage met2 = loadImage("meteor2.png");
  PImage met3 = loadImage("meteor3.png");
  PImage met4 = loadImage("meteor4.png");

  obstacle(int metX, int metY) {
    this.metX = metX;
    this.metY = metY;
  }
  
  void reset(){
    metX=850;
    metY=(int)random(100,700);
    meteor();
  }
  
  void resize1() {
    met1.resize(80, 80);
    met2.resize(80, 80); 
    met3.resize(80, 80); 
    met4.resize(80, 80);
  }

  void meteor() {
    move();
    render();
  }

  void move() {
    metX -= random(9+speed);
  }

  void render() { 
    if (counter < 10) { 
      image(met1, metX, metY);
    } else if (counter < 20) { 
      image(met2, metX, metY);
    } else if (counter < 30) { 
      image(met3, metX, metY);
    } else if (counter < 40) { 
      image(met4, metX, metY);
    } else {
      image(met1, metX, metY);
      counter=0;
    }

    counter++;
  }
}
