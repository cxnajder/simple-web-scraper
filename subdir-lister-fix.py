#!/usr/bin/python3
import sys
subdir_file = open("temp.txt", "r+")
if subdir_file.readable():
	subdir_list = subdir_file.readlines()
	for i in range(len(subdir_list)):
		if '\n' in subdir_list[i]:
			subdir_list[i] = subdir_list[i].replace('\n', '')
	if len(sys.argv) == 2:
		original_link = sys.argv[1]
		for j in range(len(subdir_list)):
			for i in range(len(original_link)):
				if i >= original_link.rindex('/'):
					break
				if original_link[i:] in subdir_list[j]:
					subdir_list[j] = subdir_list[j].replace(original_link[i:], "", 1)
					break
	for i in subdir_list:
		print(i)
subdir_file.close()
