module mem(
input clk,rst,
input wr,rd,
input [3:0] addr,
input [7:0] Datain,
output reg [7:0] Dataout
    );

        reg [7:0]A[0:10]; 
       
        always @(posedge clk )
        begin
            if (rst)
            begin
                  A[0] <= 8'b0;
                  A[1] <= 8'b0;
                  A[2] <= 8'b0;
                  A[3] <= 8'b0;
                  A[4] <= 8'b0;
                  A[5] <= 8'b0;
                  A[6] <= 8'b0;
                  A[7] <= 8'b0;
                  A[8] <= 8'b0;
                  A[9] <= 8'b0;
            end
            else 
            
            case({wr,rd})
                2'b10: A[addr]=Datain;
                2'b01: Dataout= A[addr];
                default:Dataout = 8'bz;
            endcase       
end 

endmodule
