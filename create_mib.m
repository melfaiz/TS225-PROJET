function MIB = create_mib(Im)

h = size(Im,1);

w = size(Im,2);

M = zeros(h,w);
I = Im;

B =[w,h];

MIB = {M,I,B};


end
