library IEEE;
use IEEE.std_logic_1164.all;

entity ula_4_bits_testbench is
end entity ula_4_bits_testbench;

architecture behavior of ula_4_bits_testbench is
    signal a_ula_input     : std_logic_vector(3 downto 0);
    signal b_ula_input     : std_logic_vector(3 downto 0);
    signal c_ula_carry_in  : std_logic;
    signal op_ula          : std_logic_vector(1 downto 0);
    signal y_ula_output    : std_logic_vector(3 downto 0);
    signal c_ula_carry_out : std_logic;
begin
    -- Instancia a ULA de 4 bits
    ULA4_inst: entity work.ula_4_bits
        port map (
            a_ula_input     => a_ula_input,
            b_ula_input     => b_ula_input,
            c_ula_carry_in  => c_ula_carry_in,
            op_ula          => op_ula,
            y_ula_output    => y_ula_output,
            c_ula_carry_out => c_ula_carry_out
        );

    stim_proc: process
    begin
        ---------------------------------------------------------------------
        -- Testes para operação AND (op_ula = "00")
        ---------------------------------------------------------------------
        -- Teste AND 1:
        -- A = "1010", B = "1100"
        -- Resultado esperado: "1000", Carry Out: '0'
        a_ula_input     <= "1010";
        b_ula_input     <= "1100";
        c_ula_carry_in  <= '0';  -- Não utilizado em operações lógicas
        op_ula          <= "00";
        wait for 10 ns;
        assert (y_ula_output = "1000" and c_ula_carry_out = '0')
            report "Erro AND: 1010 AND 1100 deveria ser 1000" severity error;

        -- Teste AND 2:
        -- A = "1111", B = "0101"
        -- Resultado esperado: "0101", Carry Out: '0'
        a_ula_input     <= "1111";
        b_ula_input     <= "0101";
        c_ula_carry_in  <= '0';
        op_ula          <= "00";
        wait for 10 ns;
        assert (y_ula_output = "0101" and c_ula_carry_out = '0')
            report "Erro AND: 1111 AND 0101 deveria ser 0101" severity error;

        ---------------------------------------------------------------------
        -- Testes para operação OR (op_ula = "11")
        ---------------------------------------------------------------------
        -- Teste OR 1:
        -- A = "1010", B = "1100"
        -- Resultado esperado: "1110", Carry Out: '0'
        a_ula_input     <= "1010";
        b_ula_input     <= "1100";
        c_ula_carry_in  <= '0';
        op_ula          <= "11";
        wait for 10 ns;
        assert (y_ula_output = "1110" and c_ula_carry_out = '0')
            report "Erro OR: 1010 OR 1100 deveria ser 1110" severity error;

        -- Teste OR 2:
        -- A = "0000", B = "1011"
        -- Resultado esperado: "1011", Carry Out: '0'
        a_ula_input     <= "0000";
        b_ula_input     <= "1011";
        c_ula_carry_in  <= '0';
        op_ula          <= "11";
        wait for 10 ns;
        assert (y_ula_output = "1011" and c_ula_carry_out = '0')
            report "Erro OR: 0000 OR 1011 deveria ser 1011" severity error;

        ---------------------------------------------------------------------
        -- Testes para operação ADD (op_ula = "01")
        ---------------------------------------------------------------------
        -- Teste ADD 1:
        -- A = "0011" (3), B = "0101" (5), Carry In = '0'
        -- Soma: 3 + 5 = 8 -> Resultado esperado: "1000", Carry Out: '0'
        a_ula_input     <= "0011";
        b_ula_input     <= "0101";
        c_ula_carry_in  <= '0';
        op_ula          <= "01";
        wait for 10 ns;
        assert (y_ula_output = "1000" and c_ula_carry_out = '0')
            report "Erro ADD: 0011 + 0101 deveria ser 1000" severity error;

        -- Teste ADD 2:
        -- A = "1111" (15), B = "0001" (1), Carry In = '0'
        -- Soma: 15 + 1 = 16 -> Resultado esperado: "0000", Carry Out: '1'
        a_ula_input     <= "1111";
        b_ula_input     <= "0001";
        c_ula_carry_in  <= '0';
        op_ula          <= "01";
        wait for 10 ns;
        assert (y_ula_output = "0000" and c_ula_carry_out = '1')
            report "Erro ADD: 1111 + 0001 deveria ser 0000 com carry 1" severity error;

        ---------------------------------------------------------------------
        -- Testes para operação SUB (op_ula = "10")
        -- Para SUB, usa-se Carry In = '1' para efetuar o complemento de dois.
        ---------------------------------------------------------------------
        -- Teste SUB 1:
        -- A = "0101" (5), B = "0011" (3), Carry In = '1'
        -- Subtração: 5 - 3 = 2 -> Resultado esperado: "0010", Borrow Out: '0'
        a_ula_input     <= "0101";
        b_ula_input     <= "0011";
        c_ula_carry_in  <= '1';
        op_ula          <= "10";
        wait for 10 ns;
        assert (y_ula_output = "0010" and c_ula_carry_out = '0')
            report "Erro SUB: 0101 - 0011 deveria ser 0010" severity error;

        -- Teste SUB 2:
        -- A = "0010" (2), B = "0100" (4), Carry In = '1'
        -- Subtração: 2 - 4 = -2 (em 4 bits, -2 é representado por "1110")
        -- Resultado esperado: "1110", Borrow Out: '1'
        a_ula_input     <= "0010";
        b_ula_input     <= "0100";
        c_ula_carry_in  <= '1';
        op_ula          <= "10";
        wait for 10 ns;
        assert (y_ula_output = "1110" and c_ula_carry_out = '1')
            report "Erro SUB: 0010 - 0100 deveria ser 1110" severity error;

        -- Finaliza o teste
        wait;
    end process;
end architecture behavior;
