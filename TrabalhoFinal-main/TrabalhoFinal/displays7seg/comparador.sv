module comparador (
    input logic [7:0] temperatura_atual,
    input logic [7:0] set_point,
    output logic [1:0] situacao
    );

    always_comb begin
        if (temperatura_atual <= set_point+1 && temperatura_atual >= set_point-1) begin
            situacao <= 2'b01;//dentro
        end
        else if (temperatura_atual > set_point+1)begin
            situacao <= 2'b00;//acima
        end
        else begin
            situacao <= 2'b10;//abaixo
        end
    end

endmodule