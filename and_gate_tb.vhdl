--testbench da porta AND 

-- importanto biblioteca para manipula��o de bin�rios
library ieee;
use ieee.std_logic_1164.all;

-- por ser uma entidade que vai testar o nosso componente end ela n�o vai receber nenhuma entrada e nem sa�da/ sinais de
-- entrada ou sa�da, ela na verdade � quem ir� simular o comportamento do nosso componente enviando os sinais de teste
entity and_gate_tb is 
end entity and_gate_tb;

-- aqui iremos definir como ser� o comportamento do nosso testbench e qual o componente que ele ir� testar
architecture comportamento_testbench of and_gate_tb is
	-- iremos testar o comportamento da entidade and_gate que � o nosso componente
	component and_gate_antonio
		port (
			a_input : in std_logic;
			b_input : in std_logic;
			y_output : out std_logic
		);
	end component;

	-- agora iremos definir as vari�veis referentes aos sinais dos quais poderemos atribuir valores para enviar e testar
	-- o nosso componente
	signal a_signal, b_signal : std_logic;
	signal y_and_result : std_logic;
	
	-- agora iremos descrever o processo que ir� simular o comportamento do nosso componente
begin
	--descrevemos qual sinal deve ser referente a qual entrada do nosso componente de teste
	instancia_and_gate: and_gate_antonio port map (a_input => a_signal, b_input => b_signal, y_output => y_and_result);
	-- a input recebe o sinal vindo do a_signal
	-- b input recebe o sinal vindo do b_signal
	-- y_output => y_and_result: A sa�da y_output do componente and_gate ser� conectada ao sinal y_and_result	
	

	-- apenas para esclarecer
	--  o mapeamento b_input => b_signal estabelece que o sinal b_signal ser� a fonte de dados para b_input dentro do componente and_gate

	-- process begin evita que o processo seja executado em paralelo, garantindo a execu��o em sequ�ncia
	process begin
		--teste unknown values
		a_signal <= 'X';
		b_signal <= 'X';
		wait for 10 ns;

		--teste 0 and 0
		a_signal <= '0';
		b_signal <= '0';
		wait for 10 ns;

		--teste 0 and 1
		a_signal <= '0';
		b_signal <= '1';
		wait for 10 ns;

		--teste 1 and 0
		a_signal <= '1';
		b_signal <= '0';
		wait for 10 ns;

		--teste 1 and 1
		a_signal <= '1';
		b_signal <= '1';
		wait for 10 ns;

		assert false report "Testbench executado!" severity note;

	end process;

end comportamento_testbench;
