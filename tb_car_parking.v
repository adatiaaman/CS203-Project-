// 
module car_park_tb ();

    reg r_entry_exit, r_enable, r_cap_en;
    reg [3:0] r_weight;
    wire [3:0] r_cap0;
    wire [3:0] r_cap1;
    wire [3:0] r_cap2;
    wire [3:0] r_cap3;
    wire r_reject;
    wire [1:0] r_level;

    integer i = 0, j = 0;

    car_park r_inst(
        .Weight(r_weight),
        .Entry_Exit(r_entry_exit), 
        .Enable(r_enable), 
        .Level(r_level), 
        .Reject(r_reject),
        .Capacity0(r_cap0),
        .Capacity1(r_cap1),
        .Capacity2(r_cap2),
        .Capacity3(r_cap3),
        .cap_enable(r_cap_en)
    );

    initial begin
        // Capacity Initialise
        r_cap_en = 1'b0;
        r_cap_en = 1'b1;
        #10;
        r_cap_en = 1'b0;
        //
        $display();
        
        // level 0 to 3 entry full capacity
        r_weight = 4'b0000;
        for(i=0; i<16; i=i+1) begin
            for(j=0; j<4; j=j+1) begin
                r_enable = 1'b0;
                r_entry_exit=1'b1;
                r_enable=1'b1;
                #10;
                if(r_reject == 1'b1) begin
                    $display("Vehicle Rejected to enter Level %1d", r_level);
                end
            end
            r_weight = r_weight + 4'b0001;
        end
        $display();

        // level 0 exit all 
        r_weight = 4'b0000;
        for(i=0; i<4; i=i+1) begin
            for(j=0; j<4; j=j+1) begin
                r_enable = 1'b0;
                r_entry_exit=1'b0;
                r_enable=1'b1;
                #10;
                if(r_reject == 1'b1) begin
                    $display("Vehicle Unavailable to exit Level %1d", r_level);
                end
            end
            r_weight = r_weight + 4'b0001;
        end
        $display();

        // level 1 exit all 
        r_weight = 4'b0100;
        for(i=0; i<4; i=i+1) begin
            for(j=0; j<4; j=j+1) begin
                r_enable = 1'b0;
                r_entry_exit=1'b0;
                r_enable=1'b1;
                #10;
                if(r_reject == 1'b1) begin
                    $display("Vehicle Unavailable to exit Level %1d", r_level);
                end
            end
            r_weight = r_weight + 4'b0001;
        end
        $display();

        // level 2 exit all 
        r_weight = 4'b1000;
        for(i=0; i<4; i=i+1) begin
            for(j=0; j<4; j=j+1) begin
                r_enable = 1'b0;
                r_entry_exit=1'b0;
                r_enable=1'b1;
                #10;
                if(r_reject == 1'b1) begin
                    $display("Vehicle Unavailable to exit Level %1d", r_level);
                end
            end
            r_weight = r_weight + 4'b0001;
        end
        $display();

        // level 3 exit all 
        r_weight = 4'b1100;
        for(i=0; i<4; i=i+1) begin
            for(j=0; j<4; j=j+1) begin
                r_enable = 1'b0;
                r_entry_exit=1'b0;
                r_enable=1'b1;
                #10;
                if(r_reject == 1'b1) begin
                    $display("Vehicle Unavailable to exit Level %1d", r_level);
                end
            end
            r_weight = r_weight + 4'b0001;
        end
        $display();

    end

    initial
    begin
      $dumpfile("car_park_gtk.vcd");
      $dumpvars;
    end

endmodule
