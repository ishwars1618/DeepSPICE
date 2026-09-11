def operation(a, b, c, d, e):
	return (not a and not b and not e) or (not a and not c and not e) or (not b and not c) or (not a and not d and not e) or (not c and not d)
    
def transition(in_translist):
	# in_translist[0] : initial values
	# in_translist[1] : final values
	out_translist = [operation(in_translist[0][0], in_translist[1][0], in_translist[2][0], in_translist[3][0], in_translist[4][0]),
						operation(in_translist[0][1], in_translist[1][1], in_translist[2][1], in_translist[3][1], in_translist[4][1])]
	return out_translist

if __name__ == '__main__':
	for w in [False, True]:
		for x in [False, True]:
			for y in [False, True]:
				for z in [False, True]:
					for v in [False, True]:
						print(operation(w, x, y, z, v))
