-- Importação de bibliotecas
library ieee;
use ieee.std_logic_1164.all;

-- Definição da entidade de testbench
entity or_gate_testbench is
end entity or_gate_testbench;

-- Arquitetura do testbench
architecture estructure_architecture of or_gate_testbench is
	
    -- Instanciação do componente a ser testado
	component or_gate
		port (
			a_or_input : in std_logic;
			b_or_input : in std_logic;
			y_or_output : out std_logic
		);
	end component;
	
	-- Sinais para testar a porta AND
	signal a_signal, b_signal, y_result : std_logic;

begin
	-- Mapeamento da instância do componente AND
	instancia_or_gate: or_gate 
		port map (
          a_or_input => a_signal, 
          b_or_input => b_signal, 
          y_or_output => y_result
		);
		          
	-- Processo para gerar os estímulos de entrada
	process 
	begin
		-- Teste de valores desconhecidos
		a_signal <= 'X';
		b_signal <= 'X';
		wait for 10 ns;
		
		-- Teste 0 OR 0 (esperado: 0)
		a_signal <= '0';
		b_signal <= '0';
		wait for 10 ns;

		-- Teste 0 OR 1 (esperado: 1)
		a_signal <= '0';
		b_signal <= '1';
		wait for 10 ns;

		-- Teste 1 OR 0 (esperado: 1)
		a_signal <= '1';
		b_signal <= '0';
		wait for 10 ns;

		-- Teste 1 OR 1 (esperado: 1)
		a_signal <= '1';
		b_signal <= '1';
		wait for 10 ns;

		-- Mensagem final e parada do processo
		assert false report "Testbench or_gate executado com sucesso!" severity note;
		wait; -- Pausa a simulação
	end process;

end architecture estructure_architecture;
