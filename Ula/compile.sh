#!/bin/bash

# Limpa compilação anterior
rm -rf work-obj93.cf

# Compila os componentes
ghdl -a components/add/add_gate.vhdl
ghdl -a components/and/and_gate.vhdl
ghdl -a components/half_adder/half_adder_antonio.vhdl
ghdl -a components/inv/inv_gate.vhdl
ghdl -a components/or/or_gate.vhdl
ghdl -a components/sub/sub_gate.vhdl
ghdl -a components/ula_1_bit/ula_1_bit.vhdl
ghdl -a components/xor/xor_gate_antonio.vhdl
# ghdl -a projeto_top.vhdl


# Compila os testbenches
ghdl -a components/add/add_gate_testbench.vhdl
ghdl -a components/and/and_gate_tb2.vhdl
ghdl -a components/half_adder/half_adder_antonio_tb.vhdl
ghdl -a components/or/or_gate_testbench.vhdl
ghdl -a components/sub/sub_gate_testbench.vhdl
ghdl -a components/ula_1_bit/ula_1_bit_testbench.vhdl
ghdl -a components/xor/xor_gate_antonio_tb.vhdl
# ghdl -a tb/top_tb.vhdl
echo -n "Compilação concluída!"