
void setup() {
  // initialize the serial communication:
  Serial.begin(9600);

  // Since both sides wait for each other before they send anything,
  // someone needs to start the conversation
  Serial.println("0");
}

void loop() {
  while (Serial.available()) {
    Serial.parseInt(); // no need to store the value since we don't need it

    // Only proceed if we have the end of line
    if (Serial.read() == '\n') {
      int sensor = analogRead(A2);
      delay(1);
      int sensor2 = analogRead(A5);
      delay(1);
      Serial.print(sensor);
      Serial.print(',');
      Serial.println(sensor2);
      
    }
  }
}
