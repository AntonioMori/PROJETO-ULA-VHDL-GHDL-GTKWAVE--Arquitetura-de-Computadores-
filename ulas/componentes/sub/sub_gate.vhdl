library IEEE;
use IEEE.std_logic_1164.all;

entity sub_gate is
    port (
        a_sub_input : in std_logic;  -- Operando A
        b_sub_input : in std_logic;  -- Operando B
        sub_borrow_in : in std_logic;  -- Borrow In (deve ser 1 para complemento de dois)
        y_sub_output : out std_logic; -- Resultado
        sub_borrow_out : out std_logic -- Borrow Out (inverso do Carry Out)
    );
end entity sub_gate;

architecture data_flow of sub_gate is
    signal b_inverted   : std_logic;  -- Sinal para armazenar o B invertido
    signal temp_carry   : std_logic;  -- Sinal intermediário para o carry gerado pelo add_gate

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
            add_carry_in : in std_logic;  -- Carry In
            y_add_output : out std_logic; -- Resultado
            add_carry_out : out std_logic -- Carry Out
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
            add_carry_in => sub_borrow_in,  -- Borrow In é 1 para efetuar o complemento de dois
            y_add_output => y_sub_output,
            add_carry_out => temp_carry    -- Captura o carry gerado
        );

    -- Inverter o carry para gerar o borrow
    sub_borrow_out <= not temp_carry;
end architecture data_flow;
