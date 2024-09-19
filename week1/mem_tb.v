module mem_tb();
reg clk,rst;
reg wr,rd;
reg [7:0] Datain;
reg [3:0] addr;
wire[7:0] Dataout;

mem uut(
        .clk(clk),
        .rst(rst),
        .wr(wr),
        .rd(rd),
        .addr(addr),
        .Datain(Datain),
        .Dataout(Dataout));
  
always #5 clk=~clk;
 
initial 
begin
    clk=0;
end  

integer i;
initial begin
    rst=1;
    #10 rst=0;
    for (i=0;i<11;i=i+1)
        begin
        rd=0;
        wr=1;
        addr=i;
        Datain=i;
        #10
        $display("rst:%1d \t Mode: %1d/%1d \t Address: %1d \t Datain: %1d Dataout: %1d",rst,wr,rd,addr,Datain, Dataout);
                
        #20 wr=0;
        rd=1;
        $display("rst:%1d \t Mode: %1d/%1d \t Address: %1d \t Datain: %1d Dataout: %1d",rst,wr,rd,addr,Datain, Dataout);          
        #10 ;
        end
                         
       end
endmodule
