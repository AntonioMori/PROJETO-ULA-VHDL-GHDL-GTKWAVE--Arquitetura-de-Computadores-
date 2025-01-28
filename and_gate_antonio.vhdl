library ieee; -- importanto biblioteca para manipulação de binários
use ieee.std_logic_1164.all;


entity teste is -- definindo a entidade ou seja quais são as portas de entrada e saída
	port (
		a : in std_logic;
		b : in std_logic;
		y : out std_logic
	);
end entity teste;

architecture comportamento_do_teste of teste is -- definindo a arquitetura ou seja, o comportamento do porta lógica teste
begin --início da arquitetura
	-- vai consistir em fazer a operação lógica AND entre as entradas input_a e input_b e atribuir o resultado à saída output_y
	y <= a and b;
end architecture comportamento_do_teste; -- fim da arquitetura




