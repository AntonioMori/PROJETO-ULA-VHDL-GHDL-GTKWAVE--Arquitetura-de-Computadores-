--importa��o das bibs necess�rias para a manipula��o de bin�rios
library ieee;
use ieee.std_logic_1164.all;

--defini��o da interface com o mundo exterior
entity xor_gate_antonio is
	port (
		a_xor_input : in std_logic;
		b_xor_input : in std_logic;
		y_xor_output : out std_logic
	);
end entity xor_gate_antonio;

--defini��o da arquitetura, ou seja comportamento e funcionamento do circuito
architecture data_flow of xor_gate_antonio is
begin
	--opera��o l�gica XOR entre as entradas a e b e atribui��o do resultado � sa�da y
	y_xor_output <= a_xor_input xor b_xor_input;
end architecture data_flow;