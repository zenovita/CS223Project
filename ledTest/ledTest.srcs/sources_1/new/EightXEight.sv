`timescale 1ns / 1ps

module EightXEight(input logic clk,
              input logic x,
              input logic [2:0] y,
              input logic [2:0] walls,
              input logic [7:0] wallLogic,
              output logic sh_cp, st_cp, reset, ds, oe,
              output logic[7:0] rows);

    //this part is for declaring which array number is which color.
    logic [23:0] matrix ;
    logic [7:0] red, green, blue;
    assign matrix[23:16] = red;
    assign matrix[15:8]  = green;
    assign matrix[7:0]   = blue;
    
    // these parts are taken from Alper Sahistan's code.
    logic f;
    logic e;
    
    logic [7:0] counter=0;
    logic [8:0] index = 3; //i
    logic [7:0] frame = 0; //d
    logic [2:0] rowNum= 0; //a
    
    always @(posedge clk)
        counter = counter+1;
    
    assign f = counter[7];
    assign e =~f;
    
    always @(posedge e)
        index = index +1;
    
    always_comb
    begin
        if (index<4) 
            reset=0;
       else
            reset=1;
    
    
        if (index>3 && index<28) 
              ds=matrix[index-4];
        else 
            ds=0;
    
        if (index<28)
          begin
              sh_cp=f;                
              st_cp=e;
          end
	   else
         begin
           sh_cp=0;
           st_cp=1;
         end
    end
     
    // this logic changes the frame
    always@ (posedge f)
    begin
        if (index>28 && index<409)
            oe<=0;
	else
            oe<=1;
        if (index== 410)
        begin
          rowNum <= rowNum+1;
            if (rowNum==7)
                frame <= frame+1;
        end     
    end
    
    
    //this logic increases the row number
    always_comb
    begin
        if (rowNum==0) begin 
            rows<=8'b10000000;
        end
        else if(rowNum==1)  begin
            rows<=8'b01000000;
        end
        else if (rowNum==2)  begin
            rows<=8'b00100000;
        end
        else if (rowNum==3)  begin
            rows<=8'b00010000;
        end
        else if (rowNum==4)  begin
            rows<=8'b00001000;
        end
        else if (rowNum==5)  begin
            rows<=8'b00000100;
        end
        else if (rowNum==6)  begin
            rows<=8'b00000010;
        end
        else if (rowNum==7) begin
            rows<=8'b00000001;
        end
        else
            rows<=8'b00000000;

       // this part is written by Alper Kilicaslan.
       //WALLS AND CAR
       case(wallLogic)
            0:begin
               if(rowNum==0)
               begin
                 for (int i =0; i<8 ; i++)
                     begin
                        if(i==walls)
                            red[i]=1;
                        else
                           red[i]=0;
                    end
                end
               
                else if(rowNum==3)
                begin
                    for(int i = 0; i<8;i++)
                    begin
                        if(i == walls)
                            red[i]=1;
                        else
                            red[i]=0;
                    end
                end
                
                else if(rowNum==4)
                begin
                    for(int i = 0; i<8;i++)
                    begin
                        if(i == walls)
                            red[i]=1;
                        else
                            red[i]=0;
                    end
                end
                else if(rowNum==5)
                begin
                    for(int i = 0; i<8;i++)
                    begin
                        if(i == walls)
                            red[i]=1;
                        else
                            red[i]=0;
                    end
                end
                else if(rowNum==6)
                begin
                    for(int i = 0; i<8;i++)
                    begin
                        if(i == walls)
                            red[i]=1;
                        else
                            red[i]=0;
                    end
                end
                else if(rowNum==7)
                begin
                    for(int i = 0; i<8;i++)
                    begin
                        if(i == walls)
                            red[i]=1;
                        else
                            red[i]=0;
                    end
                end
                                                                                               
                else
                begin
                   for (int i =0; i<8 ; i++)
                   begin
                      red[i]=0;
                   end
                end
            end
            
            
            1:begin 
               if(rowNum==0)
               begin
                 for (int i =0; i<8 ; i++)
                     begin
                        if(i==walls)
                            red[i]=1;
                        else
                           red[i]=0;
                    end
                end
                           
                else if(rowNum==1)
                begin
                    for(int i = 0; i<8;i++)
                    begin
                        if(i == walls)
                            red[i]=1;
                        else
                            red[i]=0;
                    end
                end
                  else if(rowNum==4)
                begin
                    for(int i = 0; i<8;i++)
                    begin
                        if(i == walls)
                            red[i]=1;
                        else
                            red[i]=0;
                    end
                end
                    else if(rowNum==5)
                begin
                    for(int i = 0; i<8;i++)
                    begin
                        if(i == walls)
                            red[i]=1;
                        else
                            red[i]=0;
                    end
                end
                else if(rowNum==6)
                    begin
                        for(int i = 0; i<8;i++)
                        begin
                            if(i == walls)
                                red[i]=1;
                            else
                                red[i]=0;
                        end
                    end
                else if(rowNum==7)
                begin
                    for(int i = 0; i<8;i++)
                    begin
                        if(i == walls)
                            red[i]=1;
                        else
                            red[i]=0;
                    end
                end
                                           
                else
                begin
                   for (int i =0; i<8 ; i++)
                   begin
                      red[i]=0;
                   end
                end
            end
            
            
            2:begin
               if(rowNum==0)
               begin
                 for (int i =0; i<8 ; i++)
                     begin
                        if(i==walls)
                            red[i]=1;
                        else
                           red[i]=0;
                    end
                end
               
                else if(rowNum==1)
                begin
                    for(int i = 0; i<8;i++)
                    begin
                        if(i == walls)
                            red[i]=1;
                        else
                            red[i]=0;
                    end
                end
            else if(rowNum==2)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            else if(rowNum==5)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            else if(rowNum==6)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
        else if(rowNum==7)
        begin
            for(int i = 0; i<8;i++)
            begin
                if(i == walls)
                    red[i]=1;
                else
                    red[i]=0;
            end
        end
                                                               
        else
        begin
           for (int i =0; i<8 ; i++)
           begin
              red[i]=0;
           end
        end
        end
            
      3:begin
       if(rowNum==0)
       begin
         for (int i =0; i<8 ; i++)
             begin
                if(i==walls)
                    red[i]=1;
                else
                   red[i]=0;
            end
        end
                           
        else if(rowNum==1)
        begin
            for(int i = 0; i<8;i++)
            begin
                if(i == walls)
                    red[i]=1;
                else
                    red[i]=0;
            end
        end
        else if(rowNum==2)
        begin
            for(int i = 0; i<8;i++)
            begin
                if(i == walls)
                    red[i]=1;
                else
                    red[i]=0;
            end
        end
        else if(rowNum==3)
        begin
            for(int i = 0; i<8;i++)
            begin
                if(i == walls)
                    red[i]=1;
                else
                    red[i]=0;
            end
        end
        else if(rowNum==6)
        begin
            for(int i = 0; i<8;i++)
            begin
                if(i == walls)
                    red[i]=1;
                else
                    red[i]=0;
            end
        end
        else if(rowNum==7)
            begin
            for(int i = 0; i<8;i++)
            begin
            if(i == walls)
                red[i]=1;
            else
                red[i]=0;
            end
            end
            
        else
            begin
               for (int i =0; i<8 ; i++)
               begin
                  red[i]=0;
               end
           
        end
       end     
       
       
       4:begin
           if(rowNum==0)
           begin
             for (int i =0; i<8 ; i++)
                 begin
                    if(i==walls)
                        red[i]=1;
                    else
                       red[i]=0;
                end
            end
           
            else if(rowNum==1)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            else if(rowNum==2)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            else if(rowNum==3)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            else if(rowNum==4)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            else if(rowNum==5)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
                                                                                           
            else
            begin
               for (int i =0; i<8 ; i++)
               begin
                  red[i]=0;
               end
            end
        end
        
        5:begin
           if(rowNum==2)
           begin
             for (int i =0; i<8 ; i++)
                 begin
                    if(i==walls)
                        red[i]=1;
                    else
                       red[i]=0;
                end
            end
           
            else if(rowNum==3)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            else if(rowNum==4)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            else if(rowNum==5)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            else if(rowNum==6)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            else if(rowNum==7)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
                                                                                           
            else
            begin
               for (int i =0; i<8 ; i++)
               begin
                  red[i]=0;
               end
            end
        end
       
        6:begin
           if(rowNum==0)
           begin
             for (int i =0; i<8 ; i++)
                 begin
                    if(i==walls)
                        red[i]=1;
                    else
                       red[i]=0;
                end
            end
           
            else if(rowNum==2)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            else if(rowNum==4)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            
            else if(rowNum==7)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
                                                                                           
            else
            begin
               for (int i =0; i<8 ; i++)
               begin
                  red[i]=0;
               end
            end
        end
       
        7: begin
           if(rowNum==0)
           begin
             for (int i =0; i<8 ; i++)
                 begin
                    if(i==walls)
                        red[i]=1;
                    else
                       red[i]=0;
                end
            end
           
            else if(rowNum==3)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            else if(rowNum==4)
            begin
                for(int i = 0; i<8;i++)
                begin
                    if(i == walls)
                        red[i]=1;
                    else
                        red[i]=0;
                end
            end
            
                                                                                           
            else
            begin
               for (int i =0; i<8 ; i++)
               begin
                  red[i]=0;
               end
            end
        end
      endcase     
      
      //CAR
       if(rowNum == (y)) begin  
       for (int i =0; i<8 ; i++)
           begin
            
            if (i == (x))
                green[i] = 1;
            else
                green[i] = 0;
            
           end
       end
       else
         begin
            for (int i =0; i<8 ; i++)
            begin
               green[i] = 0;
            end
         end  
   end
endmodule