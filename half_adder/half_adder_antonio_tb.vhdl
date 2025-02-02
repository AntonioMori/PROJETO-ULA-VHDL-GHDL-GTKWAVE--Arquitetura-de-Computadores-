library ieee;
use ieee.std_logic_1164.all;

--entidade do tb
entity half_adder_antonio_tb is
end entity half_adder_antonio_tb;

--arquitetura do tb
architecture estructure_architecture of half_adder_antonio_tb is
	--componente que será testado, referenciando o componente half_adder_antonio
	component half_adder_antonio
		port (
			a_parcela : in std_logic;
			b_parcela : in std_logic;
			sum_result : out std_logic;
			carry_result : out std_logic
		);
	end component;

	-- agora iremos definir as variáveis referentes aos sinais dos quais poderemos atribuir valores para enviar e testar
	signal a_signal, b_signal : std_logic;
	signal sum_result_signal, carry_result_signal : std_logic;

begin
	--descrevemos qual sinal deve ser referente a qual entrada do nosso componente de teste
	instancia_half_adder_antonio: half_adder_antonio port map (
		a_parcela => a_signal,
		b_parcela => b_signal,
		sum_result => sum_result_signal,
		carry_result => carry_result_signal
	);

	-- process begin evita que o processo seja executado em paralelo, garantindo a execução em sequência
	process begin
		--teste unknown values
		a_signal <= 'X';
		b_signal <= 'X';
		wait for 10 ns;
		--esperado nada

		--teste 0 and 0, s= 0 , c=0
		a_signal <= '0';
		b_signal <= '0';
		wait for 10 ns;

		--teste 0 and 1, s= 1 , c=0 
		a_signal <= '0';
		b_signal <= '1';
		wait for 10 ns;

		--teste 1 and 0, s= 1 , c=0
		a_signal <= '1';
		b_signal <= '0';
		wait for 10 ns;

		--teste 1 and 1 , s= 0 , c=1
		a_signal <= '1';
		b_signal <= '1';
		wait for 10 ns;

		assert false report "Testbench half_adder_antonio_tb executado com sucesso!" severity note;
		wait; -- Isso faz com que o processo pare aqui
	end process;

end architecture estructure_architecture;