--importa��o de bibs
library ieee;
use ieee.std_logic_1164.all;

--definindo a entidade para a conex�o com o mundo exteriuor
entity and_gate is
	port (
		a_and_input : in std_logic;
		b_and_input : in std_logic;
		y_and_output : out std_logic
	);
end entity and_gate;

--definindo a arquitetura data_flow para a porta l�gica and
architecture data_flow of and_gate is
begin
	--opera��o l�gica AND entre as entradas a e b e atribui��o do resultado � sa�da y
	y_and_output <= a_and_input and b_and_input;
end architecture data_flow;