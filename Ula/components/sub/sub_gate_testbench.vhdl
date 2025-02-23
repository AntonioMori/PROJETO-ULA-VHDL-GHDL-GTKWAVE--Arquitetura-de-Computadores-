library IEEE;
use IEEE.std_logic_1164.all;

entity sub_gate_testbench is
end entity sub_gate_testbench;

architecture behavior of sub_gate_testbench is
    -- Sinais para conectar ao DUT
    signal a_sub_input     : std_logic := '0';
    signal b_sub_input     : std_logic := '0';
    signal sub_borrow_in   : std_logic := '0';
    signal y_sub_output    : std_logic;
    signal sub_borrow_out  : std_logic;

    -- Declaração do DUT
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
    instancia_sub_gate: sub_gate
        port map (
            a_sub_input    => a_sub_input,
            b_sub_input    => b_sub_input,
            sub_borrow_in  => sub_borrow_in,
            y_sub_output   => y_sub_output,
            sub_borrow_out => sub_borrow_out
        );

stim_proc: process
    begin
        -- Teste 1: 1 - 0 (subtração correta via complemento de dois)
        -- Minuendo: 1, Subtraendo: 0, Borrow In: 1 (complemento de dois)
        -- Diferença esperada: 1, Borrow Out esperado: 0
        a_sub_input <= '1';
        b_sub_input <= '0';
        sub_borrow_in <= '1';  -- +1 para complemento de dois
        wait for 10 ns;
        assert (y_sub_output = '1' and sub_borrow_out = '0')
            report "Erro no Teste 1: subtracao 1 - 0" severity error;


        -- Teste 2: 0 - 1 (subtração correta via complemento de dois, resultado negativo)
        -- Minuendo: 0, Subtraendo: 1, Borrow In: 1 (complemento de dois)
        -- Diferença esperada: 1 (representando o valor negativo), Borrow Out esperado: 1
        a_sub_input <= '0';
        b_sub_input <= '1';
        sub_borrow_in <= '1';  -- +1 para complemento de dois
        wait for 10 ns;
        assert (y_sub_output = '1' and sub_borrow_out = '1')
            report "Erro no Teste 2: subtracao 0 - 1" severity error;


        -- Teste 3: 1 - 1 (subtração correta via complemento de dois)
        -- Minuendo: 1, Subtraendo: 1, Borrow In: 1 (complemento de dois)
        -- Diferença esperada: 0, Borrow Out esperado: 0
        a_sub_input <= '1';
        b_sub_input <= '1';
        sub_borrow_in <= '1';
        wait for 10 ns;
        assert (y_sub_output = '0' and sub_borrow_out = '0')
            report "Erro no Teste 3: subtracao 1 - 1" severity error;


        -- Teste 4: 0 - 0 (subtração correta via complemento de dois)
        -- Minuendo: 0, Subtraendo: 0, Borrow In: 1 (complemento de dois)
        -- Diferença esperada: 0, Borrow Out esperado: 0
        a_sub_input <= '0';
        b_sub_input <= '0';
        sub_borrow_in <= '1';
        wait for 10 ns;
        assert (y_sub_output = '0' and sub_borrow_out = '0')
            report "Erro no Teste 4: subtracao 0 - 0" severity error;


        -- Teste 5: 1 - 0 sem o +1 (sub_borrow_in = '0')
        -- Minuendo: 1, Subtraendo: 0, Borrow In: 0
        -- Diferença esperada: 1, Borrow Out esperado: 0
        a_sub_input <= '1';
        b_sub_input <= '0';
        sub_borrow_in <= '0';
        wait for 10 ns;
        assert (y_sub_output = '1' and sub_borrow_out = '0')
            report "Erro no Teste 5: subtracao 1 - 0 com borrow in = 0" severity error;


        -- Teste 6: 1 - 1 sem o +1 (sub_borrow_in = '0')
        -- Minuendo: 1, Subtraendo: 1, Borrow In: 0
        -- Diferença esperada: 0, Borrow Out esperado: 0
        a_sub_input <= '1';
        b_sub_input <= '1';
        sub_borrow_in <= '0';  -- Sem complemento de dois
        wait for 10 ns;
        assert (y_sub_output = '0' and sub_borrow_out = '0')
            report "Erro no Teste 6: subtracao 1 - 1 com borrow in = 0" severity error;


        -- Teste 7: 0 - 1 sem o +1 (sub_borrow_in = '0')
        -- Minuendo: 0, Subtraendo: 1, Borrow In: 0
        -- Diferença esperada: 1 (representando o valor negativo), Borrow Out esperado: 1
        a_sub_input <= '0';
        b_sub_input <= '1';
        sub_borrow_in <= '0';  -- Sem complemento de dois
        wait for 10 ns;
        assert (y_sub_output = '1' and sub_borrow_out = '1')
            report "Erro no Teste 7: subtracao 0 - 1 com borrow in = 0" severity error;

            
        -- Teste 8: 0 - 0 sem o +1 (sub_borrow_in = '0')
        -- Minuendo: 0, Subtraendo: 0, Borrow In: 0
        -- Diferença esperada: 0, Borrow Out esperado: 0
        a_sub_input <= '0';
        b_sub_input <= '0';
        sub_borrow_in <= '0';
        wait for 10 ns;
        assert (y_sub_output = '0' and sub_borrow_out = '0')
            report "Erro no Teste 8: subtracao 0 - 0 com borrow in = 0" severity error;

        wait;
    end process stim_proc;
end architecture behavior;
