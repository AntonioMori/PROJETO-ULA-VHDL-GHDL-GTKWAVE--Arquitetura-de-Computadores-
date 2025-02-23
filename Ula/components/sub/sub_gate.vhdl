library IEEE;
use IEEE.std_logic_1164.all;

entity sub_gate is
    generic (
        FINAL : boolean := false  -- Se true, este é o estágio final da subtração
    );
    port (
        a_sub_input    : in std_logic;  -- Operando A
        b_sub_input    : in std_logic;  -- Operando B
        sub_borrow_in  : in std_logic;  -- Carry In para subtração (deve ser '1' para complemento de dois)
        y_sub_output   : out std_logic; -- Resultado (diferença)
        sub_borrow_out : out std_logic  -- Saída para propagação do carry ou para indicar o borrow final
    );
end entity sub_gate;

architecture behavioral of sub_gate is
    signal b_inverted : std_logic;
    signal sum_bit    : std_logic;
    signal carry_out  : std_logic;
begin
    -- Inverte o operando B para calcular o complemento de dois
    b_inverted <= not b_sub_input;
    
    process(a_sub_input, b_inverted, sub_borrow_in)
    begin
        -- Soma de 1 bit: A + (NOT B) + Cin
        sum_bit   <= a_sub_input xor b_inverted xor sub_borrow_in;
        carry_out <= (a_sub_input and b_inverted) or 
                     (a_sub_input and sub_borrow_in) or 
                     (b_inverted and sub_borrow_in);
    end process;
    
    y_sub_output <= sum_bit;
    
    -- Se este for o estágio final, inverte o carry para gerar o borrow final.
    -- Caso contrário, propaga o carry para a próxima ULA.
    sub_borrow_out <= (not carry_out) when FINAL = true else carry_out;
end architecture behavioral;
