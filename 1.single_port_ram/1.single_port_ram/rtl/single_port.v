module single_port #(
    parameter DEPTH = 6 , //64 (地址位宽，2^6=64深度)
    parameter WIDTH = 16  //数据位宽16bit
)(
    input               clk     ,
    input               rstn    ,
    input               ena     ,
    input               wea     ,
    input       [DEPTH-1:0] addra   ,
    input       [WIDTH-1:0] din     ,
    output reg  [WIDTH-1:0] dout
);

integer i ;
reg [WIDTH-1:0] ram_data [0 : (1<<DEPTH) - 1 ] ;
//reg [15:0] ram_data [0:63] ;

always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        // 修正：把 (1<<WIDTH) 改为 (1<<DEPTH)，匹配RAM实际深度
        for(i=0 ; i<(1<<DEPTH) ;i=i+1)
            ram_data[i] = 'd0 ;
    end else if(ena)begin
        if(wea)begin
            ram_data[addra] <= din;
        end else begin
            dout <= ram_data[addra];
        end
    end else begin
        dout <= dout ;
    end
end

endmodule
