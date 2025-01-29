-- importanto biblioteca para manipulação de binários
library ieee;
use ieee.std_logic_1164.all;


entity and_gate_antonio is -- definindo a entidade ou seja quais são as portas de entrada e saída
	port (
		a_input : in std_logic;
		b_input : in std_logic;
		y_output : out std_logic
	);
end entity and_gate_antonio;

architecture comportamento_do_teste of and_gate_antonio is -- definindo a arquitetura ou seja, o comportamento do porta lógica teste
begin --início da arquitetura
	-- vai consistir em fazer a operação lógica AND entre as entradas input_a e input_b e atribuir o resultado à saída output_y
	y_output <= a_input and b_input;
end architecture comportamento_do_teste; -- fim da arquitetura




