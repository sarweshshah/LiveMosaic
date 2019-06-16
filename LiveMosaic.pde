import processing.video.*;

Capture video;

int CAMERA_WINDOW_WIDTH = 1280;
int CAMERA_WINDOW_HEIGHT = 720;

int OUTPUT_WINDOW_WIDTH = 1280;
int OUTPUT_WINDOW_HEIGHT = 720;

static final int REFRESH_RATE = 1000;
static final int GRANULARITY = 8;

void settings() {
  //fullScreen();
  size(OUTPUT_WINDOW_WIDTH, OUTPUT_WINDOW_HEIGHT);
}

void setup() {
  // Uncomment this section to check the available resolutions
  //String[] cameras = Capture.list();
  //for (int i = 0; i < cameras.length ; i++) {
  //  println(cameras[i]);
  //}

  video = new Capture(this, CAMERA_WINDOW_WIDTH, CAMERA_WINDOW_HEIGHT);
  video.start();
  background(0);
  frameRate(500);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  for (int i = 0; i < REFRESH_RATE; i++) {
    float x = random(CAMERA_WINDOW_WIDTH);
    float y = random(CAMERA_WINDOW_HEIGHT);
    color c = video.get(int(x), int(y));

    x = map(x, 0, CAMERA_WINDOW_WIDTH, 0, width);
    y = map(y, 0, CAMERA_WINDOW_HEIGHT, 0, height);

    fill(c);
    noStroke();
    ellipse(x, y, GRANULARITY, GRANULARITY);
  }

  filter(POSTERIZE, 230); // Select from GRAY, INVERT, POSTERIZE, ERODE
}
