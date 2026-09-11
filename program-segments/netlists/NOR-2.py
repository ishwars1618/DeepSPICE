def operation(a, b):
	return not (a or b)

def transition(in_translist):
	# in_translist[0] : initial values
	# in_translist[1] : final values
	out_translist = [operation(in_translist[0][0], in_translist[1][0]),
						operation(in_translist[0][1], in_translist[1][1])]

	return out_translist

if __name__ == '__main__':
	print(operation(True, True))
	print(operation(True, False))
	print(operation(False, True))
	print(operation(False, False))
