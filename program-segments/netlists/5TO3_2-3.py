def operation(a, b, c):
	return not a and (not b or not c)

def transition(in_translist):
	# in_translist[0] : initial values
	# in_translist[1] : final values
	out_translist = [operation(in_translist[0][0], in_translist[1][0], in_translist[2][0]),
						operation(in_translist[0][1], in_translist[1][1], in_translist[2][1])]
	return out_translist

if __name__ == '__main__':
	for x in [False, True]:
		for y in [False, True]:
			for z in [False, True]:
				print(operation(z, y, x))
