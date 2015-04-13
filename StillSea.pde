void StillSea() {
  pushStyle();
  noStroke();
  fill(64, 224, 208, 150);
  rect(0, height/2+55, width, 250);
  popStyle();

  pushStyle();
  noFill();
  strokeWeight(5);
  stroke(0, 206, 209);

  /////////////////////////UPPER LINE BEGINS//
  beginShape();
  vertex(seaX1+2.0, 362.0);
  bezierVertex(seaX1+2.0, 362.0, seaX1+2.0, 362.0, seaX1+2.0, 362.0);
  bezierVertex(seaX1+2.0, 362.0, seaX1+54.0, 299.0, seaX1+119.0, 358.0);
  bezierVertex(seaX1+184.0, 417.0, seaX1+250.0, 250.0, seaX1+345.0, 351.0);
  bezierVertex(seaX1+440.0, 452.0, seaX1+490.0, 326.0, seaX1+479.0, 348.0);
  endShape();

  beginShape();
  vertex(seaX2+2.0, 362.0);
  bezierVertex(seaX2+2.0, 362.0, seaX2+2.0, 362.0, seaX2+2.0, 362.0);
  bezierVertex(seaX2+2.0, 362.0, seaX2+54.0, 299.0, seaX2+119.0, 358.0);
  bezierVertex(seaX2+184.0, 417.0, seaX2+250.0, 250.0, seaX2+345.0, 351.0);
  bezierVertex(seaX2+440.0, 452.0, seaX2+490.0, 326.0, seaX2+479.0, 348.0);
  endShape();

  beginShape();
  vertex(seaX3+2.0, 362.0);
  bezierVertex(seaX3+2.0, 362.0, seaX3+2.0, 362.0, seaX3+2.0, 362.0);
  bezierVertex(seaX3+2.0, 362.0, seaX3+54.0, 299.0, seaX3+119.0, 358.0);
  bezierVertex(seaX3+184.0, 417.0, seaX3+250.0, 250.0, seaX3+345.0, 351.0);
  bezierVertex(seaX3+440.0, 452.0, seaX3+490.0, 326.0, seaX3+479.0, 348.0);
  endShape();
  /////////////////////////UPPER LINE ENDS//

  /////////////////////////LOWER LINE BEGINS//
  beginShape();
  vertex(seaX1+52.0, 462.0);
  bezierVertex(seaX1+52.0, 462.0, seaX1+52.0, 462.0, seaX1+52.0, 462.0);
  bezierVertex(seaX1+52.0, 462.0, seaX1+104.0, 399.0, seaX1+169.0, 458.0);
  bezierVertex(seaX1+234.0, 517.0, seaX1+300.0, 350.0, seaX1+395.0, 451.0);
  bezierVertex(seaX1+490.0, 552.0, seaX1+540.0, 426.0, seaX1+529.0, 448.0);
  endShape();

  beginShape();
  vertex(seaX2+52.0, 462.0);
  bezierVertex(seaX2+52.0, 462.0, seaX2+52.0, 462.0, seaX2+52.0, 462.0);
  bezierVertex(seaX2+52.0, 462.0, seaX2+104.0, 399.0, seaX2+169.0, 458.0);
  bezierVertex(seaX2+234.0, 517.0, seaX2+300.0, 350.0, seaX2+395.0, 451.0);
  bezierVertex(seaX2+490.0, 552.0, seaX2+540.0, 426.0, seaX2+529.0, 448.0);
  endShape();

  beginShape();
  vertex(seaX3+52.0, 462.0);
  bezierVertex(seaX3+52.0, 462.0, seaX3+52.0, 462.0, seaX3+52.0, 462.0);
  bezierVertex(seaX3+52.0, 462.0, seaX3+104.0, 399.0, seaX3+169.0, 458.0);
  bezierVertex(seaX3+234.0, 517.0, seaX3+300.0, 350.0, seaX3+395.0, 451.0);
  bezierVertex(seaX3+490.0, 552.0, seaX3+540.0, 426.0, seaX3+529.0, 448.0);
  endShape();
  /////////////////////////LOWER LINE ENDS//

  seaX1+=5;
  seaX2+=5;
  seaX3+=5;

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
}

