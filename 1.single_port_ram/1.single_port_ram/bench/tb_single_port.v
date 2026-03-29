module tb_single_port;
reg clk;
reg rstn;
reg en;
reg we;
reg [5:0] addr;
reg [15:0] din;
wire [15:0] dout;

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rstn = 0;
    repeat(10)@(posedge clk);
    rstn = 1;
end

initial begin
    we = 0; en = 0;
    addr = 0; din = 0;
    repeat(20) @(posedge clk);
    en = 1; #1;
    repeat(64) begin
        we = 1;
        din = addr * 10;
        #10;
        addr = addr + 1;
    end
    we = 0;
    addr = 0;
    repeat(64) begin
        #10
        addr = addr + 1;
    end
    addr = 0;
    #10
    repeat(2) @(posedge clk);
    #9;
    repeat(64) begin
        we = 1;
        din = (63 - addr)*10  ;
        #10;
        addr = addr + 1;
    end
    we = 0;
    addr = 0;
    repeat(64) begin
        #10
        addr = addr + 1;
    end
    addr = 0;
    #10
    
    repeat(10) @(posedge clk);
    $finish();
end

initial begin
    $fsdbDumpfile("single_port.fsdb");
    $fsdbDumpvars(0);
end

single_port inst_single_port(
    .clk(clk),
    .rstn(rstn),
    .en(en),
    .we(we),
    .addr(addr),
    .din(din),
    .dout(dout)
);

endmodule
