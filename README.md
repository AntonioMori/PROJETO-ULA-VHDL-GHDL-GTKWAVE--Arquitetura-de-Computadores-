# PROJETO ULA VHDL-GHDL-GTKWAVE

### Requisitos
Você precisa desenvolver a implementação em VHDL para uma porta lógica AND e para um circuito combinacional do tipo HALF ADDER. A porta AND deve receber duas entradas lógicas (A e B) e gerar uma saída (Y) que representa a conjunção lógica das entradas. Já o HALF ADDER deve realizar a operação de soma de dois bits (A e B), gerando duas saídas: a soma (S) e o transporte ou carry (C). Ambas as implementações devem ser descritas utilizando o padrão VHDL, com a estruturação adequada de entidades e arquiteturas

## Informações
- **Aluno:** Antonio Mori
- **Professor:** Waldemar Ferreira Neto?

## Tecnologias e Bibliotecas Utilizadas

- **<a href="https://github.com/ghdl/ghdl/blob/master/libraries/ieee/std_logic_1164.vhdl" target="_blank" rel="noopener noreferrer">ieee</a> :** Como biblioteca base para a leitura e manipulação de binários.
- **VsCode**: Como IDE para desenvolvimento.
- **Modern VHDL**: *"This extension add language support for VHDL, based on the 2008 standard. Also includes syntax highlighting of constants, types and functions"*
- **GHDL Interface**: *"This extension allows you to invoke GHDL functions, as well as GTKWave. Beyond it highlights the errors that were reported by GHDL in the editor"*
- **VHDL LS**: Biblioteca alternativa para o suporte da linguagem ao VsCode. *"VHDL Language Server and Support for Visual Studio Code."* 


## Estrutura do Projeto
```
.vscode/
├── extensions.json              # Extensões recomendadas para o desenvolvimento
├── settings.json                # Configurações padrões recomendadas

assets/  	                  		 # Arquivos estáticos como imagens, etc.

main/
├── and_gate_antonio.vhdl        # Template principal
├── 

```



## **Comandos Auxiliares**  
Uma lista de comandos úteis para trabalhar com GHDL e simulações VHDL.

---

1. **Verifica a sintaxe do código VHDL**  
   Este comando verifica se o código está corretamente escrito, mas **não realiza a compilação**.  
   ```bash
   ghdl -s file.vhdl
   ```

2. **Compila e realiza a análise do código**  
   Este comando realiza a **compilação** e a **análise** do código VHDL, verificando erros e criando arquivos intermediários.  
   ```bash
   ghdl -a file.vhdl
   ```

3. **Elabora e cria o executável da testbench**  
   O comando cria o executável da testbench, preparando-o para execução.  
   ```bash
   ghdl -e sua_testbench
   ```

4. **Executa a simulação**  
   Com esse comando, você **roda** a simulação do testbench e verifica o resultado da execução.  
   ```bash
   ghdl -r sua_testbench
   ```

---

### Para visualizar a simulação no GTKWave, é necessário converter a saída da testbench para o formato **VCD**. O GHDL facilita essa conversão.

---

5. **Realiza a conversão da testbench para o formato VCD**  
   Converte a simulação em VHDL para um arquivo **VCD**, que pode ser visualizado no **GTKWave**.  
   ```bash
   ghdl -r sua_testbench --vcd=and.vcd
   ```

6. **Abre o arquivo VCD com o GTKWave**  
   Após a conversão, abra o arquivo `.vcd` com o GTKWave para visualizar a simulação de forma gráfica.  
   ```bash
   gtkwave and.vcd
   ```
 ---
### O trecho a partir daqui foi gerado com inteligencia artificial 


## **Architectures Styles in VHDL**

### **1. Data Flow**
O estilo **Data Flow** descreve o comportamento do circuito usando atribuições de sinais e expressões lógicas. Esse estilo é útil para representar diretamente equações booleanas sem a necessidade de um processo sequencial.

#### **Exemplo: Implementação de uma Porta AND**
```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
    port (
        a, b : in std_logic;
        y : out std_logic
    );
end entity;

architecture data_flow of and_gate is
begin
    y <= a and b;
end architecture data_flow;
```

#### **Simulação no GTKWave**
Após compilar e executar a simulação com GHDL, você pode gerar um arquivo **VCD** para visualização no **GTKWave**.
```bash
ghdl -r sua_testbench --vcd=and.vcd
```

---

### **2. Behavioral**
O estilo **Behavioral** descreve o comportamento do circuito utilizando processos (`process`) e estruturas condicionais, como `if`, `case`, `loop`, etc. Ele é útil para implementar **máquinas de estado** e **algoritmos sequenciais**.

#### **Exemplo: Implementação de uma Porta AND Usando Behavioral**
```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
    port (
        a, b : in std_logic;
        y : out std_logic
    );
end entity;

architecture behavioral of and_gate is
begin
    process(a, b)
    begin
        if (a = '1' and b = '1') then
            y <= '1';
        else
            y <= '0';
        end if;
    end process;
end architecture behavioral;
```

#### **Simulação no GHDL**
```bash
ghdl -a and_gate.vhdl
ghdl -e and_gate
ghdl -r and_gate --wave=and.ghw
```
O arquivo `and.ghw` pode ser aberto no **GTKWave**:
```bash
gtkwave and.ghw
```

---

### **3. Structural**
O estilo **Structural** descreve um circuito conectando componentes previamente definidos, semelhante ao uso de portas lógicas para construir circuitos mais complexos.

#### **Exemplo: Implementação de um Half Adder Usando Structural**
```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port (
        a, b : in std_logic;
        sum, carry : out std_logic
    );
end entity;

architecture structural of half_adder is
    component and_gate
        port (
            a, b : in std_logic;
            y : out std_logic
        );
    end component;
    
    component xor_gate
        port (
            a, b : in std_logic;
            y : out std_logic
        );
    end component;
    
    signal s_and, s_xor : std_logic;

begin
    u1: xor_gate port map (a => a, b => b, y => s_xor);
    u2: and_gate port map (a => a, b => b, y => s_and);
    
    sum <= s_xor;
    carry <= s_and;
end architecture structural;
```

#### **Simulação**
```bash
ghdl -a half_adder.vhdl
ghdl -e half_adder
ghdl -r half_adder --wave=half_adder.ghw
```
E depois visualizar no GTKWave:
```bash
gtkwave half_adder.ghw
```

---

### **Resumo dos Estilos de Arquitetura**
| Estilo        | Característica Principal                                  | Uso Principal  |
|--------------|------------------------------------------------|--------------|
| **Data Flow** | Usa expressões booleanas para descrever o circuito. | Equações Lógicas |
| **Behavioral** | Utiliza `process` e estruturas condicionais. | Máquinas de Estado, Algoritmos |
| **Structural** | Conecta componentes previamente definidos. | Hierarquia de Circuitos |

Cada estilo pode ser escolhido dependendo da necessidade do projeto. Em geral, a abordagem **Behavioral** é mais usada para **modelagem complexa**, enquanto **Structural** é útil para projetos modulares.

---


