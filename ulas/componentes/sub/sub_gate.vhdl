library IEEE;
use IEEE.std_logic_1164.all;

use work.
entity sub_gate is
    port (
        a_sub_input : in std_logic;  -- Operando A
        b_sub_input : in std_logic;  -- Operando B
        sub_borrow_in : in std_logic;  -- Borrow (usado para o complemento de dois)
        y_sub_output : out std_logic; -- Resultado
        sub_borrow_out : out std_logic -- Borrow Out ou Carry Out
    );
end entity sub_gate;

architecture data_flow of sub_gate is
    signal b_inverted : std_logic;  -- Sinal para armazenar o B invertido

    component inv_gate is
        port (
            a_inv_input : in std_logic;
            y_inv_output : out std_logic
        );
    end component;

    component add_gate is
        port (
            a_add_input : in std_logic;
            b_add_input : in std_logic;
            add_carry_in : in std_logic;
            y_add_output : out std_logic;
            add_carry_out : out std_logic
        );
    end component;

begin
    -- Inverter o operando B
    instancia_inv_gate : inv_gate
        port map (
            a_inv_input => b_sub_input,
            y_inv_output => b_inverted
        );

    -- Realizar a operação de soma, considerando o complemento de dois (invertido + 1)
    instancia_add_gate : add_gate
        port map (
            a_add_input => a_sub_input,
            b_add_input => b_inverted,
            add_carry_in => sub_borrow_in,  -- Borrow In é 1 quando estamos subtraindo
            y_add_output => y_sub_output,
            add_carry_out => sub_borrow_out  -- Carry Out se torna Borrow Out
        );

end architecture data_flow;
