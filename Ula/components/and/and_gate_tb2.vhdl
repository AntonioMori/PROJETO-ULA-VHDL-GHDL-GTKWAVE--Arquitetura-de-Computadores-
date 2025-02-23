--importação de bibs de novo não aguento mais
library ieee;
use ieee.std_logic_1164.all;

-- processo meio repetitivo mas ok
entity and_gate_tb2 is
end entity and_gate_tb2;

architecture estructure_architecture of and_gate_tb2 is
	--devemos instanciar o and_gate criado anteriormente para o teste
	component and_gate
		port (
			a_and_input : in std_logic;
			b_and_input : in std_logic;
			y_and_output : out std_logic
		);
	end component;
	
	signal a_signal, b_signal, y_result : std_logic;

	--
begin
	--instanciando o and_gate
	instancia_and_gate: and_gate port map (a_and_input => a_signal, b_and_input=> b_signal, y_and_output => y_result);
		-- process begin evita que o processo seja executado em paralelo, garantindo a execução em sequência

		process begin
			--teste unknown values
			a_signal <= 'X';
			b_signal <= 'X';
			wait for 10 ns;
			--esperado nada
	
			--teste 0 and 0, esperado 0
			a_signal <= '0';
			b_signal <= '0';
			wait for 10 ns;
	
			--teste 0 and 1, esperado 0 
			a_signal <= '0';
			b_signal <= '1';
			wait for 10 ns;
	
			--teste 1 and 0, esperado 0
			a_signal <= '1';
			b_signal <= '0';
			wait for 10 ns;
	
			--teste 1 and 1 , esperado 1, resultado carry out 
			a_signal <= '1';
			b_signal <= '1';
			wait for 10 ns;
	
			assert false report "Testbench and_gate executado com sucesso!" severity note;
			wait; --  Isso faz com que o processo pare aqui
		end process;
	
	end architecture estructure_architecture;
	

