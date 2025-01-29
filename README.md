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
├── favicon.ico                  # Favicon do site

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




### Java (JDK 8)
<ol>
    <li>Faça o download e instale o <a href="https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html" target="_blank" rel="noopener noreferrer">JDK 8</a> (talvez seja necessário criar uma conta, caso ainda não tenha.)</li>
    <li>Crie a variável de ambiente <a href="https://confluence.atlassian.com/confbr1/configurando-a-variavel-java_home-no-windows-933709538.html" target="_blank" rel="noopener noreferrer">JAVA_HOME</a></li>
    <li>Reinicie o seu terminal ou abra um novo e execute o comando <code>java -version</code>, se não retornar a versão instalada, reinicie o seu computador.</li>
</ol>

### Hadoop
<ol>
    <li>Faça o download do arquivo <a href="https://github.com/steveloughran/winutils/blob/master/hadoop-2.7.1/bin/winutils.exe" target="_blank" rel="noopener noreferrer">winutils.exe</a> do Hadoop 2.7.1</li>
    <li>Copie o arquivo winutils.exe para um diretório, como .</li>
    <li>Crie a variável de ambiente HADOOP_HOME, passando o caminho <code>C:\hadoop</code></li>
    <li>Edite a variável de ambiente Path e adicione <code>C:\hadoop\bin</code></li>
    <li>Reinicie o terminal</li>
</ol>

