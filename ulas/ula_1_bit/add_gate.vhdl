library IEEE;
use IEEE.std_logic_1164.all;

entity add_gate is
    port (
        a_add_input : in std_logic; 
        b_add_input : in std_logic; 
        add_carry_in : in std_logic;  --CarryIn
        y_add_output : out std_logic; -- Resultado
        add_carry_out : out std_logic -- CarryOut
    );
end entity add_gate;

architecture data_flow of add_gate is
	begin
			y_add_output <= a_add_input xor b_add_input xor add_carry_in;  -- Soma (XOR dos três bits)
			add_carry_out <= (a_add_input and b_add_input) or (add_carry_in and (a_add_input xor b_add_input)); -- Carry Out
end architecture data_flow;
