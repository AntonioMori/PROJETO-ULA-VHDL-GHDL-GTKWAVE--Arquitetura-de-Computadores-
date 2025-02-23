library IEEE;
use IEEE.std_logic_1164.all;

entity sub_gate_testbench is
end entity sub_gate_testbench;

architecture behavior of sub_gate_testbench is
    -- Declaração de sinais para conectar ao DUT (Device Under Test)
    signal a_sub_input     : std_logic := '0';
    signal b_sub_input     : std_logic := '0';
    signal sub_borrow_in   : std_logic := '0';
    signal y_sub_output    : std_logic;
    signal sub_borrow_out  : std_logic;

    -- Instanciando o DUT
    component sub_gate
        port (
            a_sub_input     : in std_logic;
            b_sub_input     : in std_logic;
            sub_borrow_in   : in std_logic;
            y_sub_output    : out std_logic;
            sub_borrow_out  : out std_logic
        );
    end component;
begin
    -- Instanciando a unidade de subtração (DUT)
    instancia_sub_gate: sub_gate
        port map (
            a_sub_input     => a_sub_input,
            b_sub_input     => b_sub_input,
            sub_borrow_in   => sub_borrow_in,
            y_sub_output    => y_sub_output,
            sub_borrow_out  => sub_borrow_out
        );

    -- Processo para estimular as entradas e observar as saídas
    stim_proc: process
    begin
        -- Teste 1: 1 - 0 (sem borrow)
        a_sub_input <= '1';
        b_sub_input <= '0';
        sub_borrow_in <= '0';
        wait for 10 ns;  -- Espera de 10 ns
        assert (y_sub_output = '1' and sub_borrow_out = '0')
        report "Erro no Teste 1: Subtração 1 - 0" severity error;

        -- Teste 2: 0 - 1 (com borrow)
        a_sub_input <= '0';
        b_sub_input <= '1';
        sub_borrow_in <= '0';
        wait for 10 ns;  -- Espera de 10 ns
        assert (y_sub_output = '1' and sub_borrow_out = '1')
        report "Erro no Teste 2: Subtração 0 - 1" severity error;

        -- Teste 3: 1 - 1 (sem borrow)
        a_sub_input <= '1';
        b_sub_input <= '1';
        sub_borrow_in <= '0';
        wait for 10 ns;  -- Espera de 10 ns
        assert (y_sub_output = '0' and sub_borrow_out = '0')
        report "Erro no Teste 3: Subtração 1 - 1" severity error;

        -- Teste 4: 0 - 0 (sem borrow)
        a_sub_input <= '0';
        b_sub_input <= '0';
        sub_borrow_in <= '0';
        wait for 10 ns;  -- Espera de 10 ns
        assert (y_sub_output = '0' and sub_borrow_out = '0')
        report "Erro no Teste 4: Subtração 0 - 0" severity error;

        -- Teste 5: 1 - 0 (com borrow in)
        a_sub_input <= '1';
        b_sub_input <= '0';
        sub_borrow_in <= '1';
        wait for 10 ns;  -- Espera de 10 ns
        assert (y_sub_output = '0' and sub_borrow_out = '0')
        report "Erro no Teste 5: Subtração 1 - 0 com borrow in" severity error;

        -- Teste 6: 1 - 1 com borrow in
        a_sub_input <= '1';
        b_sub_input <= '1';
        sub_borrow_in <= '1';
        wait for 10 ns;  -- Espera de 10 ns
        assert (y_sub_output = '1' and sub_borrow_out = '0')
        report "Erro no Teste 6: Subtração 1 - 1 com borrow in" severity error;

        -- Fim da simulação
        wait;
    end process stim_proc;
end architecture behavior;
