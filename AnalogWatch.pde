/*
 * Analog Watch
 * Bayu Setiaji [bayusetiaji@amikom.ac.id]
 * Faculty of Computer Science
 * University of Amikom Yogyakarta
 * 2023
*/

import processing.sound.*;

PFont font;
SoundFile tick;
PGraphics frame;

int sec;
int min;
int hou;

void setup() {
  size(800, 800);
  //fullScreen();
  font = loadFont("AgencyFB-Bold-48.vlw");
  tick = new SoundFile(this, "tick.wav");
  frame = createFrame();
  
  hou = (hour() % 12) * 30;
  min = minute() * 6;
  sec = second() * 6;
  
  frameRate(1);
}

void draw() {
  background(0);
  imageMode(CENTER);
  translate(width / 2, height / 2);
  
  image(frame, 0, 0);
  noFill();
  
  pushMatrix();
  strokeWeight(2);
  stroke(#F9FA7C);
  rotate(radians(sec));
  line(0, 0, 0, -350);
  popMatrix();
  
  pushMatrix();
  strokeWeight(4);
  stroke(#96E56F);
  rotate(radians(min));
  line(0, 0, 0, -300);
  popMatrix();
  
  pushMatrix();
  strokeWeight(6);
  stroke(#F7B4F7);
  rotate(radians(hou));
  line(0, 0, 0, -250);
  popMatrix();
  
  stroke(#F9FA7C);
  fill(0);
  circle(0, 0, 25);
  
  sec += 6;
  if(sec >= 360) {
    sec = 0;
    min += 6;
  }
  
  if(min >= 360) {
    min = 0;
    hou += 30;
  }
  
  if(hou >= 360) {
    hou = 0;
  }
  
  tick.play();
}

PGraphics createFrame() {
  PGraphics fr;
  
  fr = createGraphics(width, height);
  fr.beginDraw();
  fr.background(0);
  fr.textAlign(CENTER, CENTER);
  fr.textFont(font);
  fr.textSize(40);
  
  fr.translate(width / 2, height / 2);
  
  fr.stroke(#B1FA77);
  fr.strokeWeight(2);
  fr.fill(#3A5A20);
  fr.circle(0, 0, 780);
  fr.fill(0);
  fr.circle(0, 0, 750);
  
  int _num = 12;
  for(int i = -90; i < 270; i+=6) {
    float _x = cos(radians(i)) * 350;
    float _y = sin(radians(i)) * 350;
    fr.noStroke();
    fr.fill(#A2F2FA);
    
    if(i % 30 == 0) {
      fr.text(_num, _x, _y);
      _num++;
    } else {
      fr.circle(_x, _y, 8);
    }
    
    if(_num > 12) _num = 1;
  }
  
  fr.textSize(50);
  fr.fill(255, 50);
  fr.text("Analog Watch", 0, -200);
  fr.textSize(25);
  fr.text("Bayu Setiaji", 0, 200);
  fr.text("2023", 0, 240);
  
  fr.endDraw();
  
  return fr;
}
