-- importanto biblioteca para manipula��o de bin�rios
library ieee;
use ieee.std_logic_1164.all;


entity and_gate_antonio is -- definindo a entidade ou seja quais s�o as portas de entrada e sa�da
	port (
		a_input : in std_logic;
		b_input : in std_logic;
		y_output : out std_logic
	);
end entity and_gate_antonio;

architecture comportamento_do_teste of and_gate_antonio is -- definindo a arquitetura ou seja, o comportamento do porta l�gica teste
begin --in�cio da arquitetura
	-- vai consistir em fazer a opera��o l�gica AND entre as entradas input_a e input_b e atribuir o resultado � sa�da output_y
	y_output <= a_input and b_input;
end architecture comportamento_do_teste; -- fim da arquitetura




