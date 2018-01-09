import processing.video.*;

Capture video;

int CAMERA_WINDOW_HEIGHT = displayHeight/2;
int CAMERA_WINDOW_WIDTH = displayWidth/2;
int OUTPUT_WINDOW_WIDTH = 1280;
int OUTPUT_WINDOW_HEIGHT = 960;

static final int REFRESH_RATE = 1000;
static final int GRANULARITY = 8;

void settings() {
  fullScreen();
}

void setup() {
  video = new Capture(this, displayWidth/2, displayHeight/2);
  video.start();
  background(0);
  frameRate(500);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  for (int i = 0; i < REFRESH_RATE; i++) {
    float x = random(displayWidth/2);
    float y = random(displayHeight/2);
    color c = video.get(int(x), int(y));

    map(x, 0, displayWidth/2, 0, OUTPUT_WINDOW_WIDTH);
    map(y, 0, displayHeight/2, 0, OUTPUT_WINDOW_HEIGHT);

    fill(c);
    noStroke();
    ellipse(displayWidth/2 - OUTPUT_WINDOW_WIDTH/2 + x, displayHeight/2 - OUTPUT_WINDOW_HEIGHT/2 + y, 
            GRANULARITY, GRANULARITY);
  }
  
  filter(GRAY);
}