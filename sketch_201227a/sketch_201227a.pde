final int gameX=800, gameY=800;    //game window size   

final int up=101;    // direction 'states'
final int down=102;
final int left=103;
final int right=104;

int timer = 60;

int score=0;    //score
int oldScore=0;
int speed=0;    //to speed up movement and make game harder as your score goes up

int direction=104; //direction

PFont fontZ; //fonts
PFont fontY;
PImage titlescreen; //images
PImage back;

final int title=0;  //game states
final int game=1;
final int overz=2;
int gameState=title;  //initial state

boolean resetting = true;

collectible lightz; // classes
player rocket;
obstacle rock;

ArrayList<collectible> collect = new ArrayList();

void setup() { 
  frameRate(60);  //for the frame count timer
  size(800, 800); //window size
  fontZ=createFont("StarJedi.ttf", 1);  //fonts        
  fontY=createFont("times-new-roman.ttf", 1);
  titlescreen=loadImage("mainscreen.png"); //images
  back=loadImage("gameback.png");
  image(titlescreen, 0, 0);
  titlescreen.resize(gameX, gameY); //to make sure the image fits the window
  rocket=new player(0, 0);
  rock=new obstacle(0, 0);
  for (int i=0; i<3; i++) {
    collect.add(new collectible( (int) random(100, 700), (int) random(100, 700)));
  }
  rocket.resize1();
  rock.resize1();
}   

void draw() {    //game states
  if (gameState == 0) {  //titlescreen
    runTitle();
  } else if (gameState == 1) {  //titlescreen
    runGame();
  } else if (gameState == 2) {  //titlescreen
    runOver();
  } else {            //just incase
    background(25);
    textAlign (CENTER);
    textFont (fontY);
    textSize (80);
    fill(255);
    text("You seem to have run\n into a problem", gameX/2, gameY/2);
  }
}

void runTitle() { //'titlescreen' game state
  reset();
  resetting = true;
  background(25);  //titlescreen stuff
  image (titlescreen, 0, 0);
  textFont(fontZ);
  textAlign(CENTER);
  textSize(40);
  fill(250, 245, 0);
  text("PRESS ENTER To START", gameX/2, gameY*3/4);

  if (keyCode == ENTER) {  //switching to 'game' state
    gameState = game;
  }
}

void runGame() {  //'game' game state
  if (resetting) {
    reset();
    resetting = false;
  }
  background(25);
  image(back, 0, 0);
  textAlign(LEFT); //score in top left during gameplay
  textFont(fontZ);
  textSize(30);
  fill(250, 245, 0); 
  text("Score: " + score, 40, 10, gameX - 20, 50);
  textAlign(RIGHT); //score in top left during gameplay
  textFont(fontY);
  textSize(30);
  fill(250, 245, 0); 
  text("Time: " + timer, 40, 10, gameX - 45, 50);
  
  rock.meteor();
  if (frameCount % 300- speed*4 == 0) {    //timer for meteors to spawn in
    rock.reset();
//    frameCount=0;
  }
  if (frameCount % 60 == 0){
  timer=timer-1;
  }
  
  rocket.spaceship(); 
  for (int i=0; i< collect.size(); i++) {
    collectible thisStar = collect.get(i);
    thisStar.star();
    if (rocket.collected(thisStar)) {    //if statement for collecting star
      collect.remove(thisStar);
      collect.add(new collectible( (int) random(100, 700), (int) random(100, 700)));
      score=score+1;
    }
  }
  if (rocket.crash(rock)) {    //if statement for crashing into rock
    gameState = 2;
  }
  if (score == oldScore+3) {
    speed = speed+1;
    oldScore = score;
  }
  if (timer == 0){
  gameState = 2;
  }
}

void runOver() {  //'game over' game state
  background(25);  //text
  textAlign(CENTER);
  textFont(fontZ);
  textSize(80);
  fill(150, 145, 0);
  text("G A M E o v E R", gameX/2, gameY/3); //capital O and V in this font look like a capital N and R

  textFont(fontY); //more text
  textSize(40);
  fill(150, 145, 0); 
  text("Your Score is:  "+score, gameX/2, gameY/2);

  textFont(fontY);  //even more text
  textSize(20);
  fill(150, 145, 0); 
  text("Press R to try again\n Press Backspace to return to Title", gameX/2, gameY*3/4);

  if (keyCode == 'R' || keyCode == 'r') {  //r for replay/retry    
    reset();
    resetting = true;
    gameState=game;
  }
  if (keyCode == BACKSPACE) {   //switching to titlescreen game state
    reset();
    resetting = true;
    gameState=title;
  }
}

void reset() {      //for resetting values and other things
  speed=0;
  timer=60;
  score=0;
  oldScore=0;
  rocket.reset();
  rock.reset();
}

void keyPressed() {    //movement keys for player
  if (key == CODED) {
    if (keyCode == UP) {
      direction=up;
    } else if (keyCode == DOWN) {
      direction=down;
    } else if (keyCode == LEFT) {
      direction=left;
    } else if (keyCode == RIGHT) {
      direction=right;
    }
  }
}
