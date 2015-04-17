/**
* ControlP5 Slider2D
*
*
* find a list of public methods available for the Slider2D Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/
import processing.serial.*;

import cc.arduino.*;

Arduino arduino;
import controlP5.*;

ControlP5 cp5;
Button h;
Slider2D s;

int angleServo1 = 0;
int angleServo2 = 0;
int angleServo3 = 0;

String textValue = "";
void setup() {
  size(700,400);
  PFont font = createFont("arial",20);
  println(Arduino.list());
  
  arduino = new Arduino(this, Arduino.list()[5], 57600);
  cp5 = new ControlP5(this);
  s = cp5.addSlider2D("wave")
         .setPosition(30,40)
         .setSize(100,100)
         .setArrayValue(new float[] {50, 50})
         .setCaptionLabel("Control manual")
         //.disableCrosshair()
         ;
         
  smooth();
  
  cp5.addTextfield("distancia")
     .setPosition(200,40)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
     
  cp5.addTextfield("altura")
     .setPosition(200,100)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
     
  cp5.addTextfield("grados")
     .setPosition(200,160)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
     
  h = cp5.addButton("ir")
     .setValue(0)
     .setPosition(410,100)
     .setSize(20,40)
     ;
  
  
  arduino.pinMode(4, Arduino.SERVO);
  arduino.pinMode(7, Arduino.SERVO);
}

float cnt;
void draw() {
  background(0);
  
  
  float valorx = map(s.arrayValue()[0], 0, 99, 0, 179);
  int valx = int (valorx);
  float valory = map(s.arrayValue()[1], 0, 99, 0, 179);
  int valy = int (valory);
  if(s.isMouseOver()){
      arduino.servoWrite(7, valx);
      arduino.servoWrite(4, valy);
  } 
 
 
 text("Grados Servo 1: ", 450,60);
 text( angleServo1, 550,60);
 text("Grados Servo 2: ", 450,80);
 text( angleServo2, 550,80);
 text("Grados Servo 3: ", 450,100);
 text( angleServo3, 550,100);
 
 
}

public void ir(int theValue) {
     angleServo1 =  parseInt(cp5.get(Textfield.class,"distancia").getText());
     angleServo2 =  parseInt(cp5.get(Textfield.class,"altura").getText());
     angleServo3 =  parseInt(cp5.get(Textfield.class,"grados").getText());
     
     arduino.servoWrite(7, angleServo1);
     arduino.servoWrite(4, angleServo2);
     
 
     
     //h.setCaptionLabel("ok");
 }
