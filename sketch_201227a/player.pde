public class player { 

  PImage imgU1 = loadImage("U1.png");
  PImage imgU2 = loadImage("U2.png");
  PImage imgD1 = loadImage("D1.png");
  PImage imgD2 = loadImage("D2.png");
  PImage imgL1 = loadImage("L1.png");
  PImage imgL2 = loadImage("L2.png");
  PImage imgR1 = loadImage("R1.png");
  PImage imgR2 = loadImage("R2.png"); 

  int playerX, playerY;
  int counter;

  player lightz, collectible;

  player(int playerX, int playerY){
    this.playerX = playerX;
    this.playerY = playerY;
  }
void resize1(){
    imgU1.resize(40, 40);
    imgU2.resize(40, 40);
    imgD1.resize(40, 40);
    imgD2.resize(40, 40);
    imgL1.resize(40, 40);
    imgL2.resize(40, 40);
    imgR1.resize(40, 40);
    imgR2.resize(40, 40);
}
  void reset() {
    playerX=20;
    playerY=gameY/2;
    direction = right;
  }

  void spaceship() {
    if (direction==up) {
      playerY -=(3+speed);
    } else if (direction==down) {
      playerY +=(3+speed);
    } else if (direction==left) {
      playerX -=(3+speed);
    } else if (direction==right) {
      playerX +=(3+speed);
    }
    render();
    if (playerX < 0 || playerX > gameX) {
      gameState=2;
    }
    if (playerY < 0  || playerY > gameY) {
      gameState=2;
    }
  }

  void render() {
    if (direction == up) {
      if (counter < 10) { 
        image(imgU1, playerX, playerY);
      } else if (counter < 20) { 
        image(imgU2, playerX, playerY);
      } else {
        image(imgU1, playerX, playerY);
        counter=0;
      }
      counter++;
    }
    else if (direction == down) {
      if (counter < 10) { 
        image(imgD1, playerX, playerY);
      } else if (counter < 20) { 
        image(imgD2, playerX, playerY);
      } else {
        image(imgD1, playerX, playerY);
        counter=0;
      }
      counter++;
    }
    else if (direction == left) {
      if (counter < 10) { 
        image(imgL1, playerX, playerY);
      } else if (counter < 20) { 
        image(imgL2, playerX, playerY);
      } else {
        image(imgL1, playerX, playerY);
        counter=0;
      }
      counter++;
    }
    else if (direction == right) {
      if (counter < 10) { 
        image(imgR1, playerX, playerY);
      } else if (counter < 20) { 
        image(imgR2, playerX, playerY);
      } else {
        image(imgR1, playerX, playerY);
        counter=0;
      }
      counter++;
    }
  }
  boolean crash(obstacle obstacle) {
    return abs(this.playerX - (obstacle.metX)) < 30 && abs(this.playerY - (obstacle.metY)) < 40;
  }
  boolean collected(collectible collectible) {
    return abs(this.playerX - collectible.starX) < 30 && abs(this.playerY - collectible.starY) < 30;
  }
}
