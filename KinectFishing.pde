/*/INSTRUCTION:
 -If 1 hand: 
 1 hand controls sea & background & ship
 -If 2 hand: 
 1st hand controls sea
 2nd hand controls background & ship
/*/

import ddf.minim.*;

Minim Doraemon;
AudioPlayer playerDoraemon;

import java.util.Map;
import java.util.Iterator;

import SimpleOpenNI.*;

SimpleOpenNI context;
int handVecListSize = 20;
Map<Integer, ArrayList<PVector>>  handPathList = new HashMap<Integer, ArrayList<PVector>>();

PFont font;

PImage submarine;
PImage BlueFish;
PImage OrangeFish;
PImage PinkFish;
PImage TreasureChest;
PImage Fireworks;

float[] xBF = new float[2];
float[] yBF = new float[2];
float[] xOF = new float[3];
float[] yOF = new float[3];
float[] xPF = new float[3];
float[] yPF = new float[3];

float MeterBar;

float TrackHands;

float StillSea;
float seaX1=800-467;
float seaX2=800-467*2;
float seaX3=800-467*3;
float seaY;

float R=random(255);
float G=random(255);
float B=random(255);

//Array for random colors of circle controlled by hands
color[]       userClr = new color[] 
{ 
  color(R, G, B), 
  color(R, B, G), 
  color(G, R, B), 
  color(G, B, R), 
  color(B, G, R), 
  color(B, R, G)
};

void setup()
{
  size(800, 500);
  submarine=loadImage("submarine.png");
  BlueFish=loadImage("BlueFish.png");
  OrangeFish=loadImage("OrangeFish.png");
  PinkFish=loadImage("PinkFish.png");
  TreasureChest=loadImage("TreasureChest.png");
  Fireworks=loadImage("fireworks.jpg");
  font=loadFont("Noteworthy-Bold-48.vlw");
  textAlign(CENTER);

  MeterBar=15;

  for (int BF = 0; BF < 2; BF++) {
    xBF[BF] = random(-30, 600);
    yBF[BF] = random(seaY+90);
  }

  for (int OF = 0; OF < 3; OF++) {
    xOF[OF] = random(-30, 600);
    yOF[OF] = random(seaY+90);
  }

  for (int PF = 0; PF < 3; PF++) {
    xPF[PF] = random(-30, 600);
    yPF[PF] = random(seaY+90);
  }

  Doraemon = new Minim(this);
  playerDoraemon = Doraemon.loadFile("Doraemon.mp3");
  playerDoraemon.loop();

  context = new SimpleOpenNI(this);
  if (context.isInit() == false)
  {
    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
    exit();
    return;
  }   

  // enable depthMap generation 
  context.enableDepth();

  // disable mirror
  context.setMirror(true);

  context.enableHand();
  context.startGesture(SimpleOpenNI.GESTURE_WAVE);
}

void draw()
{
  // update the cam
  context.update();
  background(255);
  TrackHands();
}


// -----------------------------------------------------------------
// hand events

void onNewHand(SimpleOpenNI curContext, int handId, PVector pos)
{
  println("onNewHand - handId: " + handId + ", pos: " + pos);

  ArrayList<PVector> vecList = new ArrayList<PVector>();
  vecList.add(pos);
  while (vecList.size () > 3) {
    vecList.remove(2);
  }
  handPathList.put(handId, vecList);
}

void onTrackedHand(SimpleOpenNI curContext, int handId, PVector pos)
{
  //  println("onTrackedHand - handId: " + handId + ", pos: " + pos );

  ArrayList<PVector> vecList = handPathList.get(handId);
  if (vecList != null)
  {
    vecList.add(0, pos);
    if (vecList.size() >= handVecListSize)
      // remove the last point 
      vecList.remove(vecList.size()-1);
  }
}

void onLostHand(SimpleOpenNI curContext, int handId)
{
  println("onLostHand - handId: " + handId);
  handPathList.remove(handId);
}

// -----------------------------------------------------------------
// gesture events

void onCompletedGesture(SimpleOpenNI curContext, int gestureType, PVector pos)
{
  println("onCompletedGesture - gestureType: " + gestureType + ", pos: " + pos);

  int handId = context.startTrackingHand(pos);
  println("hand stracked: " + handId);
}

