library IEEE;
use IEEE.std_logic_1164.all;

entity sub_gate is
    port (
        a_sub_input    : in std_logic;  -- Operando A
        b_sub_input    : in std_logic;  -- Operando B
        sub_borrow_in  : in std_logic;  -- Se '1' utiliza complemento de dois; se '0', subtração simples
        y_sub_output   : out std_logic; -- Resultado
        sub_borrow_out : out std_logic  -- Borrow Out
    );
end entity sub_gate;

architecture behavioral of sub_gate is
begin
    process(a_sub_input, b_sub_input, sub_borrow_in)
        variable var_b_inv  : std_logic;
        variable var_sum    : std_logic;
        variable var_carry  : std_logic;
    begin
        if sub_borrow_in = '1' then
            -- Modo complemento de dois: A - B = A + (NOT B) + 1
            var_b_inv := not b_sub_input;
            var_sum   := a_sub_input xor var_b_inv xor '1';
            var_carry := (a_sub_input and var_b_inv) or (a_sub_input and '1') or (var_b_inv and '1');
            y_sub_output   <= var_sum;
            sub_borrow_out <= not var_carry;
        else
            -- Modo subtração simples: A - B
            y_sub_output   <= a_sub_input xor b_sub_input;
            sub_borrow_out <= (not a_sub_input) and b_sub_input;
        end if;
    end process;
    
end architecture behavioral;
