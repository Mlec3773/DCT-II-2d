module counter (input [5:0] T1,T2,TN,
input clk,
input dif,
output time_state,
output new_size,
output save_read,
output save_write
);
reg [5:0] counter;
initial begin
    if (counter === 6'bx || counter === 6'bz) begin
        counter = TN; // Assigne TN si counter est indéfini (x ou z)
    end
    time_state = 0;
    new_size = 0;
    save_read = 0;
    save_write = 0;
end

always @(posedge clk) begin
    if(counter==1) begin 
        time_state=1; // if the counter is equal to 1, counter send a signal to change the current state
        if(dif>0)begin // update with a new value for the counter
            counter<=T2;
        end
        else
            counter<= T1;
    end
    else
        time_state=0;
    if (dif>0 && T1>=counter) begin //for case where T1!=T2, signals to change the value of read and write are send to avoid an overflow
        save_read = 0    ;
    end
    else
        save_read = 1;
    if (dif<0 && T2>=counter) begin
        save_write   = 0    ;
    end
    else
        save_write = 1;
    if(counter==2) begin //if the counter is equal to 2, we anticipate the change in size one turn in advance
        new_size=1;
    end
    else 
        new_size=0;
        counter <= counter - 6'd1;

end

endmodule
