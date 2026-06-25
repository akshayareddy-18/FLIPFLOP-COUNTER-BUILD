`timescale 1ns/1ps

module flipflop_counter_tb;

reg D;
reg clk;
reg reset;

wire Q;
wire [3:0] count;

d_flipflop FF(
    .D(D),
    .clk(clk),
    .Q(Q)
);

counter C1(
    .clk(clk),
    .reset(reset),
    .count(count)
);

always #5 clk = ~clk;

initial
begin

clk=0;
reset=1;
D=0;

#10 reset=0;

D=1;
#10;

D=0;
#10;

D=1;
#30;

$finish;

end

initial
begin
$monitor("Time=%0t D=%b Q=%b Count=%b",
          $time,D,Q,count);
end

endmodule
