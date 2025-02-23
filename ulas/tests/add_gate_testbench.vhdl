library IEEE;
use IEEE.std_logic_1164.all;

entity add_gate_testbench is
--vaziu
end entity add_gate_testbench;

architecture estructure_architecture of add_gate_testbench is

    -- Instanciação do componente a ser testado
    component add_gate is
        port (
            a_add_input : in std_logic;
            b_add_input  : in std_logic;
            add_carry_in  : in std_logic;
            y_add_output : out std_logic;
            add_carry_out : out std_logic
        );
    end component;

    -- Sinais para testar a porta lógica add
    signal a_signal  : std_logic := '0';
    signal b_signal  : std_logic := '0';
    signal carry_in_signal  : std_logic := '0';
    signal y_result : std_logic;
    signal carry_out_result : std_logic;

begin

    -- Mapeamento da instância do componente add para receber tal sinal
		-- input a recebe sinal a
		-- input -> signal
    instancia_add_gate: add_gate 
			port map (
				a_add_input => a_signal,
				b_add_input  => b_signal,
				add_carry_in  => carry_in_signal,
				y_add_output => y_result,
				add_carry_out => carry_out_result
    	);

    -- Processo para aplicar os estímulos
    process
    	begin
        -- Teste 1: 0 + 0 + 0 = 0 (Soma), 0 (Carry)
        a_signal <= '0'; b_signal <= '0'; carry_in_signal <= '0';
        wait for 10 ns;

        -- Teste 2: 0 + 0 + 1 = 1 (Soma), 0 (Carry)
        a_signal <= '0'; b_signal <= '0'; carry_in_signal <= '1';
        wait for 10 ns;

        -- Teste 3: 0 + 1 + 0 = 1 (Soma), 0 (Carry)
        a_signal <= '0'; b_signal <= '1'; carry_in_signal <= '0';
        wait for 10 ns;

        -- Teste 4: 0 + 1 + 1 = 0 (Soma), 1 (Carry)
        a_signal <= '0'; b_signal <= '1'; carry_in_signal <= '1';
        wait for 10 ns;

        -- Teste 5: 1 + 0 + 0 = 1 (Soma), 0 (Carry)
        a_signal <= '1'; b_signal <= '0'; carry_in_signal <= '0';
        wait for 10 ns;

        -- Teste 6: 1 + 0 + 1 = 0 (Soma), 1 (Carry)
        a_signal <= '1'; b_signal <= '0'; carry_in_signal <= '1';
        wait for 10 ns;

        -- Teste 7: 1 + 1 + 0 = 0 (Soma), 1 (Carry)
        a_signal <= '1'; b_signal <= '1'; carry_in_signal <= '0';
        wait for 10 ns;

        -- Teste 8: 1 + 1 + 1 = 1 (Soma), 1 (Carry)
        a_signal <= '1'; b_signal <= '1'; carry_in_signal <= '1';
        wait for 10 ns;

        -- Finaliza a simulação
        assert false report "Testbench add_gate executado com sucesso!" severity note;
        wait;
    end process;

end architecture estructure_architecture;
