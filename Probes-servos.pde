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

float angleA ;
float angleB ;
float angleY ;

String textValue = "";
void setup() {
  size(700,400);
  PFont font = createFont("arial",20);
  println(Arduino.list());
  
  arduino = new Arduino(this, Arduino.list()[0], 57600);
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
 text( angleA, 550,60);
 text("Grados Servo 2: ", 450,80);
 text( angleB, 550,80);
 text("Grados Servo 3: ", 450,100);
 text( angleY, 550,100);
 
 
}

public void ir(int theValue) {
     int DIS =  parseInt(cp5.get(Textfield.class,"distancia").getText());
     int ALTU =  parseInt(cp5.get(Textfield.class,"altura").getText());
     int ANG =  parseInt(cp5.get(Textfield.class,"grados").getText());
     
     int C= 9;
     int B= 12;
     int A= 14;
     
     int d1 = DIS - 9;
     
     float angleBrad = acos((sq(14)+sq(12)-sq(d1) - sq(ALTU))/(2*(14*12)));
     angleB = (angleBrad * 180)/ PI;
     
     float angleA1 = atan(ALTU/d1);
     float angleA2 = asin((12 * sin(angleB))/sqrt(sq(d1)+sq(ALTU)));
     
     angleA = ((abs(angleA1) + angleA2) * 180)/ PI;
     
     angleY = 360 - (angleA + angleB);
  
     arduino.servoWrite(7, parseInt(angleA));
     arduino.servoWrite(4, parseInt(angleB));
   
     //h.setCaptionLabel("ok");
 }
