

import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
public final static int NUM_ROWS = 20;
public final static int NUM_COLS = 20;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    //your code to declare and initialize buttons goes here
    buttons = new MSButton[NUM_ROWS][NUM_COLS];
    for(int i = 0; i < NUM_ROWS; i++)
    {
        for(int j = 0; j < NUM_COLS; j++)
        {
            buttons[i][j] = new MSButton(i, j);
        }
    } 
    bombs = new ArrayList <MSButton>();
    setBombs();
}
public void setBombs()
{
    //your code
    for(int i=1; i<=40; i++)
    {
        int bombRow = (int)(Math.random()*NUM_ROWS);
        int bombCol = (int)(Math.random()*NUM_COLS);
        if(!bombs.contains(buttons[bombRow][bombCol]))
            bombs.add(buttons[bombRow][bombCol]);
    }
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    // return true
    //for testing displayWinningMessage();

    for (int i = 0; i < bombs.size(); i++)
    {
        if (bombs.get(i).isMarked() == false)
            return false;
    }
    return true;
}
public void displayLosingMessage()
{
    //your code here
    for (int j = 6; j < 14; j++)
    {
        buttons[j][6].setLabel("Y");
        buttons[j][7].setLabel("O");
        buttons[j][8].setLabel("U");
        buttons[j][10].setLabel("L");
        buttons[j][11].setLabel("O");
        buttons[j][12].setLabel("S");
        buttons[j][13].setLabel("E");
    }
}
public void displayWinningMessage()
{
    //your code here
    for (int j = 6; j < 14; j++)
    {
        buttons[j][6].setLabel("Y");
        buttons[j][7].setLabel("O");
        buttons[j][8].setLabel("U");
        buttons[j][11].setLabel("W");
        buttons[j][12].setLabel("I");
        buttons[j][13].setLabel("N");
    }

}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        if (mouseButton == LEFT)
            clicked = true;
        if(mouseButton == RIGHT)
        {
            marked = !marked;
        }
        else if(bombs.contains(this))
            displayLosingMessage();
        else if(countBombs(r, c) > 0)
            setLabel(str(countBombs(r, c)));
        else
        {
            // if(isValid(r - 1, c - 1) && buttons[r - 1][c - 1].isClicked() == false)   
            //     buttons[r - 1][c - 1].mousePressed();
            // if(isValid(r - 1, c) && buttons[r - 1][c].isClicked() == false)   
            //     buttons[r - 1][c].mousePressed();
            // if(isValid(r - 1, c + 1) && buttons[r - 1][c + 1].isClicked() == false)   
            //     buttons[r - 1][c + 1].mousePressed();

            // if(isValid(r, c - 1) && buttons[r][c - 1].isClicked() == false)   
            //     buttons[r][c - 1].mousePressed();
            // if(isValid(r, c) && buttons[r][c].isClicked() == false)   
            //     buttons[r][c].mousePressed();
            // if(isValid(r, c + 1) && buttons[r][c + 1].isClicked() == false)   
            //     buttons[r][c + 1].mousePressed();

            // if(isValid(r + 1, c - 1) && buttons[r + 1][c - 1].isClicked() == false)   
            //     buttons[r + 1][c - 1].mousePressed();
            // if(isValid(r + 1, c) && buttons[r + 1][c].isClicked() == false)   
            //     buttons[r + 1][c].mousePressed();
            // if(isValid(r + 1, c + 1) && buttons[r + 1][c + 1].isClicked() == false)   
            //     buttons[r + 1][c + 1].mousePressed();
            for(int a = -1; a < 2; a++)
                for(int b = -1; b < 2; b++)
                    if(isValid(r + a, c + b) && buttons[r + a][c + b].isClicked() == false)
                        buttons[r + a][c + b].mousePressed();

        }
        //your code here
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
            fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        //your code here
        if ((r >= 0 && r < NUM_ROWS) && (c >= 0 && c < NUM_COLS))
            return true;
        else return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        //your code here
        // if(isValid(r - 1, c - 1) && bombs.contains(buttons[r - 1][c - 1]))
        //     numBombs ++;
        // if(isValid(r - 1, c) && bombs.contains(buttons[r - 1][c]))
        //     numBombs ++;
        // if(isValid(r - 1, c + 1) && bombs.contains(buttons[r - 1][c + 1]))
        //     numBombs ++;

        // if(isValid(r, c - 1) && bombs.contains(buttons[r][c - 1]))
        //     numBombs ++;
        // if(isValid(r, c) && bombs.contains(buttons[r][c]))
        //     numBombs ++;
        // if(isValid(r, c + 1) && bombs.contains(buttons[r][c + 1]))
        //     numBombs ++;

        // if(isValid(r + 1, c - 1) && bombs.contains(buttons[r + 1][c - 1]))
        //     numBombs ++;
        // if(isValid(r + 1, c) && bombs.contains(buttons[r - 1][c]))
        //     numBombs ++;
        // if(isValid(r + 1, c + 1) && bombs.contains(buttons[r + 1][c + 1]))
        //     numBombs ++;
        for(int a = -1; a < 2; a++)
                for(int b = -1; b < 2; b++)
                    if(isValid(r + a, c + b) && bombs.contains(buttons[r + a][c + b]))
                        numBombs++;
        return numBombs;
    }
}