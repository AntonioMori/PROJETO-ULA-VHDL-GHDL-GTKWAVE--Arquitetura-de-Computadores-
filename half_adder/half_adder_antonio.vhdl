-- Importação das bibliotecas necessárias para a manipulação de binários
library ieee;
use ieee.std_logic_1164.all;

-- Definição da interface com o mundo exterior
entity half_adder_antonio is
    port (
        a_parcela : in std_logic;      -- Entrada A
        b_parcela : in std_logic;      -- Entrada B
        sum_result : out std_logic;    -- Saída Soma (S)
        carry_result : out std_logic   -- Saída Carry (C)
    );
end entity half_adder_antonio;

architecture estrutuaL_architecture of half_adder_antonio is
    -- Referenciando os componentes and_gate e xor_gate_antonio
    
		-- o componente and referenciado de uma criação em outro arquivo no mesmo diretório vai receber nessa referencia
		-- as portas a de input e b de input e vai ter a porta de saída que será o resultado do and
		component and_gate
        port (
					a_and_input : in std_logic;
					b_and_input : in std_logic;
					y_and_output : out std_logic
        );
    end component;
    
		--de maneira semelhante irá ocorrer no xor
    component xor_gate_antonio
        port (
            a_xor_input : in std_logic;
            b_xor_input : in std_logic;
            y_xor_output : out std_logic
        );
    end component;

		--uma vez referenciados precisamos guardar os resultados dessas instruções pois a junção de seus resultados será justamente
		-- o resultado do half adder
    
		-- Definição dos sinais internos para os resultados dos componentes
    signal y_and_result : std_logic;
    signal y_xor_result : std_logic;

begin
    -- Instanciando os componentes e conectando corretamente
    instancia_and_gate: and_gate 
        port map (
					a_and_input => a_parcela, 
					b_and_input => b_parcela, 
					y_and_output => y_and_result --carry out
        );

    instancia_xor_gate_antonio: xor_gate_antonio 
        port map (
            a_xor_input => a_parcela, 
            b_xor_input => b_parcela, 
            y_xor_output => y_xor_result -- somatório (tabela verdade xor, soma de 2 bits)
        );

    -- Conectando as saídas dos componentes às saídas do half adder
    sum_result <= y_xor_result; -- A saída da soma é o resultado do xor
    carry_result <= y_and_result; --se o and for a=1 e b=1 então o carry deve ser 1 pq é a soma de 1+1, else 0

end architecture estrutuaL_architecture;

-- o half adder é um circuito onde o resultado é a mesma coisa que a tabela verdade da poorta xor,
-- para um desenvolvimento mais descomplicado foi utilizado uma Arquitetura Estrutural, onde definimos
-- para o xor e o and uma arquitetura data_flow e para o componente maior uma mistura de data_flow e behavioral
-- para que possamos instanciar os componentes and e xor e conecta-los corretamente para que o half adder funcione
-- alem disso foram feitos testsbenches para os componentes and e xor para garantir que eles estão funcionando corretamente
-- e por fim um testbench para o half adder para garantir que ele tambem está funcionando de maneira correta, se você
-- leu até aqui, muito obrigado professor, tenho todo o meu fluxo de aprendizagem e desenvolvimento de código registrados
-- nesse repositório e no pdf anexado gerado a partir do samsung notes