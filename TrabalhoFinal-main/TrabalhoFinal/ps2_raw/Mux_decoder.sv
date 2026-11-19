module mux_decoder (
    input  logic [2:0] contador,

    input  logic [7:0] AN_pos0,
    input  logic [7:0] AN_pos1,
    input  logic [7:0] AN_pos2,
    input  logic [7:0] AN_pos3,
    input  logic [7:0] AN_pos4,
    input  logic [7:0] AN_pos5,
    input  logic [7:0] AN_pos6,
    input  logic [7:0] AN_pos7,

    output logic [7:0] display // Saída dos segmentos
);

    logic [7:0] valor;

    // Seleciona o scancode da posição atual
    always_comb begin
        case (contador)
            3'b000: valor = AN_pos0;
            3'b001: valor = AN_pos1;
            3'b010: valor = AN_pos2;
            3'b011: valor = AN_pos3;
            3'b100: valor = AN_pos4;
            3'b101: valor = AN_pos5;
            3'b110: valor = AN_pos6;
            3'b111: valor = AN_pos7;
            default: valor = 8'h00;
        endcase
    end

    // Decodifica para Display de 7 segmentos 
    always_comb begin
        case (valor)
            //NÚMEROS
            8'h45: display = 8'b1000_0001; // '0'
            8'h16: display = 8'b1100_1111; // '1'
            8'h1E: display = 8'b1001_0010; // '2'
            8'h26: display = 8'b10000110; // '3'
            8'h25: display = 8'b11001100; // '4'
            8'h2E: display = 8'b10100100; // '5'
            8'h36: display = 8'b10100000; // '6'
            8'h3D: display = 8'b10001111; // '7'
            8'h3E: display = 8'b10000000; // '8'
            8'h46: display = 8'b10000100; // '9'
            //falta o enter
            //quando a pessoa digitar enter é quando envia a mensagem

            default: display = 8'b1111_1111; // Apagado, reset
        endcase
    end

endmodule