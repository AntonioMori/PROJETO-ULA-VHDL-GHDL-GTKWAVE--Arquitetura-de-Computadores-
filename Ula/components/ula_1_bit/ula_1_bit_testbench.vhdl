library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ula_1_bit is
end entity tb_ula_1_bit;

architecture testbench of tb_ula_1_bit is
    signal a_ula_input  : std_logic;
    signal b_ula_input  : std_logic;
    signal c_ula_carry_in : std_logic;
    signal op_ula : std_logic_vector(1 downto 0);
    signal y_ula_output : std_logic;
    signal c_ula_carry_out : std_logic;

    -- Component declaration
    component ula_1_bit
        port (
            a_ula_input  : in std_logic;
            b_ula_input  : in std_logic;
            c_ula_carry_in : in std_logic;
            op_ula : in std_logic_vector(1 downto 0);
            y_ula_output : out std_logic;
            c_ula_carry_out : out std_logic
        );
    end component;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: ula_1_bit
        port map (
            a_ula_input => a_ula_input,
            b_ula_input => b_ula_input,
            c_ula_carry_in => c_ula_carry_in,
            op_ula => op_ula,
            y_ula_output => y_ula_output,
            c_ula_carry_out => c_ula_carry_out
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test AND operation
        a_ula_input <= '0';
        b_ula_input <= '0';
        c_ula_carry_in <= '0';
        op_ula <= "00";
        wait for 10 ns;
        
        a_ula_input <= '0';
        b_ula_input <= '1';
        wait for 10 ns;
        
        a_ula_input <= '1';
        b_ula_input <= '0';
        wait for 10 ns;
        
        a_ula_input <= '1';
        b_ula_input <= '1';
        wait for 10 ns;

        -- Test OR operation
        op_ula <= "11";
        a_ula_input <= '0';
        b_ula_input <= '0';
        wait for 10 ns;
        
        a_ula_input <= '0';
        b_ula_input <= '1';
        wait for 10 ns;
        
        a_ula_input <= '1';
        b_ula_input <= '0';
        wait for 10 ns;
        
        a_ula_input <= '1';
        b_ula_input <= '1';
        wait for 10 ns;

        -- Test ADD operation
        op_ula <= "01";
        a_ula_input <= '0';
        b_ula_input <= '0';
        c_ula_carry_in <= '0';
        wait for 10 ns;
        
        a_ula_input <= '0';
        b_ula_input <= '1';
        wait for 10 ns;
        
        a_ula_input <= '1';
        b_ula_input <= '0';
        wait for 10 ns;
        
        a_ula_input <= '1';
        b_ula_input <= '1';
        wait for 10 ns;

        -- Test SUB operation
        op_ula <= "10";
        a_ula_input <= '0';
        b_ula_input <= '0';
        c_ula_carry_in <= '0';
        wait for 10 ns;
        
        a_ula_input <= '0';
        b_ula_input <= '1';
        wait for 10 ns;
        
        a_ula_input <= '1';
        b_ula_input <= '0';
        wait for 10 ns;
        
        a_ula_input <= '1';
        b_ula_input <= '1';
        wait for 10 ns;

        -- End of test
        wait;
    end process;
end architecture testbench;
