// Picross For Processing
// Written by 144a
//
// Written from code ripped directly from my minesweeper clone, Because I am way to lazy
// and that code worked pretty well, to be honest.
// Using this as a base to create a nanogram Solver (Hopefully. Maybe)

// Rushed to be made, so dont expect too much in the way of convinience

// Font data for drawing numbers
// Don't bother trying to change this unless you really want to
int[][][] numdata = {{{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0}},{{0,1,1,0,0},{0,0,1,0,0},{0,0,1,0,0},{0,0,1,0,0},{0,0,1,0,0}},{{0,1,1,1,0},{0,0,0,1,0},{0,1,1,1,0},{0,1,0,0,0},{0,1,1,1,0}},{{0,1,1,1,0},{0,0,0,1,0},{0,1,1,1,0},{0,0,0,1,0},{0,1,1,1,0}},{{0,1,0,1,0},{0,1,0,1,0},{0,1,1,1,0},{0,0,0,1,0},{0,0,0,1,0}},{{0,1,1,1,0},{0,1,0,0,0},{0,1,1,1,0},{0,0,0,1,0},{0,1,1,1,0}},{{0,1,1,1,0},{0,1,0,0,0},{0,1,1,1,0},{0,1,0,1,0},{0,1,1,1,0}},{{0,1,1,1,0},{0,0,0,1,0},{0,0,0,1,0},{0,0,0,1,0},{0,0,0,1,0}},{{0,1,1,1,0},{0,1,0,1,0},{0,1,1,1,0},{0,1,0,1,0},{0,1,1,1,0}}, {{1,0,0,0,1},{0,1,0,1,0},{0,0,1,0,0},{0,1,0,1,0},{1,0,0,0,1}}};

// Holding data for the column and row data
// Temporary for testing purposes
int[][] cols = {{6}, {8}, {1,4}, {2,4}, {2,1}, {4}, {5}, {1, 6}, {1, 1}, {4}};
int[][] rows = {{3}, {1,1}, {5,1,1}, {1,4,1}, {2,3}, {2,3}, {4,2}, {4,3}, {4}, {5}};

// Data structure for storing inputted data for puzzle solving
int[][] field = new int[cols.length][rows.length];

// I mean, gotta make everything scalable, right?
int scale = 5;

final int FIELD_WIDTH = 10;
final int FIELD_HIEGHT = 10;

// Global variable to keep rendering in check
int maxColLength = 0;
int maxRowLength = 0;

boolean refreshGrid = true;

void setup() {
  size(100, 100);
  background(255);
  
  
  // Calculate Max Row and Column length for displaying clues
  for(int i = 0; i < cols.length; i++) {
    if(cols[i].length > maxColLength) {
      maxColLength = cols[i].length;
    }
  }
  for(int i = 0; i < rows.length; i++) {
    if(rows[i].length > maxRowLength) {
      maxRowLength = rows[i].length;
    }
  }
  
  // Why this works, I have no idea
  surface.setSize(10 * scale * FIELD_WIDTH + 1 + 10 * scale * maxRowLength, 10 * scale * FIELD_HIEGHT + 1 + 10 * scale * maxColLength);
  stroke(0);
  
}

void draw() {
  background(255);
  // Draws grid every frame (will change later)
  drawGrid(10 * scale * maxRowLength, 10 * scale * maxColLength);
  drawClues();
  
  // spriteDraw(numdata[3], 5, 5);
  
  // Mouse logic for selecting given tiles
  if (mousePressed && (mouseButton == LEFT)) {
    // Select tile as solid square (if possible)
    println(mouseX / (10 * scale) + " " + mouseY / (10 * scale));
    // spriteDraw(numdata[3], mouseX / (10 * scale), mouseY / (10 * scale));
    
    // Check to make sure check location and ensure we are not going out of bounds
    if((mouseX / (10 * scale) >= maxRowLength && (mouseX / (10 * scale) < maxRowLength + FIELD_WIDTH)) && (mouseY / (10 * scale) >= maxColLength) && (mouseY / (10 * scale) < maxColLength + FIELD_HIEGHT)) {
      field[mouseX / (10 * scale) - maxRowLength][mouseY / (10 * scale) - maxColLength] = 9;
    }
    
    
  } else if (mousePressed && (mouseButton == RIGHT)) {
    // Select tile as cross (if possible)
    println(mouseX / (10 * scale) + " " + mouseY / (10 * scale));
    // spriteDraw(numdata[2], mouseX / (10 * scale), mouseY / (10 * scale));
  } 
}


// Draws out clues on both rows and columns
// Currently draws from left to right and up to down, rather than the other way around
void drawClues() {
  for(int i = 0; i < cols.length; i++) {
    for(int j = 0; j < cols[i].length; j++) {
      spriteDraw(numdata[cols[i][j]], i + maxRowLength, j);
    }
    
  }
  
  for(int i = 0; i < rows.length; i++) {
    for(int j = 0; j < rows[i].length; j++) {
      spriteDraw(numdata[rows[i][j]], j, i + maxColLength);
    }
  }
}

// Function to generate Puzzle from Initial data
// Should just populate the already existing 2d Arrays for Column and Row Data
void genPuzzle(int[][] puzarr) {
  
}

void drawGrid(int shiftX, int shiftY) { 
  for(int x = 0; x < FIELD_WIDTH; x++) {
    for(int y = 0; y < FIELD_HIEGHT; y++) {
      line(x * 10 * scale + shiftX, y * 10 * scale + shiftY, (x + 1) * 10 * scale - 1 + shiftX, y * 10 * scale + shiftY);
      line(x * 10 * scale + shiftX, y * 10 * scale + shiftY, x * 10 * scale + shiftX, (y + 1) * 10 * scale - 1 + shiftY);
      
      // Update Grid with current input data
      spriteDraw(numdata[field[x][y]], x + maxRowLength, y + maxColLength);
    }
  }
  // When loops just can't finish the job
  line(FIELD_WIDTH * 10 * scale + shiftX, shiftY, FIELD_WIDTH * 10 * scale + shiftX, FIELD_HIEGHT * 10 * scale + shiftY);
  line(shiftX, FIELD_HIEGHT * 10 * scale + shiftY, FIELD_WIDTH * 10 * scale + shiftX, FIELD_HIEGHT * 10 * scale + shiftY);

   
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
