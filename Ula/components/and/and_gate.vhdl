--importação de bibs
library ieee;
use ieee.std_logic_1164.all;

--definindo a entidade para a conexão com o mundo exteriuor
entity and_gate is
	port (
		a_and_input : in std_logic;
		b_and_input : in std_logic;
		y_and_output : out std_logic
	);
end entity and_gate;

--definindo a arquitetura data_flow para a porta lógica and
architecture data_flow of and_gate is
begin
	--operação lógica AND entre as entradas a e b e atribuição do resultado à saída y
	y_and_output <= a_and_input and b_and_input;
end architecture data_flow;