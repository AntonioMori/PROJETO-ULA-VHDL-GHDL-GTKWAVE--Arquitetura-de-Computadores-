--importação das bibs necessárias para a manipulação de binários
library ieee;
use ieee.std_logic_1164.all;

--definição da interface com o mundo exterior, como é uma testebench não temos entradas e saídas
entity xor_gate_antonio_tb is
end entity xor_gate_antonio_tb;

--definição da arquitetura, ou seja comportamento e funcionamento do circuito
architecture estructure_architecture of xor_gate_antonio_tb is
	
	--componente que será testado, referenciando o componente xor_gate_antonio
	component xor_gate_antonio
		port (
			a_xor_input : in std_logic;
			b_xor_input : in std_logic;
			y_xor_output : out std_logic
		);
	end component;

	-- agora iremos definir as variáveis referentes aos sinais dos quais poderemos atribuir valores para enviar e testar
	-- o nosso componente
	signal a_signal, b_signal : std_logic;
	signal y_xor_result : std_logic;

begin
	--descrevemos qual sinal deve ser referente a qual entrada do nosso componente de teste
	instancia_xor_gate_antonio: xor_gate_antonio port map (a_xor_input => a_signal, b_xor_input => b_signal, y_xor_output => y_xor_result);

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

		--teste 0 and 1, esperado 1 
		a_signal <= '0';
		b_signal <= '1';
		wait for 10 ns;

		--teste 1 and 0, esperado 1
		a_signal <= '1';
		b_signal <= '0';
		wait for 10 ns;

		--teste 1 and 1 , esperado 0, e carry out 1 no half adder
		a_signal <= '1';
		b_signal <= '1';
		wait for 10 ns;

		assert false report "Testbench xor_gate_antonio executado com sucesso!" severity note;
		wait; -- Isso faz com que o processo pare aqui
	end process;

end architecture estructure_architecture;
