// Picross For Processing
// Written by 144a
//
// Written from code ripped directly from my minesweeper clone, Because I am way to lazy
// and that code worked pretty well, to be honest.
// Using this as a base to create a nanogram Solver (Hopefully. Maybe)

// Rushed to be made, so dont expect too much in the way of convinience

// Font data for drawing numbers
// Don't bother trying to change this unless you really want to
int[][][] numdata = {{{1,1,1,1,1},{1,0,0,0,1},{1,0,0,0,1},{1,0,0,0,1},{1,1,1,1,1}},{{0,1,1,0,0},{0,0,1,0,0},{0,0,1,0,0},{0,0,1,0,0},{0,0,1,0,0}},{{0,1,1,1,0},{0,0,0,1,0},{0,1,1,1,0},{0,1,0,0,0},{0,1,1,1,0}},{{0,1,1,1,0},{0,0,0,1,0},{0,1,1,1,0},{0,0,0,1,0},{0,1,1,1,0}},{{0,1,0,1,0},{0,1,0,1,0},{0,1,1,1,0},{0,0,0,1,0},{0,0,0,1,0}},{{0,1,1,1,0},{0,1,0,0,0},{0,1,1,1,0},{0,0,0,1,0},{0,1,1,1,0}},{{0,1,1,1,0},{0,1,0,0,0},{0,1,1,1,0},{0,1,0,1,0},{0,1,1,1,0}},{{0,1,1,1,0},{0,0,0,1,0},{0,0,0,1,0},{0,0,0,1,0},{0,0,0,1,0}},{{0,1,1,1,0},{0,1,0,1,0},{0,1,1,1,0},{0,1,0,1,0},{0,1,1,1,0}}};

// I mean, gotta make everything scalable, right?
int scale = 5;

// Arrays for holding puzzle data
int[] rowData;
int[] colData;

final int FIELD_WIDTH = 20;
final int FIELD_HIEGHT = 20;

boolean refreshGrid = true;

void setup() {
  size(100, 100);
  background(255);
  surface.setSize(10 * scale * FIELD_WIDTH + 1, 10 * scale * FIELD_HIEGHT + 1);
  stroke(190,20,0);
}

void draw() {
  
  
  spriteDraw(numdata[3], 5, 5);
  
  
}

// Function to generate Puzzle from Initial data
// Should just populate the already existing 2d Arrays for Column and Row Data
void genPuzzle(int[][] puzarr) {
  
}

void drawGrid() { 
  for(int x = 0; x < FIELD_WIDTH; x++) {
    for(int y = 0; y < FIELD_HIEGHT; y++) {
      line(x * 10 * scale, y * 10 * scale, (x + 1) * 10 * scale - 1, y * 10 * scale);
      line(x * 10 * scale, y * 10 * scale, x * 10 * scale, (y + 1) * 10 * scale - 1);
    }
  }
  // When loops just can't finish the job
  line(FIELD_WIDTH * 10 * scale, 0, FIELD_WIDTH * 10 * scale, FIELD_HIEGHT * 10 * scale);
  line(0, FIELD_HIEGHT * 10 * scale, FIELD_WIDTH * 10 * scale, FIELD_HIEGHT * 10 * scale);
}

// Draws a 5x5 array at the given cursor position and scale
void spriteDraw(int[][] arr, int ix, int iy) {
  for(int i = 0; i < 5; i++) {
    for(int j = 0; j < 5; j++) {
      if(arr[j][i] != 0) {
        // point(cursorXpos * 10 * scale + i + 3, cursorYpos * 10 * scale + j + 3);
        for(int x = 0; x < scale; x++) {
          for(int y = 0; y < scale; y++) {
            point(ix * 10 * scale + i * scale + x + 3 * scale, iy * 10 * scale + j * scale + y + 3 * scale);
          }
        }
      }
    }
  }
}
