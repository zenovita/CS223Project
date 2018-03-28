`timescale 1ns / 1ps

module GameClass(input logic up, down, clk, showHighScore,
             output logic sh_cp, st_cp, reset, DS, OE,
             output logic [7:0] rows,
             output logic a, b, c, d, e, f, g, dp,
             output logic [3:0] an);
    // these parts are modified by Alper Kilicaslan.
    // related to obtaining the walls.
    logic [2:0] wallx=7;
    logic [7:0] Otype=0;
    logic [2:0] OtypeNext = 0; 
    logic [2:0] wallxNext = 7;
    logic clk_en;
    logic gameOver=1;
    
    // related to moving the dinosaur
    logic  [2:0] y = 1;
    logic  [2:0] yNext  = 1;
    
    // these parts are taken from Alper Sahistan's code.
    // related to score measurement
    logic [30:0] count = 0;
    logic [30:0] D = 20000000;
    logic [30:0] DNext = 20000000;  
    logic [13:0] score=0;
    logic [13:0] scoreNext=0;
    logic [13:0] highScore=0;
    logic [13:0] toSevSeg=0;
    logic [3:0] difficultyCounter=0;
    logic [3:0] difficultyCounterNext=0;
    
    // random state selection to get a random stage
    logic [30:0] randomSeed= 30'b10010010110101011101001001010; // it contains random binary numbers 
    logic [5:0] index = 1; // which state we are using from our random state number array
    
    // creating objects
    EightXEight displayer(clk, x, y, wallx,Otype, sh_cp, st_cp, reset, DS, OE, rows);
    sevSeg4digit scoreDisplay(clk, toSevSeg, a, b, c, d, e, f, g, dp, an);
    
    //a counter for random
    always@ (posedge clk) 
    begin
        count <= count + 1;
        if(index==19)
            index=1;
        else
            index++;
        if (count==D) //D: last value for counter
            count <= 30'd0; //N: length of counter
        if (count==30'd0)
            clk_en <= 1'b1;
        else
            clk_en <= 1'b0;
    end
    // 
    always@ (posedge clk)
        if (clk_en==1'b1)
        begin
            y<=yNext;
            Otype<=OtypeNext;
            wallx<=wallxNext;
            score<=scoreNext;
            difficultyCounter<=difficultyCounterNext;
            D<=DNext;    
        end
    // these parts are modified by Alper Kilicaslan.
always_ff@(posedge clk)
    begin
        if(~gameOver)
        begin
            toSevSeg<=score;
            
            //moving the car
            if ((up))
            begin
                 yNext=y+1; 
            end  
            if (down)
            begin
                 yNext=y-1;
            end
           
            // random walls
            if(wallx==0)
            begin
                scoreNext=score+1;
                difficultyCounterNext= difficultyCounter+1;
                wallxNext=7;
                OtypeNext= randomSeed[(index)]*2 + randomSeed[(index-1)] + randomSeed[(index-1)]*2 + randomSeed[(index)]*2;     // random wall algorithm. can be changed to OtypeNext +1 in order to see every single walls in the game.
            end
            else
                wallxNext = wallx-1;
        end
            
        else//Game over 
        begin
            if(up)
            begin
                // resetting everything
                scoreNext=0;
                DNext = 20000000;
                yNext=1;
                wallxNext=7;
                difficultyCounterNext=0;
             end
                
                if(highScore<score)//sets highScore
                    highScore<=score;
                if(showHighScore && gameOver)//Displays Highscore
                    toSevSeg<=highScore;
                else
                    toSevSeg<=score;
        end
        
        //timing
        if(difficultyCounter==5)//Game gets faster after each 5 points
        begin
            difficultyCounterNext=0;
            DNext=D-1000000;
        end      
    end
    
    // collision part is written by Alper Kilicaslan.
    //collisions
    always_comb
    begin
            
        case(Otype)
        0:
        begin 
            if((x==wallx && y==0) ||  (x==wallx && y==3) ||(x==wallx && y==4) ||(x==wallx && y==5) ||(x==wallx && y==6) ||(x==wallx && y==7))
                gameOver=1;
            else
                gameOver=0;
        end
        
        1:
        begin
            if((x==wallx && y==0) ||  (x==wallx && y==1) ||(x==wallx && y==4) ||(x==wallx && y==5) ||(x==wallx && y==6) ||(x==wallx && y==7))
                gameOver=1;
            else
                gameOver=0;
        end
        
        2:
        begin
            if((x==wallx && y==0) ||  (x==wallx && y==1) ||(x==wallx && y==2) ||(x==wallx && y==5) ||(x==wallx && y==6) ||(x==wallx && y==7))
                gameOver=1;
            else
                gameOver=0;
        
        end
        3:
        begin
            if((x==wallx && y==0) ||  (x==wallx && y==1) ||(x==wallx && y==2) ||(x==wallx && y==3) ||(x==wallx && y==6) ||(x==wallx && y==7))
                gameOver=1;
            else
                gameOver=0;
        end
        
        4:
        begin 
            if((x==wallx && y==0) ||  (x==wallx && y==1) ||(x==wallx && y==2) ||(x==wallx && y==3) ||(x==wallx && y==4) ||(x==wallx && y==5))
                gameOver=1;
            else
                gameOver=0;
        end
                
        5:
        begin 
            if((x==wallx && y==2) ||  (x==wallx && y==3) ||(x==wallx && y==4) ||(x==wallx && y==5) ||(x==wallx && y==6) ||(x==wallx && y==7))
                gameOver=1;
            else
                gameOver=0;
        end
                
        6:
        begin 
            if((x==wallx && y==0) ||  (x==wallx && y==2) ||(x==wallx && y==4) ||(x==wallx && y==7))
                gameOver=1;
            else
                gameOver=0;
        end
        
        7:
        begin 
            if((x==wallx && y==0) ||  (x==wallx && y==3) ||(x==wallx && y==4))
                gameOver=1;
            else
                gameOver=0;
        end
        endcase
    end
    
    
endmodule
