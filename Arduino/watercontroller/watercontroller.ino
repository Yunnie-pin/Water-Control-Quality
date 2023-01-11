#include <ESP8266WiFi.h>


const char* ssid = "Redikos";
const char* password = "gdbs1234";

const int buttonPin = 0;     // the number of the pushbutton pin
const int ledPin =  14;      // the number of the LED pin

// variables will change:
int buttonState = 0;         // variable for reading the pushbutton status

void setup() {
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT_PULLUP);
  Serial.begin(9600);
  konekWifi();
}

void konekWifi() {
  WiFi.begin(ssid, password);
  //memulai menghubungkan ke wifi router
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print("."); //status saat mengkoneksikan
  }
  Serial.println("Sukses terkoneksi wifi!");
  Serial.println("IP Address:"); //alamat ip lokal
  Serial.println(WiFi.localIP());
}

void loop() {
  // read the state of the pushbutton value:
  buttonState = digitalRead(buttonPin);
  Serial.println(buttonState);

  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
  if (buttonState == HIGH) {
    // turn LED on:
    digitalWrite(ledPin, HIGH);
  } else {
    // turn LED off:
    digitalWrite(ledPin, LOW);
  }
}
