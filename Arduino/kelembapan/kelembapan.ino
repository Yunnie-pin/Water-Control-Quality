#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>

const char* ssid = "Redikos";
const char* password = "gdbs1234";
const char *serverName = "http://192.168.1.2:3300/alat";


const int buttonPin = 0;     // the number of the pushbutton pin
const int ledPin =  14;      // the number of the LED pin
const int sensorKelembapan = 13;

// variables will change:
int buttonState = 0;         // variable for reading the pushbutton status

void setup() {
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT_PULLUP);
  pinMode(sensorKelembapan, INPUT);
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

void sendData(int data, bool status)
{
    WiFiClientSecure client;
    HTTPClient http;
    client.setInsecure();

    http.addHeader("Content-Type", "application/json");
    http.addHeader("Access-Control-Allow-Origin", "*");
    http.begin(client, serverName);
    int httpCode = http.POST("{\"location\":\""
                             "\",\"tds\":\"" +
                             data + "\",\"is_safe\":\"" + status + "\"}");

    if (httpCode > 0)
    {
        String payload = http.getString();
        Serial.println(payload);
    }
    else
    {
        Serial.println("Error on HTTP request");
    }

    http.end();
}

void loop() {
  // read the state of the pushbutton value:
  buttonState = digitalRead(buttonPin);
  sensorKelembapanState = digitalRead(sensorKelembapan);
  Serial.println(buttonState);

  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
  if (sensorKelembapanState >= 140 && sensorKelembapanState <= 185) {
    // basah:
    digitalWrite(ledPin, HIGH);
  } else if (sensorKelembapanState >= 360 && sensorKelembapanState <= 400) {
    // lembab:
    digitalWrite(ledPin, LOW);
  } else if(sensorKelembapanState >= 400 && sensorKelembapanState <= 600) {
    //kering
    }else{
      //Kondisi tidak diketahui
    }
}
