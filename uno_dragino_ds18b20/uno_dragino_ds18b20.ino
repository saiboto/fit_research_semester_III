/****************************************************************************
  By wb1 & saibot 2020
  
************************** Configuration ***********************************/
/* Payload Decoder for TTN
 *  
 *  
 * Decode:
function Decoder(bytes, port) {
var meinwert1 = ((bytes[0] << 8) | bytes[1]) / 100;
var meinwert2 = ((bytes[2] << 8) | bytes[3]) / 100
return {
measurement: {
temp1: meinwert1,
temp2: meinwert2
}
}
}
Ende decoder ++++++
 */
#include <TinyLoRa.h>
#include <SPI.h>
//#include <string.h> 
#include <DS18B20.h>
int port = 4; //io Port 
uint8_t selected;
uint8_t sensor1[] = {40, 255, 152, 212, 113, 21, 2, 37};
uint8_t sensor2[] = {40, 255, 82, 89, 5, 22, 3, 132};
//uint8_t sensor3[] = {0, 0, 0, 0, 0, 0, 0, 0};
uint8_t address[8];
DS18B20 ds(port);
float t1 =22; 
float t2;
uint16_t sensor1bytes;
uint16_t sensor2bytes;
    
// Network Session Key (MSB)
uint8_t NwkSkey[16] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
// Application Session Key (MSB)
uint8_t AppSkey[16] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
// Device Address (MSB)
uint8_t DevAddr[4] = { 0x00, 0x00, 0x00, 0x00 };
/************************** Example Begins Here ***********************************/
// Data Packet to Send to TTN
unsigned char loraData[4]; // = {"hello LoRa"};
// How many times data transfer should occur, in seconds
const unsigned int sendInterval = 60;
// Pinout for Arduino Lora shield v1.4
TinyLoRa lora = TinyLoRa(2, 10, 9); //Arduino lora shield v1.4
void setup()
{
 
  Serial.begin(115200);
  while (! Serial);
  Serial.print("Starting LoRa...");
  lora.setChannel(MULTI);  //Multichannel
  lora.setDatarate(SF7BW125);
    if(!lora.begin())
  {
    Serial.println("Failed");
    Serial.println("Check your radio");
    while(true);
  }
//++++++++ Sendeleistung auf 100 milliWatt (20 dbm) setzen
// ++++++++++ wenn auskommentiert --> dann nur 17dbm
// +++++++++++ kleinere Werte sind auch möglich

  lora.setPower(20);

//++++++++++++++++++  

  Serial.println("OK");
}
void loop()
{ 
    selected = (ds.select(sensor1)); 
    t1 = (ds.getTempC());
    selected = ds.select(sensor2);
    t2 = (ds.getTempC());
// +++++++ zum Test, auskommentieren
Serial.println(t1);
Serial.println(t2);
// ++++++++
 // Test sensor1bytes = round(ds.getTempC() * 100);
   sensor1bytes = round(t1 * 100);
   sensor2bytes = round(t2 * 100);
  loraData[0] = highByte(sensor1bytes);
  loraData[1] = lowByte(sensor1bytes);
  loraData[2] = highByte(sensor2bytes);
  loraData[3] = lowByte(sensor2bytes);
  
   lora.sendData(loraData, sizeof(loraData), lora.frameCounter); 
   lora.frameCounter++;
 //  Serial.println("delaying...");
   delay(sendInterval * 1000);
}
