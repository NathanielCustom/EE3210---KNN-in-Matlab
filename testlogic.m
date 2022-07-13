a = [ 1 2 3 4 5 6 7 8 9; 1 2 3 4 5 6 7 8 9; 1 2 3 4 5 6 7 8 9]
b = reshape(a', 3,3,3);
c = reshape(a', [3,3,3]);
d = permute(c, [2, 1, 3]);

size(a,1)
