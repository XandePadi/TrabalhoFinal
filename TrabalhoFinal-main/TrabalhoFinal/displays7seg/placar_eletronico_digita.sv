module placar_eletronico_digital (
    input logic clock,
    input logic reset,
    input logic [7:0]  int_part,
    input logic [7:0]  set_point,

    output logic[6:0] display,
    output logic[7:0] display_en
);

    //variáveis internas
    logic clock_div;
    logic [2:0] saida_contador;
    logic [1:0] situ;

    divisor_clock div_clk (
        .clk_in   (clock),
        .clk_out   (clock_div)
    );

    comparador comp (
        .temperatura_atual(int_part)
        .set_point(set_point)
        .situacao(situ)
    );

    modulo_contador cont(
        .clock     (clock_div),
        .reset     (reset),
        .cont_out (saida_contador)
    );

    decoder dec (
        .contador (saida_contador),
        .display_en (display_en)
    );

    mux_decoder mux (
        .contador (saida_contador),
        .situacao(situ),
        .display (display)
    );


endmodule
