// 350Z strut LED v4
// TLC5940NT handling Blue PVM
// ATtiny handling PVM? 2 outputs, bridge PWM to 1 connection?
// Marvin Beekmann 11/17/16

// Ananlog 3 way switch -- input for sequence
// Analog output to TLC5940 for loop function
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Renaming outputs
#define l1 0
#define l2 1
#define l3 2
#define r1 4
#define r2 7
#define r3 8


#define switchIn A0
#define Tout A1



const unsigned short int brightness = 255;

unsigned short int seqNum = 0; // 0 - default all on, 1 - pulse, 2 - show

void defaultseq(int);

void firstseq(int);

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  pinMode(l1, OUTPUT);
  pinMode(l2, OUTPUT);
  pinMode(l3, OUTPUT);
  
  pinMode(r1, OUTPUT);
  pinMode(r2, OUTPUT);
  pinMode(r3, OUTPUT);
  
  

}

void loop() {
  // put your main code here, to run repeatedly:
  
  switch(seqNum){
    case 0:
    
    Serial.println("Default sequence, all on");
    
    
    break;
    
    case 1:
    Serial.println("Sequence 1: All pulse");
    
    break;
    
    case 2:
    Serial.println("Sequence 2: Show mode");
    
    break;
    
  }
}

void defaultseq(int b) {
 Serial.println("Initilizing defualt sequence");
 
 digitalWrite(l1, b);
 digitalWrite(l2, b);
 digitalWrite(l3, b);
 
 digitalWrite(r1, b);
 digitalWrite(r2, b);
 digitalWrite(r3, b);
 
 Serial.println("Completed. All lights should be on.");
}

void firstseq(int b) {
  while (b >= 0 &&   
  
}

