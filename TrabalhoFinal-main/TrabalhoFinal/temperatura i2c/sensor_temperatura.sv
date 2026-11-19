module sensor_temperatura(
    input  logic clock,
    input  logic reset,
    inout  logic sda,

    output  logic scl,
    output logic [7:0] temperatura 
);


    //variaveis inteirnas
    //div_clk
    logic       clock_div_i2c;



    divisor_clock_I2C div_clk_i2c (
        .clk_in (clock),
        .clk_out (clock_div_i2c)
    );
    adt7420_reader reader(
        .clk(clock_div_i2c),
        .rst(reset),
        .sda(sda),
        .scl(scl),
        .int_part(temperatura),
        .valid()
    );



endmodule
