module mux_decoder (
    input logic [2:0] contador,

    input logic [1:0] situacao,
    output logic [6:0] display 
);
    logic [3:0] unidade_A,
    logic [3:0] dezena_A,
    logic [3:0] centena_A,
    logic [3:0] milhar_A,
    logic [3:0] unidade_B,
    logic [3:0] dezena_B,
    logic [3:0] centena_B,
    logic [3:0] milhar_B,

    logic [3:0] valor;
    always_comb begin
        case (situacao)
            2'b00: unidade_A = 4'd0 , dezena_A = 4'd6, centena_A= 4'd5, milhar_A = 4'd2, unidade_B = 4'd0, dezena_B=4'd22, centena_B=4'd22, milhar_B=4'd22; //acima 
            2'b01: unidade_A = 4'd8 , dezena_A = 4'd9, centena_A= 4'd10, milhar_A = 4'd7, unidade_B = 4'd4, dezena_B=4'd3, centena_B=4'd22, milhar_B=4'd22; //dentro
            2'b10: unidade_A = 4'd8 , dezena_A = 4'd11, centena_A= 4'd5, milhar_A = 4'd0, unidade_B = 4'd1, dezena_B=4'd0, centena_B=4'd22, milhar_B=4'd22; // abaixo
            default: valor = 4'b0000;
        endcase
    end
    
    //seleciona o dado correto com base no contador
    always_comb begin
        case (contador)
            3'b000: valor = unidade_A;
            3'b001: valor = dezena_A;
            3'b010: valor = centena_A;
            3'b011: valor = milhar_A;
            3'b100: valor = unidade_B;
            3'b101: valor = dezena_B;
            3'b110: valor = centena_B;
            3'b111: valor = milhar_B;
            default: valor = 4'b0000;
        endcase
    end
    
    //decodifica o valor selecionado para o display de 7 segmentos
    always_comb begin
        case (valor)
            4'd0: display = 7'b0001000; // 'A'
            4'd1: display = 7'b1100000; // 'b'
            4'd2: display = 7'b0110001; // 'C'
            4'd3: display = 7'b1000010; // 'd'
            4'd4: display = 7'b0110000; // 'E'
            4'd5: display = 7'b1001111; // 'I'
            4'd6: display = 7'b1101010; // 'M'
            4'd7: display = 7'b1101010; // 'n'
            4'd8: display = 7'b0000001; // 'O'
            4'd9: display = 7'b0111001; // 'r'
            4'd10: display = 7'b0111001; // 't'
            4'd11: display = 7'b0001001; // 'X'

        default: display = 7'b1111111;
        endcase
    end
endmodule