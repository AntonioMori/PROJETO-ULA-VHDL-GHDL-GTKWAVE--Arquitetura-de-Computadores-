library IEEE;
use IEEE.std_logic_1164.all;

entity ula_4_bits is
    port (
        a_ula_input    : in  std_logic_vector(3 downto 0);  -- Operando A (4 bits)
        b_ula_input    : in  std_logic_vector(3 downto 0);  -- Operando B (4 bits)
        c_ula_carry_in : in  std_logic;                     -- Carry In inicial
        op_ula         : in  std_logic_vector(1 downto 0);  -- Seletor de operação: "00" para AND,"11" para OR, "01" para ADD,"10" para SUB
        y_ula_output   : out std_logic_vector(3 downto 0);  -- Resultado (4 bits)
        c_ula_carry_out: out std_logic                      -- Carry Out final
    );
end entity ula_4_bits;

architecture behavioral of ula_4_bits is
    -- Sinal para interligar os carries das ULAs de 1 bit
    signal carry : std_logic_vector(4 downto 0);
begin
    -- O carry de entrada é o primeiro elemento do vetor de carry
    carry(0) <= c_ula_carry_in;

    -- Instância para o bit 0 (LSB)
    ULA_bit0: entity work.ula_1_bit
        port map (
            a_ula_input    => a_ula_input(0),
            b_ula_input    => b_ula_input(0),
            c_ula_carry_in => carry(0),
            op_ula         => op_ula,
            y_ula_output   => y_ula_output(0),
            c_ula_carry_out=> carry(1)
        );

    -- Instância para o bit 1
    ULA_bit1: entity work.ula_1_bit
        port map (
            a_ula_input    => a_ula_input(1),
            b_ula_input    => b_ula_input(1),
            c_ula_carry_in => carry(1),
            op_ula         => op_ula,
            y_ula_output   => y_ula_output(1),
            c_ula_carry_out=> carry(2)
        );

    -- Instância para o bit 2
    ULA_bit2: entity work.ula_1_bit
        port map (
            a_ula_input    => a_ula_input(2),
            b_ula_input    => b_ula_input(2),
            c_ula_carry_in => carry(2),
            op_ula         => op_ula,
            y_ula_output   => y_ula_output(2),
            c_ula_carry_out=> carry(3)
        );

    -- Instância para o bit 3 (MSB)
    ULA_bit3: entity work.ula_1_bit
        port map (
            a_ula_input    => a_ula_input(3),
            b_ula_input    => b_ula_input(3),
            c_ula_carry_in => carry(3),
            op_ula         => op_ula,
            y_ula_output   => y_ula_output(3),
            c_ula_carry_out=> carry(4)
        );

    -- O último carry é a saída final da ULA de 4 bits
    c_ula_carry_out <= carry(4);
end architecture behavioral;
