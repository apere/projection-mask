// Handles parsing data from serial
// currently only looks for pulse sensor data

void serialEvent(Serial port){ 
  String inData = "";
  if(port != null) {
    try{
     inData = port.readStringUntil('\n');
    } catch(RuntimeException e) {
      println("**");
    }
     if(inData != null) {
       inData = trim(inData);               // cut off white space (carriage return)
       if (inData.charAt(0) == 'S'){          // leading 'S' for sensor data
         inData = inData.substring(1);        // cut off the leading 'S'
         rawPulse = int(inData);                // convert the string to usable int
         println("p: " + rawPulse);
       }
       if (inData.charAt(0) == 'B'){          // leading 'B' for BPM data
         inData = inData.substring(1);        // cut off the leading 'B'
         BPM = int(inData);                   // convert the string to usable int
         beat = true;                         // set beat flag to advance heart rate graph
         heart = 20;                          // begin heart image 'swell' timer
         println("b: " + BPM);
       }
       if (inData.charAt(0) == 'Q'){            // leading 'Q' means IBI data 
         inData = inData.substring(1);        // cut off the leading 'Q'
         IBI = int(inData);                   // convert the string to usable int
         println("i: " + IBI);
       }
       if (inData.charAt(0) == 'T'){   
         inData = inData.substring(1);        // cut off the leading 'T'
         windTemp = float(inData);
         println("t: " + windTemp);
       }
       if (inData.charAt(0) == 'Z'){   
         inData = inData.substring(1);        // cut off the leading 'Z'
         windVolts = float(inData);
         println("z: " + windVolts);
       }
       if (inData.charAt(0) == 'W'){   
         inData = inData.substring(1);        // cut off the leading 'T'
         windSpeed = float(inData);
         println("w: " + windSpeed);
       }
     }
  }
}