module tb_dff;
    reg clk;
    reg d;
    reg rstn;
    reg [2:0] delay;

    integer i;

    dff dff0 ( .d(d),
                .rstn(rstn),
                .clk(clk),
                .q(q));

    always #10 clk = ~clk;

    initial begin
        clk <= 0;
        d <= 0;
        rstn <= 0;

        #15 d <= 1;
        #10 rstn <= 1;
        for ( i = 0 ; i < 5 ; i = i + 1) begin
            delay = $random;
            #(delay) d <= 1;
        end

        #40 $finish;
    end

    initial begin
        $dumpfile("d_ff_wave.vcd");
        $dumpvars(0, tb_dff);
    end

endmodule