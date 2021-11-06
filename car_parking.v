module car_park (Weight, Entry_Exit, Enable, Level, Reject);

    input [3:0] Weight;
    input Entry_Exit, Enable;

    output reg [1:0] Level;
    output reg Reject;

    wire [3:0] Threshold [3:0];
    assign Threshold[0] = 4'b0011; // 0 - 3
    assign Threshold[1] = 4'b0111; // 4 - 7
    assign Threshold[2] = 4'b1011; // 8 - 11
    assign Threshold[3] = 4'b1111; // 12 - 15

    wire [3:0] Capacity [3:0];
    assign Capacity[0] = 4'b1111;
    assign Capacity[1] = 4'b1111;
    assign Capacity[2] = 4'b1111;
    assign Capacity[3] = 4'b1111;
    
    always @(posedge Enable) begin
        Reject <= 1'b0;
        if(Entry_Exit == 1'b1) begin
            if(Weight <= Threshold[0]) begin
                Level <= 2'b00;
                if(Capacity[0] != 4'b0000) begin
                    Capacity[0] = Capacity[0] - 1;
                end
                else begin
                    Reject <= 1'b1;
                end
            end
            else if(Weight <= Threshold[1]) begin
                Level <= 2'b01;
                if(Capacity[1] != 4'b0000) begin
                    Capacity[1] = Capacity[1] - 1;
                end
                else begin
                    Reject <= 1'b1;
                end
            end
            else if(Weight <= Threshold[2]) begin
                Level <= 2'b10;
                if(Capacity[2] != 4'b0000) begin
                    Capacity[2] = Capacity[2] - 1;
                end
                else begin
                    Reject <= 1'b1;
                end
            end
            else if(Weight <= Threshold[3]) begin
                Level <= 2'b11;
                if(Capacity[3] != 4'b0000) begin
                    Capacity[3] = Capacity[3] - 1;
                end
                else begin
                    Reject <= 1'b1;
                end
            end
        end
        else begin
            if(Weight <= Threshold[0]) begin
                Level <= 2'b00;
                if(Capacity[0] != 4'b1111) begin
                    Capacity[0] = Capacity[0] + 1;
                end
            end
            else if(Weight <= Threshold[1]) begin
                Level <= 2'b01;
                if(Capacity[1] != 4'b1111) begin
                    Capacity[1] = Capacity[1] + 1;
                end
            end
            else if(Weight <= Threshold[2]) begin
                Level <= 2'b10;
                if(Capacity[2] != 4'b1111) begin
                    Capacity[2] = Capacity[2] + 1;
                end
            end
            else if(Weight <= Threshold[3]) begin
                Level <= 2'b11;
                if(Capacity[3] != 4'b1111) begin
                    Capacity[3] = Capacity[3] + 1;
                end
            end
        end
    end

endmodule