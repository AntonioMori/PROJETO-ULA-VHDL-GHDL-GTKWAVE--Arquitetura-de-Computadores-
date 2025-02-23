#!/bin/bash

# Limpa compilação anterior
rm -rf work-obj93.cf

# Compila os componentes
ghdl -a components/add/add_gate.vhdl #add
ghdl -a components/and/and_gate.vhdl #and
ghdl -a components/half_adder/half_adder_antonio.vhdl #half_adder
ghdl -a components/inv/inv_gate.vhdl #inv
ghdl -a components/or/or_gate.vhdl #or
ghdl -a components/sub/sub_gate.vhdl #sub
ghdl -a components/ula_1_bit/ula_1_bit.vhdl #ula_1_bit
ghdl -a components/ula_4_bits/ula_4_bits.vhdl #ula_4_bits
ghdl -a components/xor/xor_gate_antonio.vhdl #xor


# Compila os testbenches
ghdl -a components/add/add_gate_testbench.vhdl
ghdl -a components/and/and_gate_tb2.vhdl
ghdl -a components/half_adder/half_adder_antonio_tb.vhdl
ghdl -a components/or/or_gate_testbench.vhdl
ghdl -a components/sub/sub_gate_testbench.vhdl
ghdl -a components/ula_1_bit/ula_1_bit_testbench.vhdl
ghdl -a components/ula_4_bits/ula_4_bits_testbench.vhdl
ghdl -a components/xor/xor_gate_antonio_tb.vhdl
echo -n "Compilação concluída!"
#oi prof