// Aman Pankaj Adatia - 2020CSB1154
// Rishabh Jain - 2020CSB1198

module car_park (Weight, Entry_Exit, Enable, Level, Reject, Capacity0, Capacity1, Capacity2, Capacity3, cap_enable);

    input [3:0] Weight;
    input Entry_Exit, Enable, cap_enable;
    output reg [3:0] Capacity0;
    output reg [3:0] Capacity1;
    output reg [3:0] Capacity2;
    output reg [3:0] Capacity3;

    output reg [1:0] Level;
    output reg Reject;

    wire [3:0] Threshold [3:0];
    assign Threshold[0] = 4'b0011; // 0 - 3
    assign Threshold[1] = 4'b0111; // 4 - 7
    assign Threshold[2] = 4'b1011; // 8 - 11
    assign Threshold[3] = 4'b1111; // 12 - 15

    // Capacity Initialise
    always @(posedge cap_enable) begin
        Capacity0 <= 4'b1111;
        Capacity1 <= 4'b1111;
        Capacity2 <= 4'b1111;
        Capacity3 <= 4'b1111;
    end


    always @(posedge Enable) begin
        Reject <= 1'b0;
        if(Entry_Exit == 1'b1) begin // entery
            if(Weight <= Threshold[0]) begin
                Level <= 2'b00;
                if(Capacity0 != 4'b0000) begin
                    Capacity0 = Capacity0 - 1;
                end
                else begin
                    Reject <= 1'b1;
                end
            end
            else if(Weight <= Threshold[1]) begin
                Level <= 2'b01;
                if(Capacity1 != 4'b0000) begin
                    Capacity1 = Capacity1 - 1;
                end
                else begin
                    Reject <= 1'b1;
                end
            end
            else if(Weight <= Threshold[2]) begin
                Level <= 2'b10;
                if(Capacity2 != 4'b0000) begin
                    Capacity2 = Capacity2 - 1;
                end
                else begin
                    Reject <= 1'b1;
                end
            end
            else if(Weight <= Threshold[3]) begin
                Level <= 2'b11;
                if(Capacity3 != 4'b0000) begin
                    Capacity3 = Capacity3 - 1;
                end
                else begin
                    Reject <= 1'b1;
                end
            end
        end
        else begin // exit
            if(Weight <= Threshold[0]) begin
                Level <= 2'b00;
                if(Capacity0 != 4'b1111) begin
                    Capacity0 = Capacity0 + 1;
                end
                else begin
                    Reject <= 1'b1;
                end
            end
            else if(Weight <= Threshold[1]) begin
                Level <= 2'b01;
                if(Capacity1 != 4'b1111) begin
                    Capacity1 = Capacity1 + 1;
                end
                else begin
                    Reject <= 1'b1;
                end
            end
            else if(Weight <= Threshold[2]) begin
                Level <= 2'b10;
                if(Capacity2 != 4'b1111) begin
                    Capacity2 = Capacity2 + 1;
                end
                else begin
                    Reject <= 1'b1;
                end
            end
            else if(Weight <= Threshold[3]) begin
                Level <= 2'b11;
                if(Capacity3 != 4'b1111) begin
                    Capacity3 = Capacity3 + 1;
                end
                else begin
                    Reject <= 1'b1;
                end
            end
        end
    end

endmodule
