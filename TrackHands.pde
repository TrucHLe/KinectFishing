void TrackHands() {
  // draw the tracked hands
  if (handPathList.size() > 0 && handPathList.size() < 3 )  
  {    

    Iterator itr = handPathList.entrySet().iterator();     
    while (itr.hasNext ())
    {
      Map.Entry mapEntry = (Map.Entry)itr.next(); 
      int handId =  (Integer)mapEntry.getKey();
      ArrayList<PVector> vecList = (ArrayList<PVector>)mapEntry.getValue();
      PVector p;
      PVector p2d = new PVector();

      playerDoraemon.play();

      //******************BACKGROUND CONTROL BEGINS************
      pushStyle();
      p = vecList.get(0);
      context.convertRealWorldToProjective(p, p2d);
      background(p2d.x-200, p2d.x-200, p2d.x-200);
      popStyle();
      //******************BACKGROUND CONTROL ENDS**************


      stroke(userClr[ (handId - 1) % userClr.length ]);
      noFill(); 
      strokeWeight(2);        
      Iterator itrVec = vecList.iterator(); 
      beginShape();
      while ( itrVec.hasNext () ) 
      { 
        p = (PVector) itrVec.next(); 

        context.convertRealWorldToProjective(p, p2d);
        ellipse(p2d.x, p2d.y, 7, 7);
      }
      endShape();   

      stroke(userClr[ (handId - 1) % userClr.length ]);
      strokeWeight(4);
      p = vecList.get(0);
      context.convertRealWorldToProjective(p, p2d);
      ellipse(p2d.x, p2d.y, 40, 40);

      //******************CONTROL THINGS WITH POSITIONS OF HANDS*****************************

      //******************METER CONTROL BEGINS******************
      pushStyle();
      stroke(255, 160, 122);
      strokeWeight(15);
      line(15, 15, width-15, 15);
      popStyle();

      pushStyle();
      stroke(173, 255, 47);
      strokeWeight(12);
      line(15, 15, MeterBar, 15);
      popStyle();
      //******************METER CONTROL ENDS********************


      //******************TALKING CONTROL BEGINS****************
      textFont(font);
      pushStyle();
      textSize(22);

      //-----------------CHANGE TEXT COLOR-
      if (p2d.x<=width/2) {
        fill(255);
      } 
      else {
        fill(0);
      }

      //------------------BELOW SEA LEVEL---
      if (seaY+90>400) {
        text("Aye, who's sucking out the water??", p2d.x+60, p2d.y-40);
      }

      //------------------FLYING------
      if (p2d.y+120<seaY+90) {
        text("NOOO, I GOT AIR SICK!!", p2d.x+60, p2d.y-15);
        MeterBar+=-2;
        if (MeterBar<=15) {
          MeterBar=15;
        }
      }
      popStyle();
      //******************TALKING CONTROL ENDS******************


      //******************FISH CONTROL BEGINS******************

      //-----Catch Blue Fish!-----
      for (int BF = 0; BF < 2; BF++) { 
        image(BlueFish, xBF[BF], seaY+90+yBF[BF], 50, 30);
        xBF[BF]+=2;
        yBF[BF]+=2;
        if (xBF[BF] > width) {
          xBF[BF] = random(-30, 600);
        }
        if (seaY+90+yBF[BF] > height) {
          yBF[BF] = random(seaY+90);
        }
        if (p2d.y>seaY+100) {
          if (p2d.x<=xBF[BF] && p2d.x+130>=xBF[BF]+50 && p2d.y<=seaY+90+yBF[BF]+30 && p2d.y+120>=seaY+90+yBF[BF]) {
            MeterBar=MeterBar+20;
            xBF[BF]=random(-30, 600);
            yBF[BF]=random(seaY+90);
            if (MeterBar>=width-70) {
              image(Fireworks, 0, 0, width, height);
              if (MeterBar>=width-15) {
                MeterBar=width-15;
              }
            }
          }
        }
      }

      //-----Catch Orange Fish!-----
      for (int OF=0; OF<3; OF++) {
        image(OrangeFish, xOF[OF], seaY+90+yOF[OF], 50, 30);
        xOF[OF]+=2;
        yOF[OF]+=2;
        if (xOF[OF] > width) {
          xOF[OF] = random(-30, 600);
        }
        if (seaY+90+yOF[OF] > height) {
          yOF[OF] = random(seaY+90);
        }
        if (p2d.y>seaY+100) {
          if (p2d.x<=xOF[OF] && p2d.x+130>=xOF[OF]+50 && p2d.y<=seaY+90+yOF[OF]+30 && p2d.y+120>=seaY+90+yOF[OF]) {
            MeterBar=MeterBar+20;
            xOF[OF]=random(-30, 600);
            yOF[OF]=random(seaY+90);
            ;
            if (MeterBar>=width-70) {
              image(Fireworks, 0, 0, width, height);
              if (MeterBar>=width-15) {
                MeterBar=width-15;
              }
            }
          }
        }
      }  

      //-----Catch Pink Fish!-----
      for (int PF=0; PF<3; PF++) {
        image(PinkFish, xPF[PF], seaY+90+yPF[PF], 50, 30);
        xPF[PF]+=2;
        yPF[PF]+=2;
        if (xPF[PF] > width) {
          xPF[PF] = random(-30, 600);
        }
        if (seaY+90+yPF[PF] > height) {
          yPF[PF] = random(seaY+90);
        }
        if (p2d.y>seaY+100) {
          if (p2d.x<=xPF[PF] && p2d.x+130>=xPF[PF]+50 && p2d.y<=seaY+90+yPF[PF]+30 && p2d.y+120>=seaY+90+yPF[PF]) {
            MeterBar=MeterBar+20;
            xPF[PF]=random(-30, 600);
            yPF[PF]=random(seaY+90);
            if (MeterBar>=width-70) {
              image(Fireworks, 0, 0, width, height);
              if (MeterBar>=width-15) {
                MeterBar=width-15;
              }
            }
          }
        }
      }  

      //******************FISH CONTROL ENDS******************


      //******************SHIP CONTROL BEGINS*******************
      image(submarine, p2d.x, p2d.y, 130, 120);
      //******************SHIP CONTROL ENDS*********************

      //******************SEA CONTROL BEGINS********************
      pushStyle();
      noStroke();
      fill(64, 224, 208, 150);
      rect(0, seaY+90, width, 1000);
      popStyle();

      pushStyle();
      noFill();
      strokeWeight(5);
      stroke(0, 206, 209);

      /////////////////////////STILL SEA LINE BEGINS//
      beginShape();
      vertex(seaX1+52.0, 362.0);
      bezierVertex(seaX1+52.0, 362.0, seaX1+52.0, 362.0, seaX1+52.0, 362.0);
      bezierVertex(seaX1+52.0, 362.0, seaX1+104.0, 299.0, seaX1+169.0, 358.0);
      bezierVertex(seaX1+234.0, 417.0, seaX1+300.0, 250.0, seaX1+395.0, 351.0);
      bezierVertex(seaX1+490.0, 452.0, seaX1+540.0, 326.0, seaX1+529.0, 348.0);
      endShape();

      beginShape();
      vertex(seaX2+52.0, 362.0);
      bezierVertex(seaX2+52.0, 362.0, seaX2+52.0, 362.0, seaX2+52.0, 362.0);
      bezierVertex(seaX2+52.0, 362.0, seaX2+104.0, 299.0, seaX2+169.0, 358.0);
      bezierVertex(seaX2+234.0, 417.0, seaX2+300.0, 250.0, seaX2+395.0, 351.0);
      bezierVertex(seaX2+490.0, 452.0, seaX2+540.0, 326.0, seaX2+529.0, 348.0);
      endShape();

      beginShape();
      vertex(seaX3+52.0, 362.0);
      bezierVertex(seaX3+52.0, 362.0, seaX3+52.0, 362.0, seaX3+52.0, 362.0);
      bezierVertex(seaX3+52.0, 362.0, seaX3+104.0, 299.0, seaX3+169.0, 358.0);
      bezierVertex(seaX3+234.0, 417.0, seaX3+300.0, 250.0, seaX3+395.0, 351.0);
      bezierVertex(seaX3+490.0, 452.0, seaX3+540.0, 326.0, seaX3+529.0, 348.0);
      endShape();
      /////////////////////////STILL SEA LINE ENDS//

      beginShape();
      vertex(seaX1+2.0, 162.0+seaY);
      bezierVertex(seaX1+2.0, 162.0+seaY, seaX1+2.0, 162.0+seaY, seaX1+2.0, 162.0+seaY);
      bezierVertex(seaX1+2.0, 162.0+seaY, seaX1+54.0, 99.0+seaY, seaX1+119.0, 158.0+seaY);
      bezierVertex(seaX1+184.0, 217.0+seaY, seaX1+250.0, 50.0+seaY, seaX1+345.0, 151.0+seaY);
      bezierVertex(seaX1+440.0, 252.0+seaY, seaX1+490.0, 126.0+seaY, seaX1+479.0, 148.0+seaY);
      endShape();

      beginShape();
      vertex(seaX2+2.0, 162.0+seaY);
      bezierVertex(seaX2+2.0, 162.0+seaY, seaX2+2.0, 162.0+seaY, seaX2+2.0, 162.0+seaY);
      bezierVertex(seaX2+2.0, 162.0+seaY, seaX2+54.0, 99.0+seaY, seaX2+119.0, 158.0+seaY);
      bezierVertex(seaX2+184.0, 217.0+seaY, seaX2+250.0, 50.0+seaY, seaX2+345.0, 151.0+seaY);
      bezierVertex(seaX2+440.0, 252.0+seaY, seaX2+490.0, 126.0+seaY, seaX2+479.0, 148.0+seaY);
      endShape();

      beginShape();
      vertex(seaX3+2.0, 162.0+seaY);
      bezierVertex(seaX3+2.0, 162.0+seaY, seaX3+2.0, 162.0+seaY, seaX3+2.0, 162.0+seaY);
      bezierVertex(seaX3+2.0, 162.0+seaY, seaX3+54.0, 99.0+seaY, seaX3+119.0, 158.0+seaY);
      bezierVertex(seaX3+184.0, 217.0+seaY, seaX3+250.0, 50.0+seaY, seaX3+345.0, 151.0+seaY);
      bezierVertex(seaX3+440.0, 252.0+seaY, seaX3+490.0, 126.0+seaY, seaX3+479.0, 148.0+seaY);
      endShape();

      seaX1+=5;
      seaX2+=5;
      seaX3+=5;
      seaY=p2d.y;

      if (seaX1>width) {
        seaX1=seaX3-467;
      }
      if (seaX2>width) {
        seaX2=seaX1-467;
      }
      if (seaX3>width) {
        seaX3=seaX2-467;
      }
      popStyle();
      //******************SEA CONTROL ENDS**********************

      //******************CONTROL THINGS WITH POSITIONS OF HANDS*****************************
    }
  } 
  else {
    pushStyle();
    textFont(font);
    textSize(48);
    fill(R, G, B);
    text("Wave hands at Kinect", width/2, height/2-80);
    text("Let's go fishing!", width/2, height/2);
    pushStyle();
    textSize(20);
    text("Your 1st hand will control the sea level. Your 2nd hand will control the submarine", width/2, height/2-50);
    popStyle();
    StillSea();
  }
}

