A = [1 2 3; 4 7 8];
B = [6 4 2; 3 5 7];

data_3d = cat(3, A, B)

max_data_3d = max(data_3d, [], 3)