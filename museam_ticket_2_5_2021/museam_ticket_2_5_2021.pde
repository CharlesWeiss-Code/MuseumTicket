String day = "Wednesday";
int age = 20;
String discount = "FREEFRIDAY";
createTicket createTicket;
int price;
int a;
String[] days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Satuday"};
int i = 0;

public void setup() {
  size(400, 600);
  createTicket = new createTicket(width/2, height/2, 100);
}


public void draw() {
  background(0);
  createTicket.show();
  String done = "Your price is: " + a;
  text(done, 50, 250);
}

public void mousePressed() {
  if (isOn(createTicket.pos, createTicket.r)) {
    createTicket.end = color(0, 0, 255);
    a = evaluate();
  } else {
    createTicket.end = color(255, 0, 0);
  }
}

public boolean isOn(PVector a, float r) {
  PVector m = new PVector(mouseX, mouseY);
  boolean isOn = false;
  if (m.x < a.x+r*2/3 && m.x > a.x-r*2/3 && m.y > a.y-r && m.y < a.y+r) {
    isOn = true;
  }
  return isOn;
}

public int evaluate() {
  if (!day.equals("Saturday") || !day.equals("Sunday")) {
    // weekday
    if (age <= 18) {
      price = 5;
    } else if (age > 18) {
      price = 20;
    }
  } else if (day.equals("Friday") && discount.equals("FREEFRIDAY")) {
    // friday
    price = 0;
  } else {
    // weekend
    price = 200;
  }
  return price;
}

public void keyPressed() {
  int i = whatDay();
  if (key == 'w') {
    age++;
    a = evaluate();
  } else if (key == 's') {
    age--;
    a = evaluate();
  }
  if (key == 'a') {
    i++;
    if (i > 6) {
      i = 6;
    }
    day = days[i];
    a = evaluate();
  } else if (key == 'd') {
    i--;
    if (i < 0) {
      i = 0;
    }
    day = days[i];
    a = evaluate();
  }
}

public int whatDay() {
  int r = 0;
  for (int i = 0; i < days.length; i++) {
    if (day == days[i]) {
      r = i;
    }
  }
  return r;
}
