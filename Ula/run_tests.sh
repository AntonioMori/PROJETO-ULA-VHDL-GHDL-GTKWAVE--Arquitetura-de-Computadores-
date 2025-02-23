#!/bin/bash

# Cria a pasta logs se não existir
mkdir -p logs

# Exibe as opções para o usuário
echo "Escolha um testbench para visualizar no GTKWave:"
echo "(1) - AND"
echo "(2) - OR"
echo "(3) - XOR"
echo "(4) - ADD"
# echo "(5) - SUB"
echo "(Funcional apenas para ula de 4 bits) - SUB"
echo "(6) - HALF ADDER"
echo "(7) - ULA 1 BIT"
echo "(8) - ULA 4 BITS"
echo -n "Digite o número da opção: "
read opcao

# Mapeia a escolha do usuário para compilar e visualizar o arquivo correspondente
case $opcao in
    1) ghdl -r and_gate_tb2 --wave=logs/and_tb.ghw && gtkwave logs/and_tb.ghw & ;;
    2) ghdl -r or_gate_testbench --wave=logs/or_tb.ghw && gtkwave logs/or_tb.ghw & ;;
    3) ghdl -r xor_gate_antonio_tb --wave=logs/xor_tb.ghw && gtkwave logs/xor_tb.ghw & ;;
    4) ghdl -r add_gate_testbench --wave=logs/add_tb.ghw && gtkwave logs/add_tb.ghw & ;;
    # 5) ghdl -r sub_gate_testbench --wave=logs/sub_tb.ghw && gtkwave logs/sub_tb.ghw & ;;
    6) ghdl -r half_adder_antonio_tb --wave=logs/hadd_tb.ghw && gtkwave logs/hadd_tb.ghw & ;;
    7) ghdl -r tb_ula_1_bit --wave=logs/tb_ula_1_bit.ghw && gtkwave logs/tb_ula_1_bit.ghw & ;;
    8) ghdl -r ula_4_bits_testbench --wave=logs/ula_4_bits_testbench.ghw && gtkwave logs/ula_4_bits_testbench.ghw & ;;
    *) echo "Opção inválida!" ;;
esac