/*
a list of all methods available for the Slider2D Controller
use ControlP5.printPublicMethodsFor(Slider2D.class);
to print the following list into the console.

You can find further details about class Slider2D in the javadoc.

Format:
ClassName : returnType methodName(parameter type)

controlP5.Slider2D : Slider2D enableCrosshair()
controlP5.Slider2D : Slider2D disableCrosshair()
controlP5.Slider2D : Slider2D setArrayValue(float[]) 
controlP5.Slider2D : Slider2D setMaxX(float) 
controlP5.Slider2D : Slider2D setMaxY(float) 
controlP5.Slider2D : Slider2D setMinX(float) 
controlP5.Slider2D : Slider2D setMinY(float) 
controlP5.Slider2D : Slider2D setValue(float) 
controlP5.Slider2D : Slider2D shuffle() 
controlP5.Slider2D : float getCursorHeight() 
controlP5.Slider2D : float getCursorWidth() 
controlP5.Slider2D : float getCursorX() 
controlP5.Slider2D : float getCursorY() 
controlP5.Slider2D : float getMaxX() 
controlP5.Slider2D : float getMaxY() 
controlP5.Slider2D : float getMinX() 
controlP5.Slider2D : float getMinY() 
controlP5.Slider2D : float[] getArrayValue() 
controlP5.Slider2D : void setValueLabelSeparator(String) 
controlP5.Controller : CColor getColor() 
controlP5.Controller : ControlBehavior getBehavior() 
controlP5.Controller : ControlWindow getControlWindow() 
controlP5.Controller : ControlWindow getWindow() 
controlP5.Controller : ControllerProperty getProperty(String) 
controlP5.Controller : ControllerProperty getProperty(String, String) 
controlP5.Controller : Label getCaptionLabel() 
controlP5.Controller : Label getValueLabel() 
controlP5.Controller : List getControllerPlugList() 
controlP5.Controller : PImage setImage(PImage) 
controlP5.Controller : PImage setImage(PImage, int) 
controlP5.Controller : PVector getAbsolutePosition() 
controlP5.Controller : PVector getPosition() 
controlP5.Controller : Slider2D addCallback(CallbackListener) 
controlP5.Controller : Slider2D addListener(ControlListener) 
controlP5.Controller : Slider2D bringToFront() 
controlP5.Controller : Slider2D bringToFront(ControllerInterface) 
controlP5.Controller : Slider2D hide() 
controlP5.Controller : Slider2D linebreak() 
controlP5.Controller : Slider2D listen(boolean) 
controlP5.Controller : Slider2D lock() 
controlP5.Controller : Slider2D plugTo(Object) 
controlP5.Controller : Slider2D plugTo(Object, String) 
controlP5.Controller : Slider2D plugTo(Object[]) 
controlP5.Controller : Slider2D plugTo(Object[], String) 
controlP5.Controller : Slider2D registerProperty(String) 
controlP5.Controller : Slider2D registerProperty(String, String) 
controlP5.Controller : Slider2D registerTooltip(String) 
controlP5.Controller : Slider2D removeBehavior() 
controlP5.Controller : Slider2D removeCallback() 
controlP5.Controller : Slider2D removeCallback(CallbackListener) 
controlP5.Controller : Slider2D removeListener(ControlListener) 
controlP5.Controller : Slider2D removeProperty(String) 
controlP5.Controller : Slider2D removeProperty(String, String) 
controlP5.Controller : Slider2D setArrayValue(float[]) 
controlP5.Controller : Slider2D setArrayValue(int, float) 
controlP5.Controller : Slider2D setBehavior(ControlBehavior) 
controlP5.Controller : Slider2D setBroadcast(boolean) 
controlP5.Controller : Slider2D setCaptionLabel(String) 
controlP5.Controller : Slider2D setColor(CColor) 
controlP5.Controller : Slider2D setColorActive(int) 
controlP5.Controller : Slider2D setColorBackground(int) 
controlP5.Controller : Slider2D setColorCaptionLabel(int) 
controlP5.Controller : Slider2D setColorForeground(int) 
controlP5.Controller : Slider2D setColorValueLabel(int) 
controlP5.Controller : Slider2D setDecimalPrecision(int) 
controlP5.Controller : Slider2D setDefaultValue(float) 
controlP5.Controller : Slider2D setHeight(int) 
controlP5.Controller : Slider2D setId(int) 
controlP5.Controller : Slider2D setImages(PImage, PImage, PImage) 
controlP5.Controller : Slider2D setImages(PImage, PImage, PImage, PImage) 
controlP5.Controller : Slider2D setLabelVisible(boolean) 
controlP5.Controller : Slider2D setLock(boolean) 
controlP5.Controller : Slider2D setMax(float) 
controlP5.Controller : Slider2D setMin(float) 
controlP5.Controller : Slider2D setMouseOver(boolean) 
controlP5.Controller : Slider2D setMoveable(boolean) 
controlP5.Controller : Slider2D setPosition(PVector) 
controlP5.Controller : Slider2D setPosition(float, float) 
controlP5.Controller : Slider2D setSize(PImage) 
controlP5.Controller : Slider2D setSize(int, int) 
controlP5.Controller : Slider2D setStringValue(String) 
controlP5.Controller : Slider2D setUpdate(boolean) 
controlP5.Controller : Slider2D setValueLabel(String) 
controlP5.Controller : Slider2D setView(ControllerView) 
controlP5.Controller : Slider2D setVisible(boolean) 
controlP5.Controller : Slider2D setWidth(int) 
controlP5.Controller : Slider2D show() 
controlP5.Controller : Slider2D unlock() 
controlP5.Controller : Slider2D unplugFrom(Object) 
controlP5.Controller : Slider2D unplugFrom(Object[]) 
controlP5.Controller : Slider2D unregisterTooltip() 
controlP5.Controller : Slider2D update() 
controlP5.Controller : Slider2D updateSize() 
controlP5.Controller : String getAddress() 
controlP5.Controller : String getInfo() 
controlP5.Controller : String getName() 
controlP5.Controller : String getStringValue() 
controlP5.Controller : String toString() 
controlP5.Controller : Tab getTab() 
controlP5.Controller : boolean isActive() 
controlP5.Controller : boolean isBroadcast() 
controlP5.Controller : boolean isInside() 
controlP5.Controller : boolean isLabelVisible() 
controlP5.Controller : boolean isListening() 
controlP5.Controller : boolean isLock() 
controlP5.Controller : boolean isMouseOver() 
controlP5.Controller : boolean isMousePressed() 
controlP5.Controller : boolean isMoveable() 
controlP5.Controller : boolean isUpdate() 
controlP5.Controller : boolean isVisible() 
controlP5.Controller : float getArrayValue(int) 
controlP5.Controller : float getDefaultValue() 
controlP5.Controller : float getMax() 
controlP5.Controller : float getMin() 
controlP5.Controller : float getValue() 
controlP5.Controller : float[] getArrayValue() 
controlP5.Controller : int getDecimalPrecision() 
controlP5.Controller : int getHeight() 
controlP5.Controller : int getId() 
controlP5.Controller : int getWidth() 
controlP5.Controller : int listenerSize() 
controlP5.Controller : void remove() 
controlP5.Controller : void setView(ControllerView, int) 
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 


*/


