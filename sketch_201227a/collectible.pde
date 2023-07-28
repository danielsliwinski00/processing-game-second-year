public class collectible {

  PImage star1 = loadImage("star1.png");
  PImage star2 = loadImage("star2.png");
  PImage star3 = loadImage("star3.png");
  PImage star4 = loadImage("star4.png");
  
  int starX, starY;
  int counter;

  collectible(int starX, int starY){
    this.starX = starX;
    this.starY = starY;
  }  
  void resize1() {
    star1.resize(40, 40);
    star2.resize(40, 40);
    star3.resize(40, 40);
    star4.resize(40, 40);
  }
  void star() {
    resize1();
    starRender();
  }
  void starRender() {
    if (counter < 10) { 
      image(star1, starX, starY);
    } else if (counter < 20) { 
      image(star2, starX, starY);
    } else if (counter < 30) { 
      image(star3, starX, starY);
    } else if (counter < 40) { 
      image(star4, starX, starY);
    } else { 
      image(star1, starX, starY);
      counter=0;
    }
    counter++;
  }
}
