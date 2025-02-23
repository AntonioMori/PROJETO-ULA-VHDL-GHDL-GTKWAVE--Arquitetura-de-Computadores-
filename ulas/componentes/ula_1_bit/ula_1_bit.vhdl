library IEEE;
use IEEE.std_logic_1164.all;


entity ula_1_bit is 
    port (
        a_ula_input  : in std_logic;  -- Entrada A
        b_ula_input  : in std_logic;  -- Entrada B
        c_ula_carry_in : in std_logic; -- Carry In
        op_ula : in std_logic_vector(1 downto 0); -- Seletor da Operação
        y_ula_output : out std_logic; -- Resultado
        c_ula_carry_out : out std_logic -- Carry Out
    );
end entity ula_1_bit;

architecture behavioral of ula_1_bit is
-- Referenciando os componentes and, or, add, sub

component and_gate
    port (
        a_and_input : in std_logic;
        b_and_input : in std_logic;
        y_and_output : out std_logic
    );
end component;

component or_gate
    port (
        a_or_input : in std_logic;
        b_or_input : in std_logic;
        y_or_output : out std_logic
    );
end component;

component add_gate
    port (
        a_add_input : in std_logic;
        b_add_input : in std_logic;
        add_carry_in : in std_logic;
        y_add_output : out std_logic;
        add_carry_out : out std_logic
    );
end component;

component sub_gate
    port (
        a_sub_input : in std_logic;
        b_sub_input : in std_logic;
        sub_borrow_in : in std_logic;
        y_sub_output : out std_logic;
        sub_borrow_out : out std_logic
    );
end component;
signal and_result, or_result, add_result, sub_result : std_logic;
signal add_carry_out, sub_borrow_out : std_logic;

begin
    -- Instanciando os componentes
    and_gate_inst : and_gate
        port map (
            a_and_input => a_ula_input,
            b_and_input => b_ula_input,
            y_and_output => and_result
        );

    or_gate_inst : or_gate
        port map (
            a_or_input => a_ula_input,
            b_or_input => b_ula_input,
            y_or_output => or_result
        );

    add_gate_inst : add_gate
        port map (
            a_add_input => a_ula_input,
            b_add_input => b_ula_input,
            add_carry_in => c_ula_carry_in,
            y_add_output => add_result,
            add_carry_out => add_carry_out
        );

    sub_gate_inst : sub_gate
        port map (
            a_sub_input => a_ula_input,
            b_sub_input => b_ula_input,
            sub_borrow_in => c_ula_carry_in,
            y_sub_output => sub_result,
            sub_borrow_out => sub_borrow_out
        );

    process(a_ula_input, b_ula_input, c_ula_carry_in, op_ula, and_result, or_result, add_result, sub_result, add_carry_out, sub_borrow_out)
    begin
        case op_ula is
            when "00" =>  -- AND
                y_ula_output <= and_result;
                c_ula_carry_out <= '0'; -- Sem carry
            
            when "11" =>  -- OR
                y_ula_output <= or_result;
                c_ula_carry_out <= '0'; -- Sem carry
            
            when "01" =>  -- ADD (Soma com Carry)
                y_ula_output <= add_result; -- Resultado da soma
                c_ula_carry_out <= add_carry_out; -- Carry Out
            
            when "10" =>  -- SUB (Subtração A - B)
                y_ula_output <= sub_result; -- Resultado da subtração
                c_ula_carry_out <= sub_borrow_out; -- Carry Out
            
            when others =>
                y_ula_output <= '0'; -- Valor padrão
                c_ula_carry_out <= '0';
        end case;
    end process;
end architecture behavioral;
