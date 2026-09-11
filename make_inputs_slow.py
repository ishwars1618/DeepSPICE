import datetime
import random
import numpy as np
import pandas as pd
import sys
netlist_dir = "program-segments/netlists/"
sys.path.append(netlist_dir)
#netlist_dir = ""

gate_name = sys.argv[1]
input_num = int(sys.argv[2])
mod_name = gate_name+"-"+str(input_num)
gate = __import__(mod_name)
out = open(netlist_dir+mod_name+".in", "w")

#random.seed(2)
k = int(input_num**3 / 4)

letter_list = ["0", "1", "R", "F"]
letter_bool_map = {	"0": [False, False],
					"1": [True, True],
					"R": [False, True],
					"F": [True, False]};

input_transition_list = []

input_transition_rec = []
def does_transition_work():
	input_bool_trans = [letter_bool_map[input_trans] for input_trans in input_transition_rec]
	if (gate.transition(input_bool_trans) == letter_bool_map["R"]):
		return True
	elif (gate.transition(input_bool_trans) == letter_bool_map["F"]):
		return True
	else:
		return False
def find_combination(length):
	if length == input_num: # full input transition has been created
		# determine whether this input transition results in a transition for the output
		if (does_transition_work()):
			input_transition_list.append(input_transition_rec.copy())
			#print(input_transition_rec)
		return
	# proceed with recursion
	for letter in letter_list:
		input_transition_rec.append(letter)
		find_combination(length+1)
		input_transition_rec.pop()

find_combination(0)

print(input_transition_list)

for input_transitions in input_transition_list:
	for inp in input_transitions:
		out.write(inp + " ")
	out.write("\n")
out.close()
