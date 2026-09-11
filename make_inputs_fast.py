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

letter_bool_map = {	"0": [False, False],
					"1": [True, True],
					"R": [False, True],
					"F": [True, False]};

max_input_transition_list = []

for i in range(0, 20):
	permutation_list = [] # stores representation of test set

	for inpNum in range(0, input_num):
		permutation = [] # stores random permutation of k 1's, k 0's, k R's, and k F's

		# append k 1's, k 0's, k R's, and k F's to permutation
		for i in range(0, k):
			permutation.append("0");
			permutation.append("1");
			permutation.append("R");
			permutation.append("F");
		random.shuffle(permutation)
		#print(permutation)
		permutation_list.append(permutation)

	input_transition_list = [];
	for i in range(0, 4*k):
		input_transition = []
		for j in range(0, input_num):
			#input_transition.append(convert_letter_to_bool(permutation_list[j][i]))
			input_transition.append(permutation_list[j][i])
		input_transition_list.append(input_transition)

	# remove inputs where output does not transition (if it is equal to "0" or "1")
	i = 0
	while (i < len(input_transition_list)):
		input_bool_trans = [letter_bool_map[input_trans] for input_trans in input_transition_list[i]]
		#print(input_bool_trans, gate.transition(input_bool_trans))
		if (gate.transition(input_bool_trans) == letter_bool_map["0"]):
			del input_transition_list[i]
		elif (gate.transition(input_bool_trans) == letter_bool_map["1"]):
			del input_transition_list[i]
		else:
			i += 1

	# remove duplicate inputs
	i = 0
	while (i < len(input_transition_list)-1):
		j = i+1
		while (j < len(input_transition_list)):
			if (input_transition_list[i] == input_transition_list[j]):
				del input_transition_list[j]
			else:
				j += 1
		i += 1

	if (len(input_transition_list) > len(max_input_transition_list)):
		max_input_transition_list = input_transition_list

print(max_input_transition_list)

for input_transitions in max_input_transition_list:
	for input in input_transitions:
		out.write(input)
		out.write(" ")
	out.write("\n")
out.close()
