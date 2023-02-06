void setup() {
  Serial.begin(9600);
}

void loop() {
  // variabel untuk input sensor
  int sensorValue = analogRead(A0);

  Serial.println(sensorValue);
  delay(500);
}
