library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

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

architecture data_flow of ula_1_bit is
begin
    process(a_ula_input, b_ula_input, c_ula_carry_in, op_ula)
    variable sum_result : std_logic_vector(1 downto 0);
    begin
        case op_ula is
            when "00" =>  -- AND
                y_ula_output <= a_ula_input and b_ula_input;
                c_ula_carry_out <= '0'; -- Sem carry
            
            when "11" =>  -- OR
                y_ula_output <= a_ula_input or b_ula_input;
                c_ula_carry_out <= '0'; -- Sem carry
            
            when "01" =>  -- ADD (Soma com Carry)
                sum_result := ('0' & a_ula_input) + ('0' & b_ula_input) + ('0' & c_ula_carry_in);
                y_ula_output <= sum_result(0); -- Resultado da soma
                c_ula_carry_out <= sum_result(1); -- Carry Out
            
            when "10" =>  -- SUB (Subtração A - B)
                sum_result := ('0' & a_ula_input) - ('0' & b_ula_input) - ('0' & c_ula_carry_in);
                y_ula_output <= sum_result(0); -- Resultado da subtração
                c_ula_carry_out <= sum_result(1); -- Carry Out
            
            when others =>
                y_ula_output <= '0'; -- Valor padrão
                c_ula_carry_out <= '0';
        end case;
    end process;
end architecture data_flow;
