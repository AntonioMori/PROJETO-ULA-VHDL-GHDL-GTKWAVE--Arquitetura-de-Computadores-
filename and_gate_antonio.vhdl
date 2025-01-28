library ieee; -- importanto biblioteca para manipula��o de bin�rios
use ieee.std_logic_1164.all;


entity teste is -- definindo a entidade ou seja quais s�o as portas de entrada e sa�da
	port (
		a : in std_logic;
		b : in std_logic;
		y : out std_logic
	);
end entity teste;

architecture comportamento_do_teste of teste is -- definindo a arquitetura ou seja, o comportamento do porta l�gica teste
begin --in�cio da arquitetura
	-- vai consistir em fazer a opera��o l�gica AND entre as entradas input_a e input_b e atribuir o resultado � sa�da output_y
	y <= a and b;
end architecture comportamento_do_teste; -- fim da arquitetura




