library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inv_gate is
	Port (
		a_inv_input : in STD_LOGIC;
		y_inv_output : out STD_LOGIC
	);
end inv_gate;

architecture Behavioral of inv_gate is
begin
	y_inv_output <= not a_inv_input;
end Behavioral;