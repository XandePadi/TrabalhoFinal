/* 
Teclado via protocolo PS/2(paraconfiguração)
VGA para apresentação do setpoint e grafico de monioramento
UART para geração de alarme e mensagens de status

SOBRE O CÓDIGO:
- Após o reset iniciar o setpointde emp em 25 e uma faixa de histerese
mais ou menos 1C;
- Sistema de monitoramento deverá permitir, pelo teclado, a config
de um novo setpoint. a faixa deve se ajustar com a atualização;
-toda vez que o set pint for congigurado, este registro de log 
deverá ser feito através da porta UART (DUVIDA: registro do log);
-DisplaY analisa se esta abaixo acima ou dentro da faixa;
-Monior VGA apresentar valor da temperatura, grafico de temp em 
função do tempo,set point e status de monitoramento do sistema
(DUVIDA: o que são esses status);
-grafico pegar 100 pontos de medida, cada dado novo devera ser subsituido
-Mensagem de emp maxima e minima via log pela UART;


*/