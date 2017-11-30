import processing.video.*;

Capture video;

int OUTPUT_WINDOW_WIDTH = 1280;
int OUTPUT_WINDOW_HEIGHT = 960;

static final int REFRESH_RATE = 1000;
static final int GRANULARITY = 10;

void settings() {
  size(OUTPUT_WINDOW_WIDTH, OUTPUT_WINDOW_HEIGHT);
}

void setup() {
  video = new Capture(this, OUTPUT_WINDOW_WIDTH, OUTPUT_WINDOW_HEIGHT);
  video.start();
  background(0);
  frameRate(500);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  for (int i = 0; i < REFRESH_RATE; i++) {
    float x = random(OUTPUT_WINDOW_WIDTH);
    float y = random(OUTPUT_WINDOW_HEIGHT);
    color c = video.get(int(x), int(y));

    fill(c);
    noStroke();
    ellipse(x, y, GRANULARITY, GRANULARITY);
  }
}