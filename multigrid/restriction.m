function rv = restriction(v)
%F->D

for i=1:length(v);
	if mod(i,2) == 1
		rv.push_back(v[i]);
	end
end