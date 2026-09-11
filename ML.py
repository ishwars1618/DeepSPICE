import datetime
import random
import numpy as np
import pandas as pd
import sys
import os
import subprocess

netlist_dir = "program-segments/netlists/"
sys.path.append(netlist_dir)

VHIGH = 1.5
threshold = 0.5
letter_bool_map = {	"0": [False, False],
					"1": [True, True],
					"R": [False, True],
					"F": [True, False]};

log = open("ML.log", "a")
log.write(str(datetime.datetime.now()) + "\n")

log.write("Importing gate ...\n")
gate_name = "4TO4_1"
input_num = 3
mod_name = gate_name+"-"+str(input_num)
gate = __import__(mod_name)
print(gate)
print(gate_name+"-"+str(input_num))

log.write("Reading in input transitions ...\n")

if os.path.exists(netlist_dir+mod_name+".in") == False:
	os.system("python3 make_inputs_slow.py "+gate_name+" "+str(input_num))

infile = open(netlist_dir+mod_name+".in", "r");
infile_arr = infile.readlines()
input_transition_list = [input.split(' ')[0:input_num] for input in infile_arr]
infile.close()

log.write("Making test spice files and running them ...\n")
#print(input_transition_list)

for input_transitions in input_transition_list:
	command = "./mkspicefile " + gate_name + " " + str(input_num) + " "
	first_change = ""
	threshold_voltage_in = 0
	threshold_voltage_out = 0
	for inp in input_transitions:
		if inp == "R":
			threshold_voltage_in = threshold*VHIGH + (1 - threshold)*0
			threshold_voltage_in = round(threshold_voltage_in, 3)
			break
		if inp == "F":
			threshold_voltage_in = threshold*0 + (1 - threshold)*VHIGH
			threshold_voltage_in = round(threshold_voltage_in, 3)
			break
	bool_input_trans = [letter_bool_map[input_trans] for input_trans in input_transitions]
	#print(bool_input_trans)
	bool_output_trans = gate.transition(bool_input_trans)

	if bool_output_trans == letter_bool_map["R"]:
		threshold_voltage_out = threshold*VHIGH + (1 - threshold)*0
	elif bool_output_trans == letter_bool_map["F"]:
		threshold_voltage_out = threshold*0 + (1 - threshold)*VHIGH
	threshold_voltage_out = round(threshold_voltage_out, 3)

	command += str(threshold_voltage_in) + " " + str(threshold_voltage_out) + " "

	for inp in input_transitions:
		command += inp + " "

	print(command)
	os.system(command)

for input_transitions in input_transition_list:
	command = "ngspice -b simulation-programs/" + gate_name + "_" + str(input_num) + "_"
	command += input_transitions[0]
	for inp in input_transitions[1:]:
		command += "-" + inp
	command += ".sp"
	print(command)
	log.write(command+"\n")
	log.write(subprocess.getoutput(command))
	log.write("\n")
	log.write("\n")

log.write("Creating all test data ...\n")
data_arr = []

for input_transition in input_transition_list:
	log.write(str(input_transition)+"\n")
log.write("\n")

for i in range(0, len(input_transition_list)):
	test_case = []
	for j in range(0, input_num):
		volt_initial = 0; volt_final = 0; dt = 0;
		if (input_transition_list[i][j] == "0"):
			volt_initial = 0;
			volt_final = 0;
			dt = 0;
		elif (input_transition_list[i][j] == "1"):
			volt_initial = VHIGH;
			volt_final = VHIGH;
			dt = 0;
		elif (input_transition_list[i][j] == "R"):
			volt_initial = 0;
			volt_final = VHIGH;
			dt = 20;
		elif (input_transition_list[i][j] == "F"):
			volt_initial = VHIGH;
			volt_final = 0;
			dt = 20;

		test_case.append(volt_initial);
		test_case.append(volt_final);
		test_case.append(dt)

	data_arr.append(test_case)

for input_transition in data_arr:
	log.write(str(input_transition)+"\n")
log.write("\n")

log.write("Reading simulation output and adding to data set ...\n")

delay_arr = []

for i in range(0, len(input_transition_list)):
	fname = gate_name + "_" + str(input_num) + "_"
	fname += input_transition_list[i][0]
	for inp in input_transition_list[i][1:]:
		fname += "-" + inp
	fname += ".out"
	infile = open("simulation-output/" + fname, "r")
	# add delay times to data_arr
	delay = float(infile.readline()[7:])
	delay_arr.append(delay)

for input_transition in delay_arr:
	log.write(str(input_transition)+"\n")
log.write("\n")

log.write("Making pandas dataframe ...\n")

list_arr = [i for i in range(1, input_num+1)]
column_hierarchy = pd.MultiIndex.from_product([list_arr, ["V_i", "V_f", "dt"]])
log.write(str(column_hierarchy)+"\n")

transition_data = pd.DataFrame(data_arr, columns=column_hierarchy)

transition_data["delay"] = delay_arr

print(transition_data)

"""
log.write("Plotting data ...\n")

import numpy as np
import mpl_toolkits
import matplotlib.pyplot as plt

fig = plt.figure()
ax = plt.axes(projection ='3d')

number_map = {"0": 1, "R": 2, "F": 3, "1": 4}

x = [number_map[input_transitions[0]] for input_transitions in input_transition_list]
y = [number_map[input_transitions[1]] for input_transitions in input_transition_list]
for input_transition in input_transition_list:
	print(input_transition)
print()
print(x)
print(y)
z = np.zeros(len(input_transition_list))

dx = 0.5 * np.ones(len(input_transition_list))
dy = 0.5 * np.ones(len(input_transition_list))
dz = delay_arr

ax.bar3d(x, y, z, dx, dy, dz, shade=True)

plt.show()

exit()
"""

# Finally, here's where the REAL machine learning starts

log.write("Splitting train and test data set ...\n")

from sklearn.model_selection import train_test_split

independent_variables = transition_data[[i for i in range(1, input_num+1)]].values
dependent_variable = transition_data["delay"].values

indep_train, indep_test, dep_train, dep_test = \
	train_test_split(independent_variables , dependent_variable ,test_size=0.3, random_state=42)

print(type(indep_train))

exit()

"""
train_test_file = open(gate_name + "_" + str(input_num) + ".dat", "w")
train_test_file.write("Train:\n")
train_test_file.write("\tInput:\n")
for test in indep_train:
	train_test_file.write(str(test)+"\n")
train_test_file.write("\tOutput:\n")
for test in dep_train:
	train_test_file.write(str(test)+"\n")
train_test_file.write("Test:\n")
train_test_file.write("\tInput:\n")
for test in indep_test:
	train_test_file.write(str(test)+"\n")
train_test_file.write("\tOutput:\n")
for test in dep_test:
	train_test_file.write(str(test)+"\n")

train_test_file.close()
"""

print("Independent variables (train):")
print(indep_train)
print("Dependent variables (train):")
print(dep_train)
print()
print("Independent variables (test):")
print(indep_test)
print("Dependent variables (test):")
print(dep_test)
print()

log.write("Scaling train data set ...\n")

from sklearn.preprocessing import MinMaxScaler

normalizer = MinMaxScaler()
normalizer.fit(indep_train)
indep_train_scaled = normalizer.transform(indep_train)
indep_test_scaled = normalizer.transform(indep_test)

log.write("Setting up deep learning model ...\n")

import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Activation

model = Sequential([
	Dense(units=9, activation='relu'),
	Dense(units=8, activation='relu'),
	#Dense(units=3),
	#Dense(units=2)
	Dense(1) # final output node
])

model.compile(optimizer='rmsprop',loss='mse')

log.write("Training deep learning model ...\n")

model.fit(indep_train_scaled, dep_train, epochs=1000)

training_score = model.evaluate(indep_test_scaled, dep_test, verbose=0)
print(training_score)

#print("Input transition: ", indep_test[0])
#print("Actual: ", dep_test[0])

predictions = model.predict(indep_test_scaled)

for i in range(0, len(indep_test)):
	print(indep_test[i])
	print("Actual", dep_test[i])
	print("Prediction", predictions[i])
