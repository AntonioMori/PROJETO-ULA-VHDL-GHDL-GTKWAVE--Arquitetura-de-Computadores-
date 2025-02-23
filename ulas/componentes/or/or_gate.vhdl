library IEEE;
use IEEE.std_logic_1164.all;

entity or_gate is 
	port (
      a_or_input : in std_logic;
      b_or_input : in std_logic;
      y_or_output : out std_logic
	);
end entity or_gate;


architecture data_flow of or_gate is
begin
	y_or_output <= a_or_input or b_or_input;
end architecture data_flow;