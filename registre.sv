module registre #(
    parameter WIDTH = 9
)(
    input  logic clock,
    input  logic reset,
    input  logic read,

    input  logic signed [(32*WIDTH)-1:0] data_in,
    output logic signed [(32*WIDTH)-1:0] data_reg
);

always_ff @(posedge clock) begin
    if (reset) begin
        data_reg <= '0;
    end
    else if (read) begin
        data_reg <= data_in;
    end
end

endmodule